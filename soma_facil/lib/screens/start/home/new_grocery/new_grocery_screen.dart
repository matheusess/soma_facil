import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:soma_facil/global/global_styles.dart';
import 'package:soma_facil/screens/start/home/new_grocery/new_grocery_item_list_widget.dart';
import 'package:soma_facil/screens/start/home/new_grocery_item/new_grocery_item_screen.dart';

import '../../../../global/global_colors.dart';
import '../../../../stores/new_grocery/new_grocery_store.dart';
import 'new_grocery_header_widget.dart';
import 'new_grocery_no_data_widget.dart';
import 'new_grocery_shopping_name_widget.dart';
import 'new_grocery_sub_header_widget.dart';

class NewGroceryScreen extends StatefulWidget {
  const NewGroceryScreen({super.key});

  @override
  State<NewGroceryScreen> createState() => _NewGroceryScreenState();
}

class _NewGroceryScreenState extends State<NewGroceryScreen> {
  NewGroceryStore newGroceryStore = NewGroceryStore();

  final GlobalColors color = GlobalColors();
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
        toolbarHeight: 316,
        automaticallyImplyLeading: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            spaces.vSpace,
            const NewGroceryHeaderWidget(),
            spaces.vSpace3,
            const NewGroceryShoppingNameWidget(),
            spaces.vSpace3,
            const NewGrocerySubHeaderWidget(),
            spaces.vSpace5,
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Observer(builder: (_) {
                if (newGroceryStore.newGroceryList.isEmpty) {
                  return const NewGroceryNoDataWidget();
                } else {
                  return const NewGroceryItemListWidget();
                }
              })
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FloatingActionButton(
              heroTag: "backButton",
              onPressed: () => Navigator.pop(
                context,
              ),
              backgroundColor: color.red,
              child: const Icon(Icons.arrow_back),
            ),
            FloatingActionButton.extended(
              heroTag: "addItemButton",
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NewGroceryItemScreen(),
                ),
              ),
              backgroundColor: color.blue,
              icon: const Icon(Icons.add),
              label: Text(
                'Novo Item',
                style: GoogleFonts.nunito(
                  textStyle: TextStyle(
                    color: color.white,
                    fontWeight: FontWeight.w600,
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
}
