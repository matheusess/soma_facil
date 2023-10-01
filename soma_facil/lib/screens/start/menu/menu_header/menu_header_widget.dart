import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:soma_facil/global/global_colors.dart';
import 'package:soma_facil/stores/grocery/grocery_store.dart';

import '../../../../global/global_styles.dart';
import 'menu_header_avatar_widget.dart';
import 'menu_header_logo_widget.dart';
import 'menu_header_user_info_widget.dart';

class MenuHeaderWidget extends StatefulWidget {
  const MenuHeaderWidget({super.key});

  @override
  State<MenuHeaderWidget> createState() => _MenuHeaderWidgetState();
}

class _MenuHeaderWidgetState extends State<MenuHeaderWidget> {
  GroceryStore groceryStore = GroceryStore();

  final GlobalColors colors = GlobalColors();
  final GlobalSpaces space = GlobalSpaces();

  User? user = FirebaseAuth.instance.currentUser;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset('images/bg-login7.png'),
        Padding(
          padding: const EdgeInsets.only(left: 22, right: 22, top: 68),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MenuHeaderLogoWidget(),
              space.vSpace4,
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: color.cardBackground,
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                ),
                child: Row(
                  children: [
                    const MenuHeaderAvatarWidget(),
                    space.hSpace2,
                    const MenuHeaderUserInfoWidget(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );

    /*return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 28),
      height: 270,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(34),
          bottomRight: Radius.circular(34),
        ),
        gradient: LinearGradient(
          colors: [
            color.darkOrange,
            color.orange,
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const MenuHeaderLogoWidget(),
          space.vSpace5,
          Row(
            children: [
              const MenuHeaderAvatarWidget(),
              space.hSpace2,
              const MenuHeaderUserInfoWidget(),
            ],
          ),
        ],
      ),
    );*/
  }
}
