import 'dart:io';

import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../model/new_item/new_item_model.dart';
part 'new_grocery_store.g.dart';

class NewGroceryStore = NewGroceryStoreBase with _$NewGroceryStore;

abstract class NewGroceryStoreBase with Store {
  /*

  @Variables

  */
  @observable
  String removeCaracters = '', removeDots = '';

  @observable
  String groceryName = '',
      itemPriceStr = '',
      itemName = '',
      itemPriceTotalizerStr = "0,00";

  @observable
  double groceryPriceTotalizer = 0, itemPriceTotalizer = 0, itemPrice = 0;

  @observable
  int itemQuantity = 1;

  @observable
  late File productImage;

  @observable
  ObservableList<NewItemModel> newGroceryList =
      ObservableList<NewItemModel>.of([]);

  @action
  void setImageFile(File value) => productImage = value;

  /*

  @Action
  @*** Price calculation
  */
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
    groceryPriceTotalizer = 0.0;
    for (var i = 0; i < newGroceryList.length; i++) {
      groceryPriceTotalizer += newGroceryList[i].productTotalPrice;
    }
  }
}
