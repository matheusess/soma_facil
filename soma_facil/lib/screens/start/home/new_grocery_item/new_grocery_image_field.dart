import 'package:flutter/material.dart';

import '../../../../global/global_colors.dart';

class NewGroceryImageField extends StatefulWidget {
  const NewGroceryImageField({super.key});

  @override
  State<NewGroceryImageField> createState() => _NewGroceryImageFieldState();
}

class _NewGroceryImageFieldState extends State<NewGroceryImageField> {
  GlobalColorsLibrary color = GlobalColorsLibrary();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 96,
      width: double.infinity,
      decoration: BoxDecoration(
        color: color.lemon,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Image.asset(
          'images/shopping-list-icon-bold.png',
        ),
      ),
    );
  }
}
