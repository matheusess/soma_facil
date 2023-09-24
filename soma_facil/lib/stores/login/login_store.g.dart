// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginStore on LoginStoreBase, Store {
  Computed<bool>? _$isNameValidComputed;

  @override
  bool get isNameValid =>
      (_$isNameValidComputed ??= Computed<bool>(() => super.isNameValid,
              name: 'LoginStoreBase.isNameValid'))
          .value;
  Computed<bool>? _$isEmailValidComputed;

  @override
  bool get isEmailValid =>
      (_$isEmailValidComputed ??= Computed<bool>(() => super.isEmailValid,
              name: 'LoginStoreBase.isEmailValid'))
          .value;
  Computed<bool>? _$isPasswordValidComputed;

  @override
  bool get isPasswordValid =>
      (_$isPasswordValidComputed ??= Computed<bool>(() => super.isPasswordValid,
              name: 'LoginStoreBase.isPasswordValid'))
          .value;
  Computed<bool>? _$isConfirmedPasswordValidComputed;

  @override
  bool get isConfirmedPasswordValid => (_$isConfirmedPasswordValidComputed ??=
          Computed<bool>(() => super.isConfirmedPasswordValid,
              name: 'LoginStoreBase.isConfirmedPasswordValid'))
      .value;
  Computed<bool>? _$hasOneUpperCaseComputed;

  @override
  bool get hasOneUpperCase =>
      (_$hasOneUpperCaseComputed ??= Computed<bool>(() => super.hasOneUpperCase,
              name: 'LoginStoreBase.hasOneUpperCase'))
          .value;
  Computed<bool>? _$hasSpecialCharacterComputed;

  @override
  bool get hasSpecialCharacter => (_$hasSpecialCharacterComputed ??=
          Computed<bool>(() => super.hasSpecialCharacter,
              name: 'LoginStoreBase.hasSpecialCharacter'))
      .value;
  Computed<bool>? _$hasNumberCharacterComputed;

  @override
  bool get hasNumberCharacter => (_$hasNumberCharacterComputed ??=
          Computed<bool>(() => super.hasNumberCharacter,
              name: 'LoginStoreBase.hasNumberCharacter'))
      .value;
  Computed<bool>? _$hasMinimumCharacterComputed;

  @override
  bool get hasMinimumCharacter => (_$hasMinimumCharacterComputed ??=
          Computed<bool>(() => super.hasMinimumCharacter,
              name: 'LoginStoreBase.hasMinimumCharacter'))
      .value;
  Computed<bool>? _$isLoginValidComputed;

  @override
  bool get isLoginValid =>
      (_$isLoginValidComputed ??= Computed<bool>(() => super.isLoginValid,
              name: 'LoginStoreBase.isLoginValid'))
          .value;
  Computed<bool>? _$isNewUserValidComputed;

  @override
  bool get isNewUserValid =>
      (_$isNewUserValidComputed ??= Computed<bool>(() => super.isNewUserValid,
              name: 'LoginStoreBase.isNewUserValid'))
          .value;

  late final _$nameAtom = Atom(name: 'LoginStoreBase.name', context: context);

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$emailAtom = Atom(name: 'LoginStoreBase.email', context: context);

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: 'LoginStoreBase.password', context: context);

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$confirmPasswordAtom =
      Atom(name: 'LoginStoreBase.confirmPassword', context: context);

  @override
  String get confirmPassword {
    _$confirmPasswordAtom.reportRead();
    return super.confirmPassword;
  }

  @override
  set confirmPassword(String value) {
    _$confirmPasswordAtom.reportWrite(value, super.confirmPassword, () {
      super.confirmPassword = value;
    });
  }

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

  late final _$getSuccessAtom =
      Atom(name: 'LoginStoreBase.getSuccess', context: context);

  @override
  bool get getSuccess {
    _$getSuccessAtom.reportRead();
    return super.getSuccess;
  }

  @override
  set getSuccess(bool value) {
    _$getSuccessAtom.reportWrite(value, super.getSuccess, () {
      super.getSuccess = value;
    });
  }

  late final _$isPasswordObscureAtom =
      Atom(name: 'LoginStoreBase.isPasswordObscure', context: context);

  @override
  bool get isPasswordObscure {
    _$isPasswordObscureAtom.reportRead();
    return super.isPasswordObscure;
  }

  @override
  set isPasswordObscure(bool value) {
    _$isPasswordObscureAtom.reportWrite(value, super.isPasswordObscure, () {
      super.isPasswordObscure = value;
    });
  }

  late final _$isConfirmPasswordObscureAtom =
      Atom(name: 'LoginStoreBase.isConfirmPasswordObscure', context: context);

  @override
  bool get isConfirmPasswordObscure {
    _$isConfirmPasswordObscureAtom.reportRead();
    return super.isConfirmPasswordObscure;
  }

  @override
  set isConfirmPasswordObscure(bool value) {
    _$isConfirmPasswordObscureAtom
        .reportWrite(value, super.isConfirmPasswordObscure, () {
      super.isConfirmPasswordObscure = value;
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

  late final _$recoveryPasswordAsyncAction =
      AsyncAction('LoginStoreBase.recoveryPassword', context: context);

  @override
  Future<void> recoveryPassword() {
    return _$recoveryPasswordAsyncAction.run(() => super.recoveryPassword());
  }

  late final _$logoutAsyncAction =
      AsyncAction('LoginStoreBase.logout', context: context);

  @override
  Future<void> logout() {
    return _$logoutAsyncAction.run(() => super.logout());
  }

  late final _$clearUserDataAsyncAction =
      AsyncAction('LoginStoreBase.clearUserData', context: context);

  @override
  Future<void> clearUserData() {
    return _$clearUserDataAsyncAction.run(() => super.clearUserData());
  }

  late final _$LoginStoreBaseActionController =
      ActionController(name: 'LoginStoreBase', context: context);

  @override
  void setName(String value) {
    final _$actionInfo = _$LoginStoreBaseActionController.startAction(
        name: 'LoginStoreBase.setName');
    try {
      return super.setName(value);
    } finally {
      _$LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String value) {
    final _$actionInfo = _$LoginStoreBaseActionController.startAction(
        name: 'LoginStoreBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$LoginStoreBaseActionController.startAction(
        name: 'LoginStoreBase.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setConfirmationPassword(String value) {
    final _$actionInfo = _$LoginStoreBaseActionController.startAction(
        name: 'LoginStoreBase.setConfirmationPassword');
    try {
      return super.setConfirmationPassword(value);
    } finally {
      _$LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPasswordObscure() {
    final _$actionInfo = _$LoginStoreBaseActionController.startAction(
        name: 'LoginStoreBase.setPasswordObscure');
    try {
      return super.setPasswordObscure();
    } finally {
      _$LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setConfirmPasswordObscure() {
    final _$actionInfo = _$LoginStoreBaseActionController.startAction(
        name: 'LoginStoreBase.setConfirmPasswordObscure');
    try {
      return super.setConfirmPasswordObscure();
    } finally {
      _$LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
email: ${email},
password: ${password},
confirmPassword: ${confirmPassword},
isLoading: ${isLoading},
isGoogleLoading: ${isGoogleLoading},
isLogged: ${isLogged},
getSuccess: ${getSuccess},
isPasswordObscure: ${isPasswordObscure},
isConfirmPasswordObscure: ${isConfirmPasswordObscure},
getError: ${getError},
isNameValid: ${isNameValid},
isEmailValid: ${isEmailValid},
isPasswordValid: ${isPasswordValid},
isConfirmedPasswordValid: ${isConfirmedPasswordValid},
hasOneUpperCase: ${hasOneUpperCase},
hasSpecialCharacter: ${hasSpecialCharacter},
hasNumberCharacter: ${hasNumberCharacter},
hasMinimumCharacter: ${hasMinimumCharacter},
isLoginValid: ${isLoginValid},
isNewUserValid: ${isNewUserValid}
    ''';
  }
}
