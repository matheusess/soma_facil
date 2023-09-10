import 'package:brasil_fields/brasil_fields.dart';
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
  final GlobalTextStyle style = GlobalTextStyle();

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
              return Container(
                height: 100,
                width: double.infinity,
                padding: const EdgeInsets.only(left: 16),
                margin: EdgeInsets.only(
                  bottom: newGroceryStore.newGroceryList.length == (index + 1)
                      ? 60
                      : 22,
                ),
                decoration: BoxDecoration(
                  color: color.cardBackground,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(
                          newGroceryStore.newGroceryList[index].productName
                              .toUpperCase(),
                          style: style.cardHeader,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: _price(index: index),
                        ),
                        Expanded(
                          flex: 5,
                          child: _quantity(index: index),
                        ),
                        Expanded(
                          flex: 6,
                          child: _total(index: index),
                        ),
                        IconButton(
                          onPressed: () => newGroceryStore.removeItem(index),
                          icon: Icon(
                            Icons.delete,
                            size: 24,
                            color: color.red,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 40),
      ],
    );
  }

  Widget _priceTransform({required double price}) {
    var priceParsed = UtilBrasilFields.obterReal(price);
    return Text(
      priceParsed,
      style: style.cardValue,
    );
  }

  Widget _totalTransform({required double price}) {
    var priceParsed = UtilBrasilFields.obterReal(price);
    return Text(
      priceParsed,
      style: style.cardValue,
    );
  }

  Widget _price({required int index}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Preço',
          style: style.cardSubHeader,
        ),
        _priceTransform(
          price: newGroceryStore.newGroceryList[index].productPrice,
        ),
      ],
    );
  }

  Widget _quantity({required int index}) {
    return Column(
      children: [
        Text(
          'Quantidade',
          style: style.cardSubHeader,
        ),
        Text(
          newGroceryStore.newGroceryList[index].productQuantity.toString(),
        ),
      ],
    );
  }

  Widget _total({required int index}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Total',
          style: style.cardSubHeader,
        ),
        _totalTransform(
          price: newGroceryStore.newGroceryList[index].productTotalPrice,
        ),
      ],
    );
  }
}
