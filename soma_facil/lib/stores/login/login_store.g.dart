// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginStore on LoginStoreBase, Store {
  late final _$isLoadingAtom =
      Atom(name: 'LoginStoreBase.isLoading', context: context);

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

  late final _$isGoogleLoadingAtom =
      Atom(name: 'LoginStoreBase.isGoogleLoading', context: context);

  @override
  bool get isGoogleLoading {
    _$isGoogleLoadingAtom.reportRead();
    return super.isGoogleLoading;
  }

  @override
  set isGoogleLoading(bool value) {
    _$isGoogleLoadingAtom.reportWrite(value, super.isGoogleLoading, () {
      super.isGoogleLoading = value;
    });
  }

  late final _$isLoggedAtom =
      Atom(name: 'LoginStoreBase.isLogged', context: context);

  @override
  bool get isLogged {
    _$isLoggedAtom.reportRead();
    return super.isLogged;
  }

  @override
  set isLogged(bool value) {
    _$isLoggedAtom.reportWrite(value, super.isLogged, () {
      super.isLogged = value;
    });
  }

  late final _$getErrorAtom =
      Atom(name: 'LoginStoreBase.getError', context: context);

  @override
  bool get getError {
    _$getErrorAtom.reportRead();
    return super.getError;
  }

  @override
  set getError(bool value) {
    _$getErrorAtom.reportWrite(value, super.getError, () {
      super.getError = value;
    });
  }

  late final _$googleLoginAsyncAction =
      AsyncAction('LoginStoreBase.googleLogin', context: context);

  @override
  Future<void> googleLogin() {
    return _$googleLoginAsyncAction.run(() => super.googleLogin());
  }

  late final _$_checkUserAsyncAction =
      AsyncAction('LoginStoreBase._checkUser', context: context);

  @override
  Future<void> _checkUser(String uid) {
    return _$_checkUserAsyncAction.run(() => super._checkUser(uid));
  }

  late final _$_saveUserDataAsyncAction =
      AsyncAction('LoginStoreBase._saveUserData', context: context);

  @override
  Future<void> _saveUserData({required Map<String, dynamic> userData}) {
    return _$_saveUserDataAsyncAction
        .run(() => super._saveUserData(userData: userData));
  }

  late final _$logoutAsyncAction =
      AsyncAction('LoginStoreBase.logout', context: context);

  @override
  Future<void> logout() {
    return _$logoutAsyncAction.run(() => super.logout());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
isGoogleLoading: ${isGoogleLoading},
isLogged: ${isLogged},
getError: ${getError}
    ''';
  }
}
