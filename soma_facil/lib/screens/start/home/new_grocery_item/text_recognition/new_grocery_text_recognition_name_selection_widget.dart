import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../../../../global/global_colors.dart';
import '../../../../../global/global_styles.dart';
import '../../../../../stores/new_grocery/new_grocery_store.dart';

class NewGroceryTextRecognitionNameSelectionWidget extends StatefulWidget {
  const NewGroceryTextRecognitionNameSelectionWidget({super.key});

  @override
  State<NewGroceryTextRecognitionNameSelectionWidget> createState() =>
      _NewGroceryTextRecognitionNameSelectionWidgetState();
}

class _NewGroceryTextRecognitionNameSelectionWidgetState
    extends State<NewGroceryTextRecognitionNameSelectionWidget> {
  NewGroceryStore newGroceryStore = NewGroceryStore();

  final GlobalColors color = GlobalColors();
  final GlobalSpaces spaces = GlobalSpaces();
  final GlobalTextStyle style = GlobalTextStyle();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    newGroceryStore = Provider.of<NewGroceryStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Nome do produto',
          style: style.textHeader,
        ),
        spaces.vSpace,
        Observer(
          builder: (_) => Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.lemon,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Text(
              newGroceryStore.itemName.isEmpty
                  ? 'Selecione o nome'
                  : newGroceryStore.itemName,
              style: style.cardValueHighLight,
            ),
          ),
        ),
        spaces.vSpace,
        Observer(
          builder: (_) => ListView.builder(
            itemCount: newGroceryStore.reconizedNameList.length,
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemBuilder: (context, index) {
              return InkWell(
                child: Container(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    newGroceryStore.reconizedNameList[index].toString(),
                    style: style.cardValueHighLight,
                  ),
                ),
                onTap: () => {
                  newGroceryStore.setItemNameFromImage(
                    newGroceryStore.reconizedNameList[index].toString(),
                  ),
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
