import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInHeaderWidget extends StatefulWidget {
  const SignInHeaderWidget({super.key});

  @override
  State<SignInHeaderWidget> createState() => _SignInHeaderWidgetState();
}

class _SignInHeaderWidgetState extends State<SignInHeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Criar usuário',
              style: GoogleFonts.quicksand(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'Complete as informações',
              style: GoogleFonts.quicksand(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w300,
              ),
              overflow: TextOverflow.fade,
              softWrap: true,
            ),
          ],
        ),
      ],
    );
  }
}
