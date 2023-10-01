import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:soma_facil/global/global_colors.dart';
import 'package:soma_facil/global/global_styles.dart';

class MenuHeaderLogoWidget extends StatelessWidget {
  const MenuHeaderLogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalColors color = GlobalColors();
    final GlobalSpaces space = GlobalSpaces();

    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Image.asset(
          'images/icon-black.png',
          width: 38,
          color: color.black,
        ),
        space.hSpace2,
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Soma Fácil',
              style: GoogleFonts.quicksand(
                height: 1,
                fontSize: 22,
                fontWeight: FontWeight.w800,
              ),
            ),
            Text(
              'Facilitando sua compra, um item por vez!',
              overflow: TextOverflow.clip,
              maxLines: 1,
              softWrap: true,
              style: GoogleFonts.quicksand(
                height: 1,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        )
      ],
    );
  }
}
