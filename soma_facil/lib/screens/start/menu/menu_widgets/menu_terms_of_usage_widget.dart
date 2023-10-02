import 'package:flutter/material.dart';

import '../../../../global/global_menu_items.dart';

class MenuTermsOfUsageWidget extends StatefulWidget {
  const MenuTermsOfUsageWidget({super.key});

  @override
  State<MenuTermsOfUsageWidget> createState() => _MenuTermsOfUsageWidgetState();
}

class _MenuTermsOfUsageWidgetState extends State<MenuTermsOfUsageWidget> {
  @override
  Widget build(BuildContext context) {
    return GlobalMenuItem(
      label: 'Termos de uso',
      icon: Icons.policy_outlined,
      onPressed: () => print('updated'),
    );
  }
}
