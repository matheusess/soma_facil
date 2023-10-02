import 'package:flutter/material.dart';

import '../../../../global/global_menu_items.dart';

class MenuitemsAboutWidget extends StatefulWidget {
  const MenuitemsAboutWidget({super.key});

  @override
  State<MenuitemsAboutWidget> createState() => _MenuitemsAboutWidgetState();
}

class _MenuitemsAboutWidgetState extends State<MenuitemsAboutWidget> {
  @override
  Widget build(BuildContext context) {
    return GlobalMenuItem(
      label: 'Sobre',
      icon: Icons.info_outline,
      onPressed: () => print('SOBRE'),
    );
  }
}
