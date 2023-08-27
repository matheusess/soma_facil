import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:soma_facil/global/global_colors.dart';

class NewGroceryItemHeader extends StatefulWidget {
  const NewGroceryItemHeader({super.key});

  @override
  State<NewGroceryItemHeader> createState() => _NewGroceryItemHeaderState();
}

class _NewGroceryItemHeaderState extends State<NewGroceryItemHeader> {
  GlobalColors color = GlobalColors();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Novo Produto',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color: color.green,
                  fontWeight: FontWeight.w700,
                  fontSize: 34,
                ),
              ),
            ),
          ],
        ),
        Text(
          'Bora adicionar',
          style: GoogleFonts.nunito(
            textStyle: TextStyle(
              color: color.darkGrey,
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
        ),
        Text(
          'um novo item?',
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
