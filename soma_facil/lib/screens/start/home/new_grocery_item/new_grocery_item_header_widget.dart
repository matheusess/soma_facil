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
              'Novo Item',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color: color.orange,
                  fontWeight: FontWeight.w700,
                  fontSize: 34,
                ),
              ),
            ),
          ],
        ),
        Text(
          'Adicione um',
          style: GoogleFonts.nunito(
            textStyle: TextStyle(
              color: color.darkGrey,
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
        ),
        Text(
          'novo item',
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
