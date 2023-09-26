import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:soma_facil/global/global_colors.dart';
import 'package:soma_facil/global/global_styles.dart';
import 'package:soma_facil/screens/start/home/new_grocery/new_grocery_item/new_grocery_item_screen.dart';
import 'package:soma_facil/stores/new_grocery/new_grocery_store.dart';

class NewGrocerySubHeaderWidget extends StatefulWidget {
  const NewGrocerySubHeaderWidget({super.key});

  @override
  State<NewGrocerySubHeaderWidget> createState() =>
      _NewGrocerySubHeaderWidgetState();
}

class _NewGrocerySubHeaderWidgetState extends State<NewGrocerySubHeaderWidget> {
  NewGroceryStore newGroceryStore = NewGroceryStore();

  final GlobalColors color = GlobalColors();
  final GlobalTextStyle style = GlobalTextStyle();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    newGroceryStore = Provider.of<NewGroceryStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: color.white,
        border: Border.all(color: const Color.fromARGB(255, 239, 239, 239)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 4,
          ),
        ],
      ),
      child: Observer(
        builder: (_) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _totalPrice(total: newGroceryStore.groceryPriceTotalizer),
              TextButton.icon(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NewGroceryItemScreen(),
                  ),
                ),
                icon: Icon(
                  Icons.add_shopping_cart_sharp,
                  size: 24.0,
                  color: color.blueGreen,
                ),
                label: Text(
                  'Adicionar item',
                  style: GoogleFonts.nunito(
                    textStyle: TextStyle(
                      color: color.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _totalPrice({required double total}) {
    var priceParsed = UtilBrasilFields.obterReal(total, moeda: false);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Total',
          style: GoogleFonts.nunito(
            textStyle: TextStyle(
              color: color.black,
              fontWeight: FontWeight.w700,
              fontSize: 14,
            ),
          ),
        ),
        Row(
          children: [
            Text(
              'R\$ ',
              style: GoogleFonts.nunito(
                textStyle: TextStyle(
                  color: color.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
            ),
            Text(
              priceParsed,
              style: GoogleFonts.nunito(
                textStyle: TextStyle(
                  color: color.black,
                  fontWeight: FontWeight.w800,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
