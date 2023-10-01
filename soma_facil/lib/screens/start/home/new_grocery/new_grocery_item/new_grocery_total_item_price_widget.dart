import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:soma_facil/global/global_colors.dart';
import 'package:soma_facil/stores/new_grocery/new_grocery_store.dart';

class NewGroceryTotalPriceItemWidget extends StatefulWidget {
  const NewGroceryTotalPriceItemWidget({super.key});

  @override
  State<NewGroceryTotalPriceItemWidget> createState() =>
      _NewGroceryTotalPriceItemWidgetState();
}

class _NewGroceryTotalPriceItemWidgetState
    extends State<NewGroceryTotalPriceItemWidget> {
  final GlobalColors color = GlobalColors();
  NewGroceryStore newGroceryStore = NewGroceryStore();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    newGroceryStore = Provider.of<NewGroceryStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'R\$',
          style: GoogleFonts.quicksand(
            textStyle: TextStyle(
              color: color.black,
              fontWeight: FontWeight.w600,
              fontSize: 14,
              height: 1.5,
            ),
          ),
        ),
        const SizedBox(width: 4),
        Observer(
          builder: (_) => Text(
            newGroceryStore.itemPriceTotalizerStr,
            style: GoogleFonts.quicksand(
              textStyle: TextStyle(
                color: color.black,
                fontWeight: FontWeight.w700,
                fontSize: 42,
                height: 1,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
