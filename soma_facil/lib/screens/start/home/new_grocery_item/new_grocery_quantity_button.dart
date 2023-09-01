import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:soma_facil/global/global_colors.dart';
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
          borderRadius: BorderRadius.circular(50),
          color: const Color.fromARGB(255, 240, 240, 240),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Material(
                color: Colors.transparent,
                child: Center(
                  child: Ink(
                    decoration: ShapeDecoration(
                      color: color.red,
                      shape: const CircleBorder(),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.remove),
                      color: Colors.white,
                      onPressed: newGroceryStore.removeProductQuantity,
                    ),
                  ),
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
              Material(
                color: Colors.transparent,
                child: Center(
                  child: Ink(
                    decoration: ShapeDecoration(
                      color: color.green,
                      shape: const CircleBorder(),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.add),
                      color: Colors.white,
                      onPressed: newGroceryStore.addProductQuantity,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
