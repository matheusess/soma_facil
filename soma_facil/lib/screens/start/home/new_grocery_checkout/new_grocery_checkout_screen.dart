import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:soma_facil/global/global_colors.dart';
import 'package:soma_facil/global/global_styles.dart';
import 'package:soma_facil/screens/start/home/new_grocery_checkout/new_grocery_checkout_bottom_buttons.dart';
import 'package:soma_facil/screens/start/home/new_grocery_checkout/new_grocery_checkout_header_widget.dart';
import 'package:soma_facil/screens/start/home/new_grocery_checkout/new_grocery_checkout_item_list_widget.dart';
import 'package:soma_facil/stores/new_grocery/new_grocery_store.dart';

import 'new_grocery_checkout_sub_header_widget.dart';

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
        toolbarHeight: 230,
        automaticallyImplyLeading: false,
        title: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const NewGroceryCheckoutHeaderWidget(),
              spaces.vSpace2,
              const NewGroceryCheckoutSubHeaderWidget(),
              spaces.vSpace2,
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Observer(
          builder: (_) => ListView.builder(
            itemCount: newGroceryStore.newGroceryList.length,
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemBuilder: (context, index) =>
                NewGroceryCheckoutItemListWidget(index: index),
          ),
        ),
      ),
      floatingActionButton: const NewGroceryCheckoutBottomButtons(),
    );
  }
}
