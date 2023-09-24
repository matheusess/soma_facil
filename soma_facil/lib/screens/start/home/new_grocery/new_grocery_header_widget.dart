import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../global/global_colors.dart';

class NewGroceryHeaderWidget extends StatefulWidget {
  const NewGroceryHeaderWidget({super.key});

  @override
  State<NewGroceryHeaderWidget> createState() => _NewGroceryHeaderWidgetState();
}

class _NewGroceryHeaderWidgetState extends State<NewGroceryHeaderWidget> {
  GlobalColors color = GlobalColors();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Compra',
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              color: color.darkOrange,
              fontWeight: FontWeight.w700,
              fontSize: 34,
            ),
          ),
        ),
        Text(
          'Bora fazer',
          style: GoogleFonts.nunito(
            textStyle: TextStyle(
              color: color.black,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ),
        Text(
          'uma nova compra?',
          style: GoogleFonts.nunito(
            textStyle: TextStyle(
              color: color.black,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
