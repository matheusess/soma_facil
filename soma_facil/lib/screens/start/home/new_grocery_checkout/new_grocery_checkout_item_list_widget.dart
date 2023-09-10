import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soma_facil/global/global_colors.dart';
import 'package:soma_facil/global/global_styles.dart';
import 'package:soma_facil/stores/new_grocery/new_grocery_store.dart';

class NewGroceryCheckoutItemListWidget extends StatefulWidget {
  final int index;
  const NewGroceryCheckoutItemListWidget({super.key, required this.index});

  @override
  State<NewGroceryCheckoutItemListWidget> createState() =>
      _NewGroceryCheckoutItemListWidgetState();
}

class _NewGroceryCheckoutItemListWidgetState
    extends State<NewGroceryCheckoutItemListWidget> {
  NewGroceryStore newGroceryStore = NewGroceryStore();

  final GlobalColors color = GlobalColors();
  final GlobalSpaces space = GlobalSpaces();
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
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: color.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 9,
                offset: const Offset(0, 6), // changes position of shadow
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: Icon(
                  Icons.more_vert,
                  size: 24,
                  color: color.purple,
                ),
              ),
              Expanded(
                flex: 5,
                child: Icon(
                  Icons.more_vert,
                  size: 24,
                  color: color.purple,
                ),
              ),
              Expanded(
                flex: 5,
                child: Icon(
                  Icons.more_vert,
                  size: 24,
                  color: color.purple,
                ),
              ),
              /*GestureDetector(
                onTap: () => print('expandir'),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Icon(
                            Icons.more_vert,
                            size: 24,
                            color: color.purple,
                          ),
                        ),
                        Text(
                          newGroceryStore
                              .newGroceryList[widget.index].productName,
                          style: style.cardHeader,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        _price(index: widget.index),
                        _quantity(index: widget.index),
                        _total(index: widget.index),
                      ],
                    ),
                  ],
                ),
              ),*/
              Row(
                children: [
                  GestureDetector(
                    onTap: () => print('CHECKOU'),
                    child: Container(
                      color: const Color.fromARGB(255, 221, 246, 255),
                      padding: const EdgeInsets.all(12),
                      child: Icon(
                        Icons.check,
                        color: color.green,
                        size: 24,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onLongPress: () => print('CANCELOU'),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 255, 221, 221),
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                      ),
                      padding: const EdgeInsets.all(12),
                      child: Icon(
                        Icons.delete_forever,
                        color: color.red,
                        size: 24,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        space.vSpace4
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
