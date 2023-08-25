// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_grocery_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NewGroceryStore on NewGroceryStoreBase, Store {
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

  late final _$priceTotalizerAtom =
      Atom(name: 'NewGroceryStoreBase.priceTotalizer', context: context);

  @override
  double get priceTotalizer {
    _$priceTotalizerAtom.reportRead();
    return super.priceTotalizer;
  }

  @override
  set priceTotalizer(double value) {
    _$priceTotalizerAtom.reportWrite(value, super.priceTotalizer, () {
      super.priceTotalizer = value;
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
groceryName: ${groceryName},
priceTotalizer: ${priceTotalizer},
newGroceryList: ${newGroceryList}
    ''';
  }
}
