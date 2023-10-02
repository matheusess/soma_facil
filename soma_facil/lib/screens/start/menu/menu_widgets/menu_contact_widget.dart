import 'package:flutter/material.dart';

import '../../../../global/global_menu_items.dart';

class MenuItemsContactWidget extends StatefulWidget {
  const MenuItemsContactWidget({super.key});

  @override
  State<MenuItemsContactWidget> createState() => _MenuItemsContactWidgetState();
}

class _MenuItemsContactWidgetState extends State<MenuItemsContactWidget> {
  @override
  Widget build(BuildContext context) {
    return GlobalMenuItem(
      label: 'Contato',
      icon: Icons.email_outlined,
      onPressed: () => print('EMAIL'),
    );
  }
}
