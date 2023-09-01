import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:soma_facil/stores/new_grocery/new_grocery_store.dart';

class NewGroceryItemListWidget extends StatefulWidget {
  const NewGroceryItemListWidget({super.key});

  @override
  State<NewGroceryItemListWidget> createState() =>
      _NewGroceryItemListWidgetState();
}

class _NewGroceryItemListWidgetState extends State<NewGroceryItemListWidget> {
  NewGroceryStore newGroceryStore = NewGroceryStore();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    newGroceryStore = Provider.of<NewGroceryStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Observer(
          builder: (_) => ListView.builder(
            itemCount: newGroceryStore.newGroceryList.length,
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(newGroceryStore.newGroceryList[index].productName),
              );
            },
          ),
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}
