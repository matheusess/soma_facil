import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';
import 'package:soma_facil/model/grocery/grocery_model.dart';
part 'grocery_store.g.dart';

class GroceryStore = GroceryStoreBase with _$GroceryStore;

abstract class GroceryStoreBase with Store {
  /*

  @Variables

  */
  @observable
  bool isLoading = false;

  @observable
  ObservableList<GroceryModel> groceriesList = ObservableList.of([]);

  /*

  **Firebase methods

  */

  @action
  Future<ObservableList<GroceryModel>> getAllGroceries({
    required String uId,
  }) async {
    clearGroceciresList();
    await FirebaseFirestore.instance
        .collection('users/$uId/groceries')
        .get()
        .then((groceries) => {
              if (groceries.docs.isNotEmpty)
                {
                  for (var grocery in groceries.docs.toList())
                    {
                      groceriesList.add(
                        GroceryModel(
                          id: grocery.id,
                          groceryName: grocery['grocery_name'],
                          itemsList: grocery['items_list'],
                          itemsTotal: grocery['items_total'],
                          totalPurchaseAmount: grocery['total_purchase_amount'],
                          createdAt: grocery['created_at'],
                        ),
                      ),
                    }
                }
              else
                {
                  groceriesList = ObservableList.of([]),
                }
            });

    return groceriesList;
  }

  @action
  void clearGroceciresList() {
    groceriesList.clear();
  }
}
