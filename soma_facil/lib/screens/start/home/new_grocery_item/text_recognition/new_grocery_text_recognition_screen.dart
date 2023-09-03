import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:soma_facil/stores/new_grocery/new_grocery_store.dart';

class NewGroceryTextRecognitionScreen extends StatefulWidget {
  const NewGroceryTextRecognitionScreen({super.key});

  @override
  State<NewGroceryTextRecognitionScreen> createState() =>
      _NewGroceryTextRecognitionScreenState();
}

class _NewGroceryTextRecognitionScreenState
    extends State<NewGroceryTextRecognitionScreen> {
  NewGroceryStore newGroceryStore = NewGroceryStore();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    newGroceryStore = Provider.of<NewGroceryStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Selecione o texto'),
      ),
      body: Observer(
        builder: (_) => ListView.builder(
          itemCount: newGroceryStore.reconizedTextList.length,
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemBuilder: (context, index) {
            return InkWell(
              child: Text(
                newGroceryStore.reconizedTextList[index].toString(),
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              onTap: () => print(newGroceryStore.reconizedTextList[index]),
            );
          },
        ),
      ),
    );
  }
}
