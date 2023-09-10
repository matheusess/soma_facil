import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../../../../global/global_colors.dart';
import '../../../../../global/global_styles.dart';
import '../../../../../stores/new_grocery/new_grocery_store.dart';

class NewGroceryTextRecognitionPriceSelectionWidget extends StatefulWidget {
  const NewGroceryTextRecognitionPriceSelectionWidget({super.key});

  @override
  State<NewGroceryTextRecognitionPriceSelectionWidget> createState() =>
      _NewGroceryTextRecognitionPriceSelectionWidgetState();
}

class _NewGroceryTextRecognitionPriceSelectionWidgetState
    extends State<NewGroceryTextRecognitionPriceSelectionWidget> {
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
          'Preço do produto',
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
              newGroceryStore.itemPriceStr.isEmpty
                  ? 'Selecione o preço'
                  : newGroceryStore.itemPriceStr,
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
                onTap: () => newGroceryStore.parseItemPriceFromImage(
                  newGroceryStore.reconizedNameList[index].toString(),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
