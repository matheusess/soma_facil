import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:soma_facil/global/global_colors.dart';
import 'package:soma_facil/global/global_styles.dart';
import 'package:soma_facil/screens/login/login_screen.dart';
import 'package:soma_facil/screens/start/menu/menu_widgets/menu_items_list_widget.dart';
import 'package:soma_facil/screens/start/menu/menu_widgets/menu_logout_button.dart';
import 'package:soma_facil/stores/login/login_store.dart';
import 'package:soma_facil/stores/new_grocery/new_grocery_store.dart';

import 'menu_header/menu_header_widget.dart';
import 'menu_widgets/menu_subheader_widget.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  NewGroceryStore newGroceryStore = NewGroceryStore();
  LoginStore loginStore = LoginStore();

  final GlobalColors colors = GlobalColors();
  final GlobalSpaces spaces = GlobalSpaces();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    newGroceryStore = Provider.of<NewGroceryStore>(context);
    loginStore = Provider.of<LoginStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MenuHeaderWidget(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: MenuSubheaderWidget(),
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: MenuItemsListWidgets(),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 24, horizontal: 20),
                child: MenuLogoutButton(),
              ),
            ],
          ),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}
