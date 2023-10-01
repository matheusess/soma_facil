// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grocery_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GroceryStore on GroceryStoreBase, Store {
  late final _$isLoadingAtom =
      Atom(name: 'GroceryStoreBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$groceriesListAtom =
      Atom(name: 'GroceryStoreBase.groceriesList', context: context);

  @override
  ObservableList<GroceryModel> get groceriesList {
    _$groceriesListAtom.reportRead();
    return super.groceriesList;
  }

  @override
  set groceriesList(ObservableList<GroceryModel> value) {
    _$groceriesListAtom.reportWrite(value, super.groceriesList, () {
      super.groceriesList = value;
    });
  }

  late final _$getAllGroceriesAsyncAction =
      AsyncAction('GroceryStoreBase.getAllGroceries', context: context);

  @override
  Future<ObservableList<GroceryModel>> getAllGroceries({required String uId}) {
    return _$getAllGroceriesAsyncAction
        .run(() => super.getAllGroceries(uId: uId));
  }

  late final _$GroceryStoreBaseActionController =
      ActionController(name: 'GroceryStoreBase', context: context);

  @override
  void clearGroceciresList() {
    final _$actionInfo = _$GroceryStoreBaseActionController.startAction(
        name: 'GroceryStoreBase.clearGroceciresList');
    try {
      return super.clearGroceciresList();
    } finally {
      _$GroceryStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
groceriesList: ${groceriesList}
    ''';
  }
}
