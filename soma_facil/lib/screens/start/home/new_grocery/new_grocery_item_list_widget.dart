import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:soma_facil/global/global_colors.dart';
import 'package:soma_facil/global/global_styles.dart';
import 'package:soma_facil/stores/new_grocery/new_grocery_store.dart';

class NewGroceryItemListWidget extends StatefulWidget {
  const NewGroceryItemListWidget({super.key});

  @override
  State<NewGroceryItemListWidget> createState() =>
      _NewGroceryItemListWidgetState();
}

class _NewGroceryItemListWidgetState extends State<NewGroceryItemListWidget> {
  final GlobalColors color = GlobalColors();
  final GlobalSpaces spaces = GlobalSpaces();

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
              return Column(
                children: [
                  Container(
                    height: 96,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: color.cardBackground,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        children: [
                          newGroceryStore.newGroceryList[index].productImage ==
                                  null
                              ? const Icon(Icons.abc)
                              : Image.file(
                                  newGroceryStore
                                      .newGroceryList[index].productImage!,
                                  scale: 3,
                                ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                newGroceryStore
                                    .newGroceryList[index].productName,
                              ),
                              Text(
                                newGroceryStore
                                    .newGroceryList[index].productPrice
                                    .toString(),
                              ),
                            ],
                          ),
                          /*Icon(
                            Icons.add_a_photo,
                            size: 38,
                            color: color.darkGrey,
                          ),*/
                        ],
                      ),
                    ),
                  ),
                  newGroceryStore.newGroceryList.last == true
                      ? spaces.vSpace8
                      : spaces.vSpace3
                ],
              );
              /*return ListTile(
                title: Text(
                  newGroceryStore.newGroceryList[index].productName,
                ),
              );*/
            },
          ),
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}
