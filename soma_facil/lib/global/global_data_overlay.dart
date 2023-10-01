import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:soma_facil/global/global_colors.dart';
import 'package:soma_facil/global/global_styles.dart';
import 'package:soma_facil/stores/new_grocery/new_grocery_store.dart';

class GlobalDataOverlay extends StatefulWidget {
  const GlobalDataOverlay({super.key});

  @override
  State<GlobalDataOverlay> createState() => _GlobalDataOverlayState();
}

class _GlobalDataOverlayState extends State<GlobalDataOverlay> {
  final GlobalColors color = GlobalColors();
  final GlobalSpaces space = GlobalSpaces();

  NewGroceryStore newGroceryStore = NewGroceryStore();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    newGroceryStore = Provider.of<NewGroceryStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: const Color.fromARGB(186, 0, 0, 0),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
            child: const Opacity(
              opacity: 0.8,
              child: ModalBarrier(dismissible: false, color: Colors.black),
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DefaultTextStyle(
              style: GoogleFonts.quicksand(
                fontSize: 22,
                color: color.white,
              ),
              child: const Text('Carregando'),
            ),
            space.vSpace6,
            SpinKitRing(
              color: color.white,
              size: 42,
              lineWidth: 4,
            ),
            space.vSpace6,
            DefaultTextStyle(
              style: GoogleFonts.quicksand(
                fontSize: 16,
                color: color.white,
              ),
              child: const Text('Salvando sua compra na nuvem'),
            ),
          ],
        ),
      ],
    );
  }
}
