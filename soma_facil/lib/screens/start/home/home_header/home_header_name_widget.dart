import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:soma_facil/global/global_colors.dart';

class HomeHeaderNameWidget extends StatefulWidget {
  const HomeHeaderNameWidget({super.key});

  @override
  State<HomeHeaderNameWidget> createState() => _HomeHeaderNameWidgetState();
}

class _HomeHeaderNameWidgetState extends State<HomeHeaderNameWidget> {
  final GlobalColors color = GlobalColors();
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Olá,',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.quicksand(
                textStyle: TextStyle(
                  color: color.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Text(
              user?.displayName ?? "Carregando... ",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.quicksand(
                textStyle: TextStyle(
                  color: color.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
