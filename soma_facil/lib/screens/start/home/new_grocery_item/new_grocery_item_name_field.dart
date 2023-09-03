import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soma_facil/stores/new_grocery/new_grocery_store.dart';

import '../../../../global/global_text_field.dart';

class NewGroceryItemNameField extends StatefulWidget {
  const NewGroceryItemNameField({super.key});

  @override
  State<NewGroceryItemNameField> createState() =>
      _NewGroceryItemNameFieldState();
}

class _NewGroceryItemNameFieldState extends State<NewGroceryItemNameField> {
  NewGroceryStore newGroceryStore = NewGroceryStore();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    newGroceryStore = Provider.of<NewGroceryStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    return GlobalTextField(
      initialValue: newGroceryStore.itemName,
      placeHolder: 'Nome do produto',
      keyboardType: TextInputType.text,
      setAttribute: newGroceryStore.setItemName,
      isEnable: true,
    );
  }
}
