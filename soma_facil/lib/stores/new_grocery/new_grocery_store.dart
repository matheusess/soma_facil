import 'package:mobx/mobx.dart';

import '../../model/new_item/new_item_model.dart';
part 'new_grocery_store.g.dart';

class NewGroceryStore = NewGroceryStoreBase with _$NewGroceryStore;

abstract class NewGroceryStoreBase with Store {
  /*

  @Variables

  */
  @observable
  String groceryName = '';

  @observable
  double priceTotalizer = 0.0;

  @observable
  ObservableList<NewItemModel> newGroceryList =
      ObservableList<NewItemModel>.of([]);

  /*

  @Action

  */
  @action
  void setGroceryName(String value) => value = groceryName;

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
    priceTotalizer = 0.0;
    for (var i = 0; i < newGroceryList.length; i++) {
      priceTotalizer += newGroceryList[i].productTotalPrice;
    }
  }
}
