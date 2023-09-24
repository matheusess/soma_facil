import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:soma_facil/global/global_colors.dart';
import 'package:soma_facil/global/global_rounded_icon_button.dart';
import 'package:soma_facil/stores/new_grocery/new_grocery_store.dart';

class NewGroceryQuantityButton extends StatefulWidget {
  const NewGroceryQuantityButton({super.key});

  @override
  State<NewGroceryQuantityButton> createState() =>
      _NewGroceryQuantityButtonState();
}

class _NewGroceryQuantityButtonState extends State<NewGroceryQuantityButton> {
  GlobalColors color = GlobalColors();

  NewGroceryStore newGroceryStore = NewGroceryStore();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    newGroceryStore = Provider.of<NewGroceryStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Container(
        height: 56,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color.fromARGB(255, 240, 240, 240),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FloatingActionButton.small(
                heroTag: "removeQuantity",
                onPressed: newGroceryStore.removeProductQuantity,
                backgroundColor: color.red,
                elevation: 0,
                child: const Icon(
                  Icons.remove,
                ),
              ),
              Text(
                newGroceryStore.itemQuantity.toString(),
                style: GoogleFonts.nunito(
                  textStyle: TextStyle(
                    color: color.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
              ),
              FloatingActionButton.small(
                heroTag: "addQuantity",
                onPressed: newGroceryStore.addProductQuantity,
                backgroundColor: color.green,
                elevation: 0,
                child: const Icon(
                  Icons.add,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
