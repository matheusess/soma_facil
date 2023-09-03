import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
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
  final TextEditingController _controller = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    newGroceryStore = Provider.of<NewGroceryStore>(context);
    _controller.text = newGroceryStore.itemName;
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
