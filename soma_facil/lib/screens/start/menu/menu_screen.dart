import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
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

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    newGroceryStore = Provider.of<NewGroceryStore>(context);
    loginStore = Provider.of<LoginStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () => {
            loginStore.logout(),
            Navigator.of(context, rootNavigator: true).pushReplacement(
              PageTransition(
                type: PageTransitionType.bottomToTop,
                child: const LoginScreen(),
              ),
            ),
          },
          child: const Text('Logout'),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
