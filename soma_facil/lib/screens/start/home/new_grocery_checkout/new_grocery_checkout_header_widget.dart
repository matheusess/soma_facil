import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:soma_facil/global/global_colors.dart';

class NewGroceryCheckoutHeaderWidget extends StatefulWidget {
  const NewGroceryCheckoutHeaderWidget({super.key});

  @override
  State<NewGroceryCheckoutHeaderWidget> createState() =>
      _NewGroceryCheckoutHeaderWidgetState();
}

class _NewGroceryCheckoutHeaderWidgetState
    extends State<NewGroceryCheckoutHeaderWidget> {
  final GlobalColors color = GlobalColors();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Checkout',
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              color: color.orangeDark,
              fontWeight: FontWeight.w700,
              fontSize: 34,
            ),
          ),
        ),
        Text(
          'Vamos conferir',
          style: GoogleFonts.nunito(
            textStyle: TextStyle(
              color: color.darkGrey,
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
        ),
        Text(
          'o valor dos produtos',
          style: GoogleFonts.nunito(
            textStyle: TextStyle(
              color: color.darkGrey,
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }
}
