import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:soma_facil/global/global_colors.dart';
import 'package:soma_facil/stores/new_grocery/new_grocery_store.dart';

import '../../../../model/new_item/new_item_model.dart';
import 'new_grocery_item_screen.dart';

class NewGroceryItemBottomButtons extends StatefulWidget {
  const NewGroceryItemBottomButtons({super.key});

  @override
  State<NewGroceryItemBottomButtons> createState() =>
      _NewGroceryItemBottomButtonsState();
}

class _NewGroceryItemBottomButtonsState
    extends State<NewGroceryItemBottomButtons> {
  final GlobalColors color = GlobalColors();
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
      color: color.white,
      padding: const EdgeInsets.only(
        left: 14,
        right: 16,
        bottom: 50,
        top: 30,
      ),
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
          Observer(
            builder: (_) => FloatingActionButton.extended(
              heroTag: "addItemButton",
              onPressed: () => newGroceryStore.isNewItemValid ||
                      newGroceryStore.isLoading
                  ? {
                      newGroceryStore.addItem(
                        NewItemModel(
                          productImage: newGroceryStore.itemImage,
                          productName: newGroceryStore.itemName,
                          productPrice: newGroceryStore.itemPrice,
                          productQuantity: newGroceryStore.itemQuantity,
                          productTotalPrice: newGroceryStore.itemPriceTotalizer,
                        ),
                      ),
                      Navigator.pop(
                        context,
                      ),
                    }
                  : null,
              backgroundColor: newGroceryStore.isNewItemValid
                  ? color.blue
                  : color.cardBackground,
              icon: newGroceryStore.isLoading
                  ? null
                  : Icon(
                      Icons.check,
                      color: newGroceryStore.isNewItemValid
                          ? color.white
                          : color.grey,
                    ),
              label: newGroceryStore.isLoading
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 27),
                      child: CircularProgressIndicator(
                        color: color.white,
                      ),
                    )
                  : Text(
                      'Adicionar',
                      style: GoogleFonts.nunito(
                        textStyle: TextStyle(
                          color: newGroceryStore.isNewItemValid
                              ? color.white
                              : color.grey,
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
