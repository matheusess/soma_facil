import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:soma_facil/global/global_colors.dart';
import 'package:soma_facil/stores/new_grocery/new_grocery_store.dart';

class NewGrocerytextHeaderWidget extends StatefulWidget {
  const NewGrocerytextHeaderWidget({super.key});

  @override
  State<NewGrocerytextHeaderWidget> createState() =>
      _NewGrocerytextHeaderWidgetState();
}

class _NewGrocerytextHeaderWidgetState
    extends State<NewGrocerytextHeaderWidget> {
  NewGroceryStore newGroceryStore = NewGroceryStore();
  final GlobalColors color = GlobalColors();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    newGroceryStore = Provider.of<NewGroceryStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Imagem',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color: color.cleanPurple,
                  fontWeight: FontWeight.w700,
                  fontSize: 34,
                ),
              ),
            ),
          ],
        ),
        Text(
          'Selecione o nome',
          style: GoogleFonts.nunito(
            textStyle: TextStyle(
              color: color.darkGrey,
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
        ),
        Text(
          'e o preço do produto',
          style: GoogleFonts.nunito(
            textStyle: TextStyle(
              color: color.darkGrey,
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }
}
