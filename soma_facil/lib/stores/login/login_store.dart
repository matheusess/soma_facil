import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'login_store.g.dart';

class LoginStore = LoginStoreBase with _$LoginStore;

abstract class LoginStoreBase with Store {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? firebaseUser;

  /*

  @Variables

  */

  @observable
  String name = '', email = '', password = '', confirmPassword = '';

  @observable
  bool isLoading = false,
      isGoogleLoading = false,
      isLogged = false,
      getSuccess = false,
      isPasswordObscure = true,
      isConfirmPasswordObscure = true,
      getError = false;

  /*
   @action
  */
  @action
  void setName(String value) => name = value;

  @action
  void setEmail(String value) => email = value;

  @action
  void setPassword(String value) => password = value;

  @action
  void setConfirmationPassword(String value) => confirmPassword = value;

  @action
  void setPasswordObscure() => isPasswordObscure = !isPasswordObscure;

  @action
  void setConfirmPasswordObscure() =>
      isConfirmPasswordObscure = !isConfirmPasswordObscure;

  /*
   @computed
  */
  @computed
  bool get isNameValid => name.length > 4;

  @computed
  bool get isEmailValid =>
      RegExp(r"^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$").hasMatch(email);

  @computed
  bool get isPasswordValid =>
      RegExp(r"^.*(?=.{9,})(?=.*\d)((?=.*[a-z]){1})((?=.*[A-Z]){1}).*$")
          .hasMatch(password);

  @computed
  bool get isConfirmedPasswordValid => confirmPassword == password;

  @computed
  bool get hasOneUpperCase => RegExp("[A-Z]").hasMatch(password);

  @computed
  bool get hasSpecialCharacter => RegExp("[!@#%^&*]").hasMatch(password);

  @computed
  bool get hasNumberCharacter => RegExp("[0-9]{2}").hasMatch(password);

  @computed
  bool get hasMinimumCharacter => password.length > 8;

  @computed
  bool get isLoginValid => password.length > 4 && isEmailValid;

  @computed
  bool get isNewUserValid =>
      isNameValid &&
      isEmailValid &&
      isPasswordValid &&
      isConfirmedPasswordValid;

  /*
  @Firebase methods
  */
  @action
  Future<void> googleLogin() async {
    isLoading = true;
    isGoogleLoading = true;

    GoogleSignInAccount gUser = await getGoogleuser();
    GoogleSignInAuthentication googleAuth = await gUser.authentication;

    try {
      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      );

      firebaseUser = (await _auth.signInWithCredential(credential)).user!;
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print(e);
      }
      isLoading = false;
      isGoogleLoading = false;
    }
    _checkUser(firebaseUser!.uid);
  }

  Future getGoogleuser() async {
    GoogleSignInAccount? googleUser = _googleSignIn.currentUser;
    await _googleSignIn.signInSilently();
    googleUser = (await _googleSignIn.signIn())!;
    if (kDebugMode) {
      print(googleUser);
    }
    return googleUser;
  }

  @action
  Future<void> _checkUser(String uid) async {
    Map<String, Object?> userData;
    await FirebaseFirestore.instance
        .collection('users')
        .doc(firebaseUser!.uid)
        .get()
        .then(
          (user) => {
            if (user.exists)
              {
                isLoading = false,
                isLogged = true,
                isGoogleLoading = false,
              }
            else
              {
                userData = {
                  'id': firebaseUser!.uid,
                  'name': firebaseUser!.displayName,
                  'email': firebaseUser!.email,
                },
                _saveUserData(userData: userData),
              }
          },
        );
  }

  @action
  Future<void> _saveUserData({required Map<String, dynamic> userData}) async {
    isLoading = true;
    await FirebaseFirestore.instance
        .collection('users')
        .doc(firebaseUser!.uid)
        .set(userData)
        .then((value) => {
              isLogged = true,
              isLoading = false,
              isGoogleLoading = false,
            })
        .onError((error, stackTrace) => {getError = true});
    isLoading = false;
  }

  @action
  Future<void> recoveryPassword() async {
    isLoading = true;
    await _auth.sendPasswordResetEmail(email: email).then((value) {
      getSuccess = true;
    }).catchError((err) {
      getSuccess = true;
      if (kDebugMode) {
        print(err.toString());
      }
    });
    isLoading = false;
  }

  @action
  Future<void> logout() async {
    isLoading = false;
    isGoogleLoading = false;
    isLogged = false;
    await _auth.signOut();
  }

  @action
  Future<void> clearUserData() async {
    name = '';
    email = '';
    password = '';
    confirmPassword = '';
    await _auth.signOut();
  }
}
