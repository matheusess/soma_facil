import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:soma_facil/global/global_colors.dart';
import 'package:soma_facil/global/global_styles.dart';
import 'package:soma_facil/screens/start/home/new_grocery_item/images_widget/new_grocery_image_field.dart';
import 'package:soma_facil/screens/start/home/new_grocery_item/new_grocery_item_header_widget.dart';
import 'package:soma_facil/stores/new_grocery/new_grocery_store.dart';

import 'new_grocery_item_bottom_buttons.dart';
import 'new_grocery_item_name_field.dart';
import 'new_grocery_item_price_field.dart';
import 'new_grocery_quantity_button.dart';
import 'new_grocery_total_item_price_widget.dart';

class NewGroceryItemScreen extends StatefulWidget {
  const NewGroceryItemScreen({super.key});

  @override
  State<NewGroceryItemScreen> createState() => _NewGroceryItemScreenState();
}

class _NewGroceryItemScreenState extends State<NewGroceryItemScreen> {
  NewGroceryStore newGroceryStore = NewGroceryStore();

  final GlobalColors color = GlobalColors();
  final GlobalSpaces space = GlobalSpaces();

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
        toolbarHeight: 100,
        automaticallyImplyLeading: false,
        title: const NewGroceryItemHeader(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              space.vSpace2,
              const NewGroceryImageField(),
              space.vSpace3,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Divider(
                      indent: 2,
                      endIndent: 16,
                      height: 1,
                      color: color.lightGrey,
                    ),
                  ),
                  Text(
                    'Dados do produto',
                    style: GoogleFonts.nunito(
                      textStyle: TextStyle(
                        color: color.darkGrey,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      indent: 16,
                      endIndent: 2,
                      height: 1,
                      color: color.lightGrey,
                    ),
                  ),
                ],
              ),
              space.vSpace2,
              const NewGroceryItemNameField(),
              space.vSpace3,
              const NewGroceryItemPriceField(),
              space.vSpace3,
              const NewGroceryQuantityButton(),
              space.vSpace3,
              const NewGroceryTotalPriceItemWidget(),
              space.vSpace3,
            ],
          ),
        ),
      ),
      bottomSheet: const NewGroceryItemBottomButtons(),
      //floatingActionButton: const NewGroceryItemBottomButtons(),
    );
  }
}
