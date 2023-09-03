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
              return Column(
                children: [
                  Container(
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: color.cardBackground,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                newGroceryStore
                                    .newGroceryList[index].productName
                                    .toUpperCase(),
                                style: style.cardHeader,
                              ),
                              spaces.vSpace,
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        'Preço',
                                        style: style.cardSubHeader,
                                      ),
                                      _priceTransform(
                                        price: newGroceryStore
                                            .newGroceryList[index].productPrice,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        'Quantidade',
                                        style: style.cardSubHeader,
                                      ),
                                      Text(
                                        newGroceryStore.newGroceryList[index]
                                            .productQuantity
                                            .toString(),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        'Total',
                                        style: style.cardSubHeader,
                                      ),
                                      _totalTransform(
                                        price: newGroceryStore
                                            .newGroceryList[index]
                                            .productTotalPrice,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          IconButton(
                            onPressed: () => print(index),
                            icon: Icon(
                              Icons.delete,
                              size: 24,
                              color: color.red,
                            ),
                          )
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
}
