import 'package:flutter/material.dart';

import '../../../../global/global_menu_items.dart';

class MenuItemsUpdate extends StatefulWidget {
  const MenuItemsUpdate({super.key});

  @override
  State<MenuItemsUpdate> createState() => _MenuItemsUpdateState();
}

class _MenuItemsUpdateState extends State<MenuItemsUpdate> {
  @override
  Widget build(BuildContext context) {
    return GlobalMenuItem(
      label: 'Atualizações',
      icon: Icons.upgrade,
      onPressed: () => print('updated'),
    );
  }
}
