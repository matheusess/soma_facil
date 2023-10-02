import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:soma_facil/global/global_colors.dart';
import 'package:soma_facil/global/global_styles.dart';

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

  final GlobalColors color = GlobalColors();
  final GlobalSpaces spaces = GlobalSpaces();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    newGroceryStore = Provider.of<NewGroceryStore>(context);
    loginStore = Provider.of<LoginStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: color.cardBackground,
        borderRadius: BorderRadius.circular(16),
      ),
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sair',
              style: GoogleFonts.quicksand(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: color.red,
              ),
            ),
            spaces.hSpace,
            Icon(
              Icons.logout,
              size: 18,
              color: color.red,
            ),
          ],
        ),
      ),
    );
  }
}
