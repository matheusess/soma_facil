import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../global/global_colors.dart';
import '../new_grocery_item/new_grocery_item_screen.dart';

class NewGroceryAdditemButton extends StatefulWidget {
  const NewGroceryAdditemButton({super.key});

  @override
  State<NewGroceryAdditemButton> createState() =>
      _NewGroceryAdditemButtonState();
}

class _NewGroceryAdditemButtonState extends State<NewGroceryAdditemButton> {
  GlobalColorsLibrary color = GlobalColorsLibrary();

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
            'Adicionar item',
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
