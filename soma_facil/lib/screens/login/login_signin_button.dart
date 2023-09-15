import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:soma_facil/global/global_colors.dart';
import 'package:soma_facil/screens/login/sign_in/sign_in_screen.dart';

class LoginSignInButton extends StatefulWidget {
  const LoginSignInButton({super.key});

  @override
  State<LoginSignInButton> createState() => _LoginSignInButtonState();
}

class _LoginSignInButtonState extends State<LoginSignInButton> {
  GlobalColors color = GlobalColors();

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SignInScreen()),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Ainda não tem conta? ',
            style: GoogleFonts.quicksand(
              textStyle: TextStyle(
                color: color.black,
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
          ),
          Text(
            'Crie já!',
            style: GoogleFonts.quicksand(
              textStyle: TextStyle(
                color: color.orangeDark,
                fontWeight: FontWeight.w800,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
