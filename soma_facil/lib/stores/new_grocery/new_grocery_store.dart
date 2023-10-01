import 'dart:io';

import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

import '../../model/new_item/new_item_model.dart';

part 'new_grocery_store.g.dart';

class NewGroceryStore = NewGroceryStoreBase with _$NewGroceryStore;

abstract class NewGroceryStoreBase with Store {
  late Reference reference;
  late UploadTask uploadTask;
  /*

  @Variables

  */

  @observable
  TextEditingController itemNameController = TextEditingController();

  @observable
  TextEditingController itemPriceController = TextEditingController();

  @observable
  bool isLoading = false,
      isPriceInvalid = false,
      routedImageScreen = false,
      success = false,
      error = false;

  @observable
  String removeCharacter = '', removeDots = '';

  @observable
  String groceryName = '',
      itemPriceStr = 'R\$ 0,00',
      itemName = '',
      itemPriceTotalizerStr = "0,00";

  @observable
  double groceryPriceTotalizer = 0, itemPriceTotalizer = 0, itemPrice = 0;

  @observable
  int itemQuantity = 1;

  @observable
  File? itemImage;

  @observable
  ObservableList<NewItemModel> newGroceryList =
      ObservableList<NewItemModel>.of([]);

  @observable
  ObservableList reconizedNameList = ObservableList.of([]);

  @observable
  ObservableList reconizedPriceList = ObservableList.of([]);

  /* 
  
  @Computed
  @****** Validation
  
  */
  @computed
  bool get isItemNameValid => itemName.isNotEmpty;

  @computed
  bool get isItemPriceValid => itemPrice > 0.0;

  @computed
  bool get isNewItemValid => isItemNameValid && isItemPriceValid;

  @computed
  bool get isCheckoutValid =>
      newGroceryList.isNotEmpty && groceryName.isNotEmpty;

  @computed
  bool get isNewGroceyValid =>
      newGroceryList.isNotEmpty && groceryName.isNotEmpty;

  /*

  @Action
  @*** Price calculation
  */
  @action
  void setImageFile(File value) => {
        routedImageScreen = true,
        itemImage = value,
      };

  @action
  void setRoutedImageScreen() => routedImageScreen = false;

  @action
  void setGroceryName(String value) => groceryName = value;

  @action
  void setItemName(String value) => itemName = value;

  @action
  void setItemNameFromImage(String value) => {
        itemNameController.text = value,
        itemName = value,
      };

  @action
  void parseItemPriceFromImage(String value) {
    bool isParsedPrice = RegExp('[0-9]').hasMatch(value);
    bool hasComma = RegExp(',').hasMatch(value);

    if (isParsedPrice && hasComma) {
      removeCharacter = value.replaceAll(RegExp(r'[a-zA-Z ]'), '');
      removeDots = removeCharacter.replaceAll(RegExp(','), '.');

      itemPriceController.text = removeDots;
      itemPriceStr = 'R\$ $removeDots';
      _setItemPrice(double.parse(removeDots));
    } else {
      isPriceInvalid = true;
    }
  }

  @action
  void parseItemPrice(String value) => {
        itemPriceStr = value,
        removeCharacter = value.replaceAll(RegExp('[R\$.]'), ''),
        removeDots = removeCharacter.replaceAll(RegExp(','), '.'),
        _setItemPrice(double.parse(removeDots)),
        _updateItemPriceTotalizer(),
      };

  @action
  void _setItemPrice(double value) => itemPrice = value;

  @action
  void _setPriceTotalizer(double value) => itemPriceTotalizer = value;

  @action
  void addProductQuantity() => {
        itemQuantity++,
        _updateItemPriceTotalizer(),
      };

  @action
  void removeProductQuantity() => {
        itemQuantity == 1 ? 1 : itemQuantity--,
        _updateItemPriceTotalizer(),
      };

  @action
  void _updateItemPriceTotalizer() => {
        itemPriceTotalizer = itemPrice * itemQuantity,
        itemPriceTotalizerStr = UtilBrasilFields.obterReal(
          itemPriceTotalizer,
          moeda: false,
        ),
      };

