import 'package:flutter/material.dart';
import 'package:soma_facil/global/global_colors.dart';
import 'package:soma_facil/global/global_styles.dart';
import 'package:soma_facil/screens/start/menu/menu_widgets/menu_contact_widget.dart';

import 'menu_items_about_widget.dart';
import 'menu_items_feedback_widget.dart';
import 'menu_items_update.dart';
import 'menu_terms_of_usage_widget.dart';

class MenuItemsListWidgets extends StatefulWidget {
  const MenuItemsListWidgets({super.key});

  @override
  State<MenuItemsListWidgets> createState() => _MenuItemsListWidgetsState();
}

class _MenuItemsListWidgetsState extends State<MenuItemsListWidgets> {
  final _padding = const Padding(
    padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
    child: Divider(
      color: Color.fromARGB(255, 223, 223, 223),
    ),
  );

  final GlobalColors color = GlobalColors();
  final GlobalSpaces spaces = GlobalSpaces();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4),
      width: double.infinity,
      decoration: BoxDecoration(
        color: color.cardBackground,
        borderRadius: BorderRadius.circular(20),
      ),
      // ignore: prefer_const_constructors
      child: Column(
        children: [
          const MenuItemsUpdate(),
          _padding,
          const MenuItemsContactWidget(),
          _padding,
          const MenuItemsFeedbackWidget(),
          _padding,
          const MenuitemsAboutWidget(),
          _padding,
          const MenuTermsOfUsageWidget(),
        ],
      ),
    );
  }
}
