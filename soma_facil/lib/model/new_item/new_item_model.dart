import 'dart:io';

import 'package:mobx/mobx.dart';
part 'new_item_model.g.dart';

class NewItemModel = _NewItemModelBase with _$NewItemModel;

abstract class _NewItemModelBase with Store {
  _NewItemModelBase({
    required this.productImage,
    required this.productName,
    required this.productQuantity,
    required this.productPrice,
    required this.productTotalPrice,
  });

  File productImage;
  String productName;
  double productPrice;
  double productQuantity;
  double productTotalPrice;
}
