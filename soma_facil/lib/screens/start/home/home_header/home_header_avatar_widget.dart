import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:soma_facil/global/global_colors.dart';

class HomeHeaderAvatarWidget extends StatefulWidget {
  const HomeHeaderAvatarWidget({super.key});

  @override
  State<HomeHeaderAvatarWidget> createState() => _HomeHeaderAvatarWidgetState();
}

class _HomeHeaderAvatarWidgetState extends State<HomeHeaderAvatarWidget> {
  final GlobalColors color = GlobalColors();
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    if (user?.photoURL == '') {
      return Container(
          height: 82,
          width: 82,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: color.blueGreen,
            borderRadius: BorderRadius.circular(100),
            border: Border.all(
              width: 3,
              color: color.blueGreen,
            ),
          ),
          child: Text(
            user!.displayName![0],
            style: GoogleFonts.nunito(
              color: color.white,
              fontSize: 36,
              fontWeight: FontWeight.w600,
            ),
          )
          /*child: Icon(
          Icons.person_2,
          color: color.white,
          size: 58,
        ),*/
          );
    } else {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          border: Border.all(
            width: 3,
            color: color.blueGreen,
          ),
        ),
        child: ClipOval(
          child: FadeInImage.assetNetwork(
            placeholder: 'images/user-avatar.png',
            image: user?.photoURL ?? "",
            width: 78.0,
            fit: BoxFit.cover,
          ),
        ),
      );
    }
  }
}
