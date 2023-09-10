import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:soma_facil/global/global_colors.dart';
import 'package:soma_facil/global/global_styles.dart';
import 'package:soma_facil/stores/new_grocery/new_grocery_store.dart';

class NewGroceryCheckoutBottomButtons extends StatefulWidget {
  const NewGroceryCheckoutBottomButtons({super.key});

  @override
  State<NewGroceryCheckoutBottomButtons> createState() =>
      _NewGroceryCheckoutBottomButtonsState();
}

class _NewGroceryCheckoutBottomButtonsState
    extends State<NewGroceryCheckoutBottomButtons> {
  NewGroceryStore newGroceryStore = NewGroceryStore();

  final GlobalColors color = GlobalColors();
  final GlobalSpaces space = GlobalSpaces();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    newGroceryStore = Provider.of<NewGroceryStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FloatingActionButton(
            heroTag: "backButton",
            onPressed: () => Navigator.pop(
              context,
            ),
            backgroundColor: color.red,
            child: const Icon(Icons.arrow_back),
          ),
          FloatingActionButton.extended(
            heroTag: "addItemButton",
            onPressed: () => print('teste'),
            backgroundColor: newGroceryStore.isNewGroceyValid
                ? color.green
                : color.cardBackground,
            icon: Icon(
              Icons.shopping_bag,
              color:
                  newGroceryStore.isNewGroceyValid ? color.white : color.grey,
            ),
            label: Text(
              'Finalizar',
              style: GoogleFonts.nunito(
                textStyle: TextStyle(
                  color: newGroceryStore.isNewGroceyValid
                      ? color.white
                      : color.grey,
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
