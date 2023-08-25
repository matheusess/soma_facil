import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Observer(builder: (_) {
                if (newGroceryStore.newGroceryList.isEmpty) {
                  return const NewGroceryNoDataWidget();
                } else {
                  return hasData();
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

  Widget hasData() {
    List<String> items = [
      '1',
      '1',
      '1',
      '1',
      '1',
      '1',
      '2',
      '2',
      '2',
      '2',
      '2',
      '2',
      '2',
      '2',
      '2',
      '2',
    ];
    return Column(
      children: [
        ListView.builder(
          itemCount: items.length,
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          prototypeItem: ListTile(
            title: Text(items.first),
          ),
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(items[index]),
            );
          },
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}
