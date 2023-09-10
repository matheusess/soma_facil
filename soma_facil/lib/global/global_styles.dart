// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:soma_facil/global/global_colors.dart';

final GlobalColors color = GlobalColors();

class GlobalSpaces {
  final SizedBox vSpace = const SizedBox(height: 8);
  final SizedBox vSpace2 = const SizedBox(height: 12);
  final SizedBox vSpace3 = const SizedBox(height: 16);
  final SizedBox vSpace4 = const SizedBox(height: 24);
  final SizedBox vSpace5 = const SizedBox(height: 32);
  final SizedBox vSpace6 = const SizedBox(height: 38);
  final SizedBox vSpace7 = const SizedBox(height: 44);
  final SizedBox vSpace8 = const SizedBox(height: 56);
  final SizedBox hSpace = const SizedBox(width: 8);
  final SizedBox hSpace2 = const SizedBox(width: 12);
  final SizedBox hSpace3 = const SizedBox(width: 16);
  final SizedBox hSpace4 = const SizedBox(width: 24);
  final SizedBox hSpace5 = const SizedBox(width: 32);
  final SizedBox hSpace6 = const SizedBox(width: 38);
  final SizedBox hSpace7 = const SizedBox(width: 44);
  final SizedBox hSpace8 = const SizedBox(width: 56);
}

class GlobalTextStyle {
  final textHeader = GoogleFonts.nunito(
    textStyle: TextStyle(
      color: color.black,
      fontWeight: FontWeight.w600,
      fontSize: 14,
    ),
  );
  final cardHeader = GoogleFonts.nunito(
    textStyle: TextStyle(
      color: color.black,
      fontWeight: FontWeight.w800,
      fontSize: 14,
    ),
  );

  final cardSubHeader = GoogleFonts.nunito(
    textStyle: TextStyle(
      color: color.black,
      fontWeight: FontWeight.w600,
      fontSize: 14,
    ),
  );

  final cardValue = GoogleFonts.nunito(
    textStyle: TextStyle(
      color: color.black,
      fontWeight: FontWeight.w400,
      fontSize: 14,
    ),
  );

  final cardValueHighLight = GoogleFonts.nunito(
    textStyle: TextStyle(
      color: color.black,
      fontWeight: FontWeight.w600,
      fontSize: 14,
    ),
  );

  final cardValueHighLightLarge = GoogleFonts.nunito(
    textStyle: TextStyle(
      color: color.black,
      fontWeight: FontWeight.w700,
      fontSize: 22,
    ),
  );
}
