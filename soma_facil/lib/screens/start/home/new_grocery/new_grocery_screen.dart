import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:soma_facil/screens/start/home/new_grocery/new_grocery_item_list_widget.dart';

import '../../../../global/global_colors.dart';
import '../../../../stores/new_grocery/new_grocery_store.dart';
import 'new_grocery_add_item_button.dart';
import 'new_grocery_header_widget.dart';
import 'new_grocery_no_data_widget.dart';
import 'new_grocery_shopping_name_widget.dart';

class NewGroceryScreen extends StatefulWidget {
  const NewGroceryScreen({super.key});

  @override
  State<NewGroceryScreen> createState() => _NewGroceryScreenState();
}

class _NewGroceryScreenState extends State<NewGroceryScreen> {
  NewGroceryStore newGroceryStore = NewGroceryStore();
  final GlobalColorsLibrary color = GlobalColorsLibrary();

  final SizedBox _vSpace = const SizedBox(height: 38);
  final SizedBox _vSpace2 = const SizedBox(height: 20);
  final SizedBox _vSpace3 = const SizedBox(height: 12);

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
        toolbarHeight: 300,
        automaticallyImplyLeading: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _vSpace3,
            const NewGroceryHeaderWidget(),
            _vSpace3,
            const NewGroceryShoppingNameWidget(),
            _vSpace3,
            const NewGroceryAdditemButton(),
            _vSpace2,
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
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pop(
          context,
        ),
        backgroundColor: color.purple,
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}
