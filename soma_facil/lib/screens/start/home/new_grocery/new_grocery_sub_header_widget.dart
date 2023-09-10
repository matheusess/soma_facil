import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:soma_facil/global/global_colors.dart';
import 'package:soma_facil/global/global_styles.dart';
import 'package:soma_facil/screens/start/home/new_grocery_checkout/new_grocery_checkout_screen.dart';
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
  final GlobalSpaces spaces = GlobalSpaces();
  final GlobalTextStyle style = GlobalTextStyle();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    newGroceryStore = Provider.of<NewGroceryStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _totalPrice(total: newGroceryStore.groceryPriceTotalizer),
            ElevatedButton.icon(
              onPressed: () => newGroceryStore.newGroceryList.isEmpty
                  ? null
                  : Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NewGroceryCheckoutScreen(),
                      ),
                    ),
              icon: Icon(
                Icons.shopping_cart,
                size: 24.0,
                color: newGroceryStore.newGroceryList.isEmpty
                    ? color.black
                    : color.white,
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: newGroceryStore.newGroceryList.isEmpty
                    ? color.cardBackground
                    : color.green, // Background color
              ),
              label: Text(
                'Ir para o caixa',
                style: GoogleFonts.nunito(
                  textStyle: TextStyle(
                    color: newGroceryStore.newGroceryList.isEmpty
                        ? color.black
                        : color.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _totalPrice({required double total}) {
    var priceParsed = UtilBrasilFields.obterReal(total);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Total', style: style.cardValueHighLight),
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
    );
  }
}
