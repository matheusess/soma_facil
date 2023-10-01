import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResetPasswordHeaderWidget extends StatefulWidget {
  const ResetPasswordHeaderWidget({super.key});

  @override
  State<ResetPasswordHeaderWidget> createState() =>
      _ResetPasswordHeaderWidgetState();
}

class _ResetPasswordHeaderWidgetState extends State<ResetPasswordHeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Esqueceu a senha?',
              style: GoogleFonts.quicksand(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'Insira o e-mail para o reset de senha',
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
