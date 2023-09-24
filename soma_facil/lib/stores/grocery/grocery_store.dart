import 'package:mobx/mobx.dart';
part 'grocery_store.g.dart';

class GroceryStore = GroceryStoreBase with _$GroceryStore;

abstract class GroceryStoreBase with Store {
  /*

  @Variables

  */
  @observable
  bool isLoading = false;

  @observable
  ObservableList groceriesLis = ObservableList.of([]);
}
