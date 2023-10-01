import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';

part 'grocery_model.g.dart';

class GroceryModel = GroceryModelBase with _$GroceryModel;

abstract class GroceryModelBase with Store {
  GroceryModelBase({
    required this.id,
    required this.groceryName,
    required this.itemsList,
    required this.itemsTotal,
    required this.totalPurchaseAmount,
    required this.createdAt,
  });

  String id;
  String groceryName;
  List itemsList;
  int itemsTotal;
  double totalPurchaseAmount;
  Timestamp createdAt;
}
