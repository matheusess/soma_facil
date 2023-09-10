import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:soma_facil/global/global_colors.dart';
import 'package:soma_facil/global/global_styles.dart';
import 'package:soma_facil/screens/start/home/new_grocery_checkout/new_grocery_checkout_header_widget.dart';
import 'package:soma_facil/stores/new_grocery/new_grocery_store.dart';

class NewGroceryCheckoutScreen extends StatefulWidget {
  const NewGroceryCheckoutScreen({super.key});

  @override
  State<NewGroceryCheckoutScreen> createState() =>
      _NewGroceryCheckoutScreenState();
}

class _NewGroceryCheckoutScreenState extends State<NewGroceryCheckoutScreen> {
  NewGroceryStore newGroceryStore = NewGroceryStore();

  final GlobalColors colors = GlobalColors();
  final GlobalSpaces spaces = GlobalSpaces();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    newGroceryStore = Provider.of<NewGroceryStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 100,
        automaticallyImplyLeading: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            spaces.vSpace,
            const NewGroceryCheckoutHeaderWidget(),
          ],
        ),
      ),
      body: Center(),
    );
  }
}
