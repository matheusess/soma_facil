import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../global/global_colors.dart';
import '../../../../stores/new_grocery/new_grocery_store.dart';

class NewGroceryNoDataWidget extends StatefulWidget {
  const NewGroceryNoDataWidget({super.key});

  @override
  State<NewGroceryNoDataWidget> createState() => _NewGroceryNoDataWidgetState();
}

class _NewGroceryNoDataWidgetState extends State<NewGroceryNoDataWidget> {
  NewGroceryStore newGroceryStore = NewGroceryStore();
  final GlobalColors color = GlobalColors();

  final SizedBox _vSpace = const SizedBox(height: 38);
  final SizedBox _vSpace2 = const SizedBox(height: 20);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _vSpace,
            Image.asset(
              'images/empty-grocery-list.png',
              scale: 5,
            ),
            _vSpace2,
            Text(
              'Ops!',
              style: GoogleFonts.nunito(
                textStyle: TextStyle(
                  color: color.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ),
            Text(
              'Parece que a lista está vazia.',
              style: GoogleFonts.nunito(
                textStyle: TextStyle(
                  color: color.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
