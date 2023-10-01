import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../../../../stores/login/login_store.dart';
import '../../../../stores/new_grocery/new_grocery_store.dart';
import '../../../login/login_screen.dart';

class MenuLogoutButton extends StatefulWidget {
  const MenuLogoutButton({super.key});

  @override
  State<MenuLogoutButton> createState() => _MenuLogoutButtonState();
}

class _MenuLogoutButtonState extends State<MenuLogoutButton> {
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
    return TextButton(
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
    );
  }
}
