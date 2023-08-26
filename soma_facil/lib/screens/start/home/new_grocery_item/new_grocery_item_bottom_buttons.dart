import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:soma_facil/global/global_colors.dart';

import 'new_grocery_item_screen.dart';

class NewGroceryItemBottomButtons extends StatefulWidget {
  const NewGroceryItemBottomButtons({super.key});

  @override
  State<NewGroceryItemBottomButtons> createState() =>
      _NewGroceryItemBottomButtonsState();
}

class _NewGroceryItemBottomButtonsState
    extends State<NewGroceryItemBottomButtons> {
  final GlobalColors color = GlobalColors();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: color.white,
      padding: const EdgeInsets.only(left: 14, right: 16, bottom: 50, top: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FloatingActionButton(
            heroTag: "backButton",
            onPressed: () => Navigator.pop(
              context,
            ),
            backgroundColor: color.red,
            child: const Icon(Icons.arrow_back),
          ),
          FloatingActionButton.extended(
            heroTag: "addItemButton",
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const NewGroceryItemScreen(),
              ),
            ),
            backgroundColor: color.blue,
            icon: const Icon(Icons.check),
            label: Text(
              'Adicionar',
              style: GoogleFonts.nunito(
                textStyle: TextStyle(
                  color: color.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
