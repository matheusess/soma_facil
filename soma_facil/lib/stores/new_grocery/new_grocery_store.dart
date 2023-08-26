import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';

import '../../model/new_item/new_item_model.dart';
part 'new_grocery_store.g.dart';

class NewGroceryStore = NewGroceryStoreBase with _$NewGroceryStore;

abstract class NewGroceryStoreBase with Store {
  /*NewGroceryStoreBase() {
    autorun((p0) {
      if (kDebugMode) {
        print('Grocery name = $itemName');
        print('Item name = $itemName');
        print('Item price = $itemPrice');
        print('Item price totalizer = $itemPriceTotalizer');
      }
    });
  }*/

  /*

  @Variables

  */
  @observable
  String removeCaracters = '', removeDots = '';

  @observable
  String groceryName = '', itemName = '';

  @observable
  double groceryPriceTotalizer = 0, itemPriceTotalizer = 0, itemPrice = 0;

  @observable
  int itemQuantity = 1;

  @observable
  ObservableList<NewItemModel> newGroceryList =
      ObservableList<NewItemModel>.of([]);

  /*

  @Action
  @*** Price calculation
  */
  @action
  void setGroceryName(String value) => {groceryName = value};

  @action
  void setItemName(String value) => itemName = value;

  @action
  void parseItemPrice(String value) => {
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
  void addProductQuantity() {
    itemQuantity++;
    _updateItemPriceTotalizer();
  }

  @action
  void removeProductQuantity() {
    itemQuantity == 1 ? 1 : itemQuantity--;
    _updateItemPriceTotalizer();
  }

  @action
  void _updateItemPriceTotalizer() {
    itemPriceTotalizer = itemPrice * itemQuantity;
  }

  /*

  @Action
  @*** item list changes
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
