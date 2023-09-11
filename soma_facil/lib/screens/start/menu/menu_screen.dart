import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:soma_facil/screens/login/login_screen.dart';
import 'package:soma_facil/stores/login/login_store.dart';
import 'package:soma_facil/stores/new_grocery/new_grocery_store.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  NewGroceryStore newGroceryStore = NewGroceryStore();
  LoginStore loginStore = LoginStore();
  User? user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    newGroceryStore = Provider.of<NewGroceryStore>(context);
    loginStore = Provider.of<LoginStore>(context);

    autorun((_) {
      if (!loginStore.isLogged) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () => loginStore.logout(),
          child: const Text('Logout'),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
