import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:soma_facil/stores/new_grocery/new_grocery_store.dart';

import '../../../../global/global_colors.dart';

class NewGroceryShoppingNameWidget extends StatefulWidget {
  const NewGroceryShoppingNameWidget({super.key});

  @override
  State<NewGroceryShoppingNameWidget> createState() =>
      _NewGroceryShoppingNameWidgetState();
}

class _NewGroceryShoppingNameWidgetState
    extends State<NewGroceryShoppingNameWidget> {
  NewGroceryStore newGroceryStore = NewGroceryStore();
  final GlobalColors color = GlobalColors();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    newGroceryStore = Provider.of<NewGroceryStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 5,
            blurRadius: 9,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Icon(
                  Icons.add_location_alt_outlined,
                  color: color.blue,
                ),
                const SizedBox(width: 8),
                Text(
                  'Local da compra',
                  style: GoogleFonts.nunito(
                    textStyle: TextStyle(
                      color: color.darkGrey,
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
            TextFormField(
              onChanged: newGroceryStore.setGroceryName,
              autofocus: false,
              style: GoogleFonts.nunito(
                textStyle: TextStyle(
                  color: color.darkGrey,
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              ),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: 6),
                border: InputBorder.none,
                hintText: 'Digite o nome do local ...',
                hintStyle: GoogleFonts.nunito(
                  textStyle: TextStyle(
                    color: color.grey,
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
