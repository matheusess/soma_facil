import 'dart:io';

import 'package:mobx/mobx.dart';
part 'new_item_model.g.dart';

class NewItemModel = NewItemModelBase with _$NewItemModel;

abstract class NewItemModelBase with Store {
  NewItemModelBase({
    required this.productImage,
    required this.productName,
    required this.productQuantity,
    required this.productPrice,
    required this.productTotalPrice,
  });

  File? productImage;
  String productName;
  double productPrice;
  int productQuantity;
  double productTotalPrice;
}
