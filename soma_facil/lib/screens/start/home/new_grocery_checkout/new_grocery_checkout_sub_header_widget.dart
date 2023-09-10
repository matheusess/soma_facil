import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:soma_facil/global/global_colors.dart';
import 'package:soma_facil/global/global_styles.dart';
import 'package:soma_facil/stores/new_grocery/new_grocery_store.dart';

class NewGroceryCheckoutSubHeaderWidget extends StatefulWidget {
  const NewGroceryCheckoutSubHeaderWidget({super.key});

  @override
  State<NewGroceryCheckoutSubHeaderWidget> createState() =>
      _NewGroceryCheckoutSubHeaderWidgetState();
}

class _NewGroceryCheckoutSubHeaderWidgetState
    extends State<NewGroceryCheckoutSubHeaderWidget> {
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
    return Container(
      height: 84,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 5,
            blurRadius: 9,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _total(),
          _totalChecked(),
          _totalItens(),
        ],
      ),
    );
  }

  Widget _total() {
    return Column(
      children: [
        Text(
          'Itens',
          style: style.cardSubHeader,
        ),
        Observer(
          builder: (_) => Text(
            newGroceryStore.newGroceryList.length.toString(),
            style: GoogleFonts.nunito(
              textStyle: TextStyle(
                color: color.blue,
                fontWeight: FontWeight.w700,
                fontSize: 22,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _totalItens() {
    var priceParsed =
        UtilBrasilFields.obterReal(newGroceryStore.groceryPriceTotalizer);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Valor total',
          style: style.cardSubHeader,
        ),
        Text(
          priceParsed,
          style: GoogleFonts.nunito(
            textStyle: TextStyle(
              color: color.purple,
              fontWeight: FontWeight.w800,
              fontSize: 22,
            ),
          ),
        ),
      ],
    );
  }

  Widget _totalChecked() {
    return Column(
      children: [
        Text(
          'Validados',
          style: style.cardSubHeader,
        ),
        Text(
          '1315',
          style: GoogleFonts.nunito(
            textStyle: TextStyle(
              color: color.green,
              fontWeight: FontWeight.w700,
              fontSize: 22,
            ),
          ),
        ),
      ],
    );
  }
}
