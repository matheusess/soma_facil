import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobx/mobx.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:soma_facil/global/global_styles.dart';
import 'package:soma_facil/screens/start/home/home_screen.dart';
import 'package:soma_facil/screens/start/home/new_grocery/new_grocery_item_list_widget.dart';
import 'package:soma_facil/stores/grocery/grocery_store.dart';

import '../../../../global/global_colors.dart';
import '../../../../global/global_data_overlay.dart';
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
  final GlobalColors color = GlobalColors();
  final GlobalSpaces spaces = GlobalSpaces();

  NewGroceryStore newGroceryStore = NewGroceryStore();
  GroceryStore groceryStore = GroceryStore();
  User? user = FirebaseAuth.instance.currentUser;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    newGroceryStore = Provider.of<NewGroceryStore>(context);
    groceryStore = Provider.of<GroceryStore>(context);

    autorun(
      (_) {
        if (newGroceryStore.success == true) {
          final snackBar = SnackBar(
            backgroundColor: color.green,
            content: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Compra criado com sucesso',
                  style: GoogleFonts.quicksand(
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
            behavior: SnackBarBehavior.fixed,
            duration: const Duration(seconds: 4),
          );

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          newGroceryStore.success = false;

          Navigator.pop(
            context,
            PageTransition(
              type: PageTransitionType.rightToLeft,
              child: const HomeScreen(),
            ),
          );
          groceryStore.getAllGroceries(uId: user!.uid);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
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
        ),
        Observer(
          builder: (_) => newGroceryStore.isLoading == true
              ? const GlobalDataOverlay()
              : const SizedBox(),
        ),
      ],
    );
  }
}
