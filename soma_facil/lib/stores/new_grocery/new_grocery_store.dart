import 'dart:io';

import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:mobx/mobx.dart';

import '../../model/new_item/new_item_model.dart';

part 'new_grocery_store.g.dart';

class NewGroceryStore = NewGroceryStoreBase with _$NewGroceryStore;

abstract class NewGroceryStoreBase with Store {
  /*

  @Variables

  */

  @observable
  bool isLoading = false;

  @observable
  String removeCaracters = '', removeDots = '';

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
  ObservableList reconizedTextList = ObservableList.of([]);

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

  /*

  @Action
  @*** Price calculation
  */
  @action
  void setImageFile(File value) => itemImage = value;

  @action
  void setGroceryName(String value) => groceryName = value;

  @action
  void setItemName(String value) => itemName = value;

  @action
  void parseItemPrice(String value) => {
        itemPriceStr = value,
        removeCaracters = value.replaceAll(RegExp('[R\$.]'), ''),
        removeDots = removeCaracters.replaceAll(RegExp(','), '.'),
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
    _updateTotal();
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
    _clearItemData();
    isLoading = false;
  }

  @action
  Future<List> recognizedText() async {
    isLoading = true;

    var textRecognizer = TextRecognizer();
    reconizedTextList.clear();

    final image = InputImage.fromFile(File(itemImage!.path));
    final recognized = await textRecognizer.processImage(image);

    for (var texts in recognized.blocks) {
      print(texts.text.characters);
      reconizedTextList.add(texts.text.characters);
    }
    isLoading = false;
    return recognized.blocks;
  }

  @action
  void imageClear() {
    itemImage = null;
  }

  @action
  void _clearItemData() {
    itemName = '';
    itemPrice = 0.0;
    itemPriceStr = 'R\$ 0,00';
    itemPriceTotalizer = 0.0;
    itemPriceTotalizerStr = '0,00';
    itemQuantity = 1;
    itemImage = null;
  }
}
