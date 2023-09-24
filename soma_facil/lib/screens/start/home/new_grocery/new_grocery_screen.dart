import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:soma_facil/global/global_styles.dart';
import 'package:soma_facil/screens/start/home/new_grocery/new_grocery_item_list_widget.dart';

import '../../../../global/global_colors.dart';
import '../../../../stores/new_grocery/new_grocery_store.dart';
import 'new_grocery_bottom_buttons.dart';
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
      backgroundColor: color.white,
      appBar: AppBar(
        backgroundColor: color.white,
        toolbarHeight: 324,
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
      bottomNavigationBar: const NewGroceryBottomButtons(),
    );
  }
}
