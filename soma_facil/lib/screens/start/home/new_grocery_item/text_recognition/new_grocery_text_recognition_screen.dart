import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:soma_facil/global/global_colors.dart';
import 'package:soma_facil/stores/new_grocery/new_grocery_store.dart';

class NewGroceryTextRecognitionScreen extends StatefulWidget {
  const NewGroceryTextRecognitionScreen({super.key});

  @override
  State<NewGroceryTextRecognitionScreen> createState() =>
      _NewGroceryTextRecognitionScreenState();
}

class _NewGroceryTextRecognitionScreenState
    extends State<NewGroceryTextRecognitionScreen> {
  final GlobalColors color = GlobalColors();
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
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Text('Selecione o nome do produto'),
          Observer(
            builder: (_) => ListView.builder(
              itemCount: newGroceryStore.reconizedTextList.length,
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemBuilder: (context, index) {
                return InkWell(
                  child: Text(
                    newGroceryStore.reconizedTextList[index].toString(),
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  onTap: () => {
                    newGroceryStore.setItemName(
                      newGroceryStore.reconizedTextList[index].toString(),
                    ),
                    print(newGroceryStore.itemName),
                  },
                );
              },
            ),
          ),
          Text('Selecione o preço'),
          Observer(
            builder: (_) => ListView.builder(
              itemCount: newGroceryStore.reconizedTextList.length,
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemBuilder: (context, index) {
                return InkWell(
                  child: Text(
                    newGroceryStore.reconizedTextList[index].toString(),
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  onTap: () => print(newGroceryStore.reconizedTextList[index]),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "backButton",
        onPressed: () => Navigator.pop(
          context,
        ),
        backgroundColor: color.red,
        child: const Icon(Icons.arrow_back),
      ),
      //floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}
