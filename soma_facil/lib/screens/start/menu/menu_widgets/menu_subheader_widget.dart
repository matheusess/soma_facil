import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:soma_facil/stores/grocery/grocery_store.dart';

import '../../../../global/global_colors.dart';
import '../../../../global/global_styles.dart';

class MenuSubheaderWidget extends StatefulWidget {
  const MenuSubheaderWidget({super.key});

  @override
  State<MenuSubheaderWidget> createState() => _MenuSubheaderWidgetState();
}

class _MenuSubheaderWidgetState extends State<MenuSubheaderWidget> {
  final GlobalColors color = GlobalColors();
  final GlobalSpaces spaces = GlobalSpaces();

  GroceryStore groceryStore = GroceryStore();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    groceryStore = Provider.of<GroceryStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 94,
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      decoration: BoxDecoration(
        color: color.cardBackground,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Você já fez',
            style: GoogleFonts.quicksand(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: color.black,
            ),
          ),
          spaces.vSpace,
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '15',
                style: GoogleFonts.quicksand(
                  height: 1,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: color.blue,
                ),
              ),
              Text(
                ' compras com a gente',
                style: GoogleFonts.quicksand(
                  height: 1.2,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: color.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