  /*

  @Action
  @*** List item handle
  */

  @action
  void addItem(NewItemModel item) {
    newGroceryList.add(item);
    newGroceryList.sort(((a, b) => a.productName.compareTo(b.productName)));
    _updateTotal();
    _clearNewItem();
  }

  @action
  void removeItem(int index) {
    newGroceryList.removeAt(index);
    _updateTotal();
  }

  @action
  void _updateTotal() {
    isLoading = true;
    groceryPriceTotalizer = 0.0;
    for (var i = 0; i < newGroceryList.length; i++) {
      groceryPriceTotalizer += newGroceryList[i].productTotalPrice;
    }
    isLoading = false;
  }

  @action
  Future<void> recognizedText() async {
    isLoading = true;

    var textRecognizer = TextRecognizer();
    reconizedNameList.clear();
    reconizedPriceList.clear();

    final image = InputImage.fromFile(File(itemImage!.path));
    final recognized = await textRecognizer.processImage(image);

    for (var texts in recognized.blocks) {
      if (kDebugMode) {
        print(texts.lines);
      }
      reconizedNameList.add(texts.text.characters);
      reconizedPriceList.add(texts.text.characters);
    }
    isLoading = false;
  }

  @action
  Future<void> createNewGrocery({
    required String uId,
    required DateTime createdAt,
  }) async {
    isLoading = true;

    var items = [];

    for (var e in newGroceryList) {
      var tempMap = {};
      e.productImage == null
          ? tempMap['image'] = ''
          : tempMap['image'] = await _uploadProductImage(
              uId: uId,
              createdAt: createdAt,
              pImage: e.productImage,
              pName: e.productName,
            );
      tempMap['name'] = e.productName;
      tempMap['price'] = e.productPrice;
      tempMap['quantity'] = e.productQuantity;
      tempMap['total_price'] = e.productTotalPrice;
      items.add(tempMap);
    }

    Map<String, dynamic> newGroceryData = {
      "items_list": items,
      "grocery_name": groceryName,
      "items_total": newGroceryList.length,
      "total_purchase_amount": groceryPriceTotalizer,
      "created_at": createdAt,
    };
    await FirebaseFirestore.instance
        .collection('users/$uId/groceries')
        .add(newGroceryData)
        .then(
          (value) => {
            clearGroceryData(),
            success = true,
          },
        );
    isLoading = false;
  }

  @action
  Future<String> _uploadProductImage({
    required File? pImage,
    required String uId,
    required String pName,
    required DateTime createdAt,
  }) async {
    var imageLink = '';
    var groceryDate =
        '${groceryName.toLowerCase()}_${createdAt.millisecondsSinceEpoch}';

    var productName = pName.replaceAll(RegExp(r' '), '_').toLowerCase();

    SettableMetadata metadata = SettableMetadata(
      customMetadata: <String, String>{
        'owner_id': uId,
        'name': productName,
      },
    );

    reference = FirebaseStorage.instance
        .ref()
        .child('groceries/$uId/$groceryDate/$productName');

    final TaskSnapshot snapshot = await reference.putFile(pImage!, metadata);
    final url = await snapshot.ref.getDownloadURL();

    imageLink = url;
    return imageLink;
  }

  @action
  void imageClear() => itemImage = null;

  @action
  void _clearNewItem() {
    itemName = '';
    itemNameController.text = '';
    itemPriceController.text = '';
    itemPrice = 0.0;
    itemPriceStr = 'R\$ 0,00';
    itemPriceTotalizer = 0.0;
    itemPriceTotalizerStr = '0,00';
    itemQuantity = 1;
    itemImage = null;
  }

  @action
  void clearGroceryData() {
    itemName = '';
    itemNameController.text = '';
    itemPriceController.text = '';
    itemPrice = 0.0;
    itemPriceStr = 'R\$ 0,00';
    itemPriceTotalizer = 0.0;
    itemPriceTotalizerStr = '0,00';
    itemQuantity = 1;
    newGroceryList.clear();
    groceryPriceTotalizer = 0.0;
    groceryName = '';
  }
}
