import 'package:cloud_firestore/cloud_firestore.dart';
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
  bool isLoading = false,
      isGoogleLoading = false,
      isLogged = false,
      getError = false;

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
      print(e);
      isLoading = false;
      isGoogleLoading = false;
    }
    _checkUser(firebaseUser!.uid);
  }

  Future getGoogleuser() async {
    GoogleSignInAccount? googleUser = _googleSignIn.currentUser;
    await _googleSignIn.signInSilently();
    googleUser = (await _googleSignIn.signIn())!;
    print(googleUser);
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
  Future<void> logout() async {
    isLoading = false;
    isGoogleLoading = false;
    isLogged = false;
    await _auth.signOut();
  }
}
