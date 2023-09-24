import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soma_facil/stores/new_grocery/new_grocery_store.dart';

import '../../../../../global/global_currency_field.dart';

class NewGroceryItemPriceField extends StatefulWidget {
  const NewGroceryItemPriceField({super.key});

  @override
  State<NewGroceryItemPriceField> createState() =>
      _NewGroceryItemPriceFieldState();
}

class _NewGroceryItemPriceFieldState extends State<NewGroceryItemPriceField> {
  NewGroceryStore newGroceryStore = NewGroceryStore();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    newGroceryStore = Provider.of<NewGroceryStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    return GlobalCurrencyField(
      placeHolder: 'Preço',
      initialValue: newGroceryStore.itemPriceStr,
      keyboardType: TextInputType.number,
      controller: newGroceryStore.itemPriceController,
      setAttribute: newGroceryStore.parseItemPrice,
      isEnable: true,
    );
  }
}
