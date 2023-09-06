import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

import '../../../../../global/global_colors.dart';
import '../../../../../global/global_styles.dart';
import '../../../../../stores/new_grocery/new_grocery_store.dart';
import 'new_grocery_text_recognition_name_selection_widget.dart';
import 'new_grocery_text_recognition_price_selection_widget.dart';
import 'new_grocery_text_header_widget.dart';

class NewGroceryTextRecognitionScreen extends StatefulWidget {
  const NewGroceryTextRecognitionScreen({super.key});

  @override
  State<NewGroceryTextRecognitionScreen> createState() =>
      _NewGroceryTextRecognitionScreenState();
}

class _NewGroceryTextRecognitionScreenState
    extends State<NewGroceryTextRecognitionScreen> {
  final GlobalColors color = GlobalColors();
  final GlobalTextStyle style = GlobalTextStyle();
  final GlobalSpaces spaces = GlobalSpaces();

  NewGroceryStore newGroceryStore = NewGroceryStore();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    newGroceryStore = Provider.of<NewGroceryStore>(context);

    autorun(
      (p0) {
        if (newGroceryStore.isPriceInvalid == true) {
          final snackBar = SnackBar(
            backgroundColor: color.orange,
            content: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Preço não encontrado',
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ),
                Icon(
                  Icons.error,
                  color: color.white,
                ),
              ],
            ),
            duration: const Duration(seconds: 4),
          );

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          FocusScope.of(context).unfocus();
          newGroceryStore.isPriceInvalid = false;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 110,
        title: const NewGrocerytextHeaderWidget(),
        automaticallyImplyLeading: false,
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NewGroceryTextRecognitionNameSelectionWidget(),
              NewGroceryTextRecognitionPriceSelectionWidget(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "backButton",
        onPressed: () => {
          Navigator.pop(
            context,
          ),
        },
        backgroundColor: color.red,
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}
