import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../global/global_colors.dart';

class MenuHeaderAvatarWidget extends StatefulWidget {
  const MenuHeaderAvatarWidget({super.key});

  @override
  State<MenuHeaderAvatarWidget> createState() => _MenuHeaderAvatarWidgetState();
}

class _MenuHeaderAvatarWidgetState extends State<MenuHeaderAvatarWidget> {
  final GlobalColors color = GlobalColors();
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    if (user?.photoURL == '') {
      return Container(
          height: 72,
          width: 72,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: color.blueGreen,
            borderRadius: BorderRadius.circular(100),
            border: Border.all(
              width: 2,
              color: color.white,
            ),
          ),
          child: Text(
            user!.displayName![0],
            style: GoogleFonts.quicksand(
              color: color.white,
              fontSize: 36,
              fontWeight: FontWeight.w600,
            ),
          ));
    } else {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          border: Border.all(
            width: 3,
            color: color.darkOrange,
          ),
        ),
        child: ClipOval(
          child: FadeInImage.assetNetwork(
            placeholder: 'images/user-avatar.png',
            image: user?.photoURL ?? "",
            width: 62.0,
            fit: BoxFit.cover,
          ),
        ),
      );
    }
  }
}
