import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../global/global_colors.dart';
import '../../../../global/global_styles.dart';
import 'new_grocery_checkout/new_grocery_checkout_screen.dart';
import 'new_grocery_item/new_grocery_item_screen.dart';

class NewGroceryAdditemButton extends StatefulWidget {
  const NewGroceryAdditemButton({super.key});

  @override
  State<NewGroceryAdditemButton> createState() =>
      _NewGroceryAdditemButtonState();
}

class _NewGroceryAdditemButtonState extends State<NewGroceryAdditemButton> {
  GlobalColors color = GlobalColors();
  User? user = FirebaseAuth.instance.currentUser;

  final GlobalSpaces spaces = GlobalSpaces();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton.icon(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const NewGroceryItemScreen(),
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: color.green,
          ),
          icon: const Icon(
            Icons.add_shopping_cart,
            color: Colors.white,
          ),
          label: Text(
            'Adicionar itemmm',
            style: GoogleFonts.nunito(
              textStyle: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ),
        ),
      ],
    );
  }

  
}
