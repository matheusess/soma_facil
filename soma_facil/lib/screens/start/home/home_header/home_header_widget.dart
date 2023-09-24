import 'package:flutter/material.dart';
import 'package:soma_facil/global/global_styles.dart';
import 'package:soma_facil/screens/start/home/home_header/home_header_name_widget.dart';

import 'home_header_avatar_widget.dart';

class HomeHeaderWidget extends StatefulWidget {
  const HomeHeaderWidget({super.key});

  @override
  State<HomeHeaderWidget> createState() => _HomeHeaderWidgetState();
}

class _HomeHeaderWidgetState extends State<HomeHeaderWidget> {
  final GlobalSpaces space = GlobalSpaces();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HomeHeaderAvatarWidget(),
                space.vSpace3,
                const HomeHeaderNameWidget(),
              ],
            ),
            Image.asset(
              'images/icon-black.png',
              width: 34,
            ),
          ],
        ),
      ],
    );
  }
}
