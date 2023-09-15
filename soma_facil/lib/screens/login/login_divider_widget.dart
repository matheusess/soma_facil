import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:soma_facil/global/global_colors.dart';

class LoginDividerWidget extends StatefulWidget {
  const LoginDividerWidget({super.key});

  @override
  State<LoginDividerWidget> createState() => _LoginDividerWidgetState();
}

class _LoginDividerWidgetState extends State<LoginDividerWidget> {
  final GlobalColors color = GlobalColors();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Container(
            height: 1,
            width: 74,
            color: Colors.black,
          ),
        ),
        Text(
          'Outras opções de login',
          style: GoogleFonts.quicksand(
            textStyle: TextStyle(
              color: color.black,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Container(
            height: 1,
            width: 74,
            color: color.black,
          ),
        ),
      ],
    );
  }
}
