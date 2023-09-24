import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Icon(
                        Icons.arrow_circle_up,
                        size: 24,
                        color: color.purple,
                      ),
                    ),
                    Expanded(
                      flex: 8,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                newGroceryStore
                                    .newGroceryList[widget.index].productName,
                                style: style.cardHeader,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: _price(index: widget.index),
                              ),
                              Expanded(
                                flex: 6,
                                child: _quantity(index: widget.index),
                              ),
                              Expanded(
                                flex: 5,
                                child: _total(index: widget.index),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    flex: 6,
                    child: GestureDetector(
                      onLongPress: () =>
                          newGroceryStore.removeItem(widget.index),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 255, 221, 221),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(12),
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        child: Icon(
                          Icons.delete_forever,
                          color: color.red,
                          size: 24,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: GestureDetector(
                      // ignore: avoid_print
                      onTap: () => print('CHECKOU'),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 228, 255, 221),
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(12),
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        child: Icon(
                          Icons.check,
                          color: color.green,
                          size: 24,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        space.vSpace4,
      ],
    );
  }

  Widget _priceTransform({required double price}) {
    var priceParsed = UtilBrasilFields.obterReal(price);
    return Text(
      priceParsed,
      style: GoogleFonts.nunito(
        textStyle: TextStyle(
          color: color.black,
          fontWeight: FontWeight.w700,
          fontSize: 14,
        ),
      ),
    );
  }

  Widget _totalTransform({required double price}) {
    var priceParsed = UtilBrasilFields.obterReal(price);
    return Text(
      priceParsed,
      style: GoogleFonts.nunito(
        textStyle: TextStyle(
          color: color.black,
          fontWeight: FontWeight.w700,
          fontSize: 14,
        ),
      ),
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
            price: newGroceryStore.newGroceryList[index].productPrice),
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
          style: GoogleFonts.nunito(
            textStyle: TextStyle(
              color: color.black,
              fontWeight: FontWeight.w700,
              fontSize: 14,
            ),
          ),
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
