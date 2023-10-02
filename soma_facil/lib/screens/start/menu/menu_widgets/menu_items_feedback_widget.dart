import 'package:flutter/material.dart';

import '../../../../global/global_menu_items.dart';

class MenuItemsFeedbackWidget extends StatefulWidget {
  const MenuItemsFeedbackWidget({super.key});

  @override
  State<MenuItemsFeedbackWidget> createState() =>
      _MenuItemsFeedbackWidgetState();
}

class _MenuItemsFeedbackWidgetState extends State<MenuItemsFeedbackWidget> {
  @override
  Widget build(BuildContext context) {
    return GlobalMenuItem(
      label: 'Feedback',
      icon: Icons.feedback_outlined,
      onPressed: () => print('FEEDBACK'),
    );
  }
}
