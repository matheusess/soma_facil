import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginHeroTextWidget extends StatelessWidget {
  const LoginHeroTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Login',
          style: GoogleFonts.quicksand(
            textStyle: const TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontWeight: FontWeight.w900,
              fontSize: 42,
              letterSpacing: 1,
            ),
          ),
        ),
        Text(
          'Bora fazer uma comprinha?',
          style: GoogleFonts.barlow(
            textStyle: const TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontWeight: FontWeight.w400,
              fontSize: 14,
              letterSpacing: .5,
            ),
          ),
        ),
      ],
    );
  }
}
