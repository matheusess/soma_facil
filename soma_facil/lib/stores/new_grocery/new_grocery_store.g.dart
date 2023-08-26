// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_grocery_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NewGroceryStore on NewGroceryStoreBase, Store {
  late final _$removeCaractersAtom =
      Atom(name: 'NewGroceryStoreBase.removeCaracters', context: context);

  @override
  String get removeCaracters {
    _$removeCaractersAtom.reportRead();
    return super.removeCaracters;
  }

  @override
  set removeCaracters(String value) {
    _$removeCaractersAtom.reportWrite(value, super.removeCaracters, () {
      super.removeCaracters = value;
    });
  }

  late final _$removeDotsAtom =
      Atom(name: 'NewGroceryStoreBase.removeDots', context: context);

  @override
  String get removeDots {
    _$removeDotsAtom.reportRead();
    return super.removeDots;
  }

  @override
  set removeDots(String value) {
    _$removeDotsAtom.reportWrite(value, super.removeDots, () {
      super.removeDots = value;
    });
  }

  late final _$groceryNameAtom =
      Atom(name: 'NewGroceryStoreBase.groceryName', context: context);

  @override
  String get groceryName {
    _$groceryNameAtom.reportRead();
    return super.groceryName;
  }

  @override
  set groceryName(String value) {
    _$groceryNameAtom.reportWrite(value, super.groceryName, () {
      super.groceryName = value;
    });
  }

  late final _$itemNameAtom =
      Atom(name: 'NewGroceryStoreBase.itemName', context: context);

  @override
  String get itemName {
    _$itemNameAtom.reportRead();
    return super.itemName;
  }

  @override
  set itemName(String value) {
    _$itemNameAtom.reportWrite(value, super.itemName, () {
      super.itemName = value;
    });
  }

  late final _$groceryPriceTotalizerAtom =
      Atom(name: 'NewGroceryStoreBase.groceryPriceTotalizer', context: context);

  @override
  double get groceryPriceTotalizer {
    _$groceryPriceTotalizerAtom.reportRead();
    return super.groceryPriceTotalizer;
  }

  @override
  set groceryPriceTotalizer(double value) {
    _$groceryPriceTotalizerAtom.reportWrite(value, super.groceryPriceTotalizer,
        () {
      super.groceryPriceTotalizer = value;
    });
  }

  late final _$itemPriceTotalizerAtom =
      Atom(name: 'NewGroceryStoreBase.itemPriceTotalizer', context: context);

  @override
  double get itemPriceTotalizer {
    _$itemPriceTotalizerAtom.reportRead();
    return super.itemPriceTotalizer;
  }

  @override
  set itemPriceTotalizer(double value) {
    _$itemPriceTotalizerAtom.reportWrite(value, super.itemPriceTotalizer, () {
      super.itemPriceTotalizer = value;
    });
  }

  late final _$itemPriceAtom =
      Atom(name: 'NewGroceryStoreBase.itemPrice', context: context);

  @override
  double get itemPrice {
    _$itemPriceAtom.reportRead();
    return super.itemPrice;
  }

  @override
  set itemPrice(double value) {
    _$itemPriceAtom.reportWrite(value, super.itemPrice, () {
      super.itemPrice = value;
    });
  }

  late final _$itemQuantityAtom =
      Atom(name: 'NewGroceryStoreBase.itemQuantity', context: context);

  @override
  int get itemQuantity {
    _$itemQuantityAtom.reportRead();
    return super.itemQuantity;
  }

  @override
  set itemQuantity(int value) {
    _$itemQuantityAtom.reportWrite(value, super.itemQuantity, () {
      super.itemQuantity = value;
    });
  }

  late final _$newGroceryListAtom =
      Atom(name: 'NewGroceryStoreBase.newGroceryList', context: context);

  @override
  ObservableList<NewItemModel> get newGroceryList {
    _$newGroceryListAtom.reportRead();
    return super.newGroceryList;
  }

  @override
  set newGroceryList(ObservableList<NewItemModel> value) {
    _$newGroceryListAtom.reportWrite(value, super.newGroceryList, () {
      super.newGroceryList = value;
    });
  }

  late final _$NewGroceryStoreBaseActionController =
      ActionController(name: 'NewGroceryStoreBase', context: context);

  @override
  void setGroceryName(String value) {
    final _$actionInfo = _$NewGroceryStoreBaseActionController.startAction(
        name: 'NewGroceryStoreBase.setGroceryName');
    try {
      return super.setGroceryName(value);
    } finally {
      _$NewGroceryStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setItemName(String value) {
    final _$actionInfo = _$NewGroceryStoreBaseActionController.startAction(
        name: 'NewGroceryStoreBase.setItemName');
    try {
      return super.setItemName(value);
    } finally {
      _$NewGroceryStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void parseItemPrice(String value) {
    final _$actionInfo = _$NewGroceryStoreBaseActionController.startAction(
        name: 'NewGroceryStoreBase.parseItemPrice');
    try {
      return super.parseItemPrice(value);
    } finally {
      _$NewGroceryStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _setItemPrice(double value) {
    final _$actionInfo = _$NewGroceryStoreBaseActionController.startAction(
        name: 'NewGroceryStoreBase._setItemPrice');
    try {
      return super._setItemPrice(value);
    } finally {
      _$NewGroceryStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _setPriceTotalizer(double value) {
    final _$actionInfo = _$NewGroceryStoreBaseActionController.startAction(
        name: 'NewGroceryStoreBase._setPriceTotalizer');
    try {
      return super._setPriceTotalizer(value);
    } finally {
      _$NewGroceryStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addProductQuantity() {
    final _$actionInfo = _$NewGroceryStoreBaseActionController.startAction(
        name: 'NewGroceryStoreBase.addProductQuantity');
    try {
      return super.addProductQuantity();
    } finally {
      _$NewGroceryStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeProductQuantity() {
    final _$actionInfo = _$NewGroceryStoreBaseActionController.startAction(
        name: 'NewGroceryStoreBase.removeProductQuantity');
    try {
      return super.removeProductQuantity();
    } finally {
      _$NewGroceryStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _updateItemPriceTotalizer() {
    final _$actionInfo = _$NewGroceryStoreBaseActionController.startAction(
        name: 'NewGroceryStoreBase._updateItemPriceTotalizer');
    try {
      return super._updateItemPriceTotalizer();
    } finally {
      _$NewGroceryStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addItem(NewItemModel item) {
    final _$actionInfo = _$NewGroceryStoreBaseActionController.startAction(
        name: 'NewGroceryStoreBase.addItem');
    try {
      return super.addItem(item);
    } finally {
      _$NewGroceryStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeItem(int index) {
    final _$actionInfo = _$NewGroceryStoreBaseActionController.startAction(
        name: 'NewGroceryStoreBase.removeItem');
    try {
      return super.removeItem(index);
    } finally {
      _$NewGroceryStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _updateTotal() {
    final _$actionInfo = _$NewGroceryStoreBaseActionController.startAction(
        name: 'NewGroceryStoreBase._updateTotal');
    try {
      return super._updateTotal();
    } finally {
      _$NewGroceryStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
removeCaracters: ${removeCaracters},
removeDots: ${removeDots},
groceryName: ${groceryName},
itemName: ${itemName},
groceryPriceTotalizer: ${groceryPriceTotalizer},
itemPriceTotalizer: ${itemPriceTotalizer},
itemPrice: ${itemPrice},
itemQuantity: ${itemQuantity},
newGroceryList: ${newGroceryList}
    ''';
  }
}
