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

  late final _$groceriesLisAtom =
      Atom(name: 'GroceryStoreBase.groceriesLis', context: context);

  @override
  ObservableList<dynamic> get groceriesLis {
    _$groceriesLisAtom.reportRead();
    return super.groceriesLis;
  }

  @override
  set groceriesLis(ObservableList<dynamic> value) {
    _$groceriesLisAtom.reportWrite(value, super.groceriesLis, () {
      super.groceriesLis = value;
    });
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
groceriesLis: ${groceriesLis}
    ''';
  }
}
