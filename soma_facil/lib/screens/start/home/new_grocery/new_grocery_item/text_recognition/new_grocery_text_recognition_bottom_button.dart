import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:soma_facil/global/global_colors.dart';
import 'package:soma_facil/global/global_styles.dart';
import 'package:soma_facil/stores/new_grocery/new_grocery_store.dart';

class NewGroceryTextRecognitionBottomButton extends StatefulWidget {
  const NewGroceryTextRecognitionBottomButton({super.key});

  @override
  State<NewGroceryTextRecognitionBottomButton> createState() =>
      _NewGroceryTextRecognitionBottomButtonState();
}

class _NewGroceryTextRecognitionBottomButtonState
    extends State<NewGroceryTextRecognitionBottomButton> {
  GlobalColors color = GlobalColors();
  GlobalSpaces space = GlobalSpaces();

  NewGroceryStore newGroceryStore = NewGroceryStore();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    newGroceryStore = Provider.of<NewGroceryStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: color.black,
      padding: const EdgeInsets.only(
        left: 30,
        right: 0,
        bottom: 30,
        top: 30,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FloatingActionButton(
            heroTag: "backButton",
            onPressed: () => {
              newGroceryStore.clearGroceryData(),
              Navigator.pop(
                context,
              ),
            },
            backgroundColor: color.red,
            child: const Icon(Icons.arrow_back),
          ),
          Observer(
            builder: (_) => FloatingActionButton.extended(
              heroTag: "addItemButton",
              onPressed: () => Navigator.pop(
                context,
              ),
              backgroundColor: color.blue,
              icon: newGroceryStore.isLoading
                  ? null
                  : Icon(
                      Icons.check,
                      color: color.white,
                    ),
              label: Text(
                'Adicionar',
                style: GoogleFonts.quicksand(
                  textStyle: TextStyle(
                    color: color.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
