import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../global/global_colors.dart';

class MenuHeaderUserInfoWidget extends StatefulWidget {
  const MenuHeaderUserInfoWidget({super.key});

  @override
  State<MenuHeaderUserInfoWidget> createState() =>
      _MenuHeaderUserInfoWidgetState();
}

class _MenuHeaderUserInfoWidgetState extends State<MenuHeaderUserInfoWidget> {
  final GlobalColors color = GlobalColors();
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
        Text(
          user?.email ?? "Carregando... ",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.quicksand(
            textStyle: TextStyle(
              color: color.black,
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}
