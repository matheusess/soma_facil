import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../global/global_colors.dart';
import 'home/home_screen.dart';
import 'menu/menu_screen.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  GlobalColorsLibrary color = GlobalColorsLibrary();
  final PageController _pageController = PageController();

  int _page = 0;
  final double _scale = 5;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark, //
    ));

    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (p) {
          setState(() {
            _page = p;
          });
        },
        children: const [HomeScreen(), MenuScreen()],
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: color.white,
          textTheme: Theme.of(context).textTheme.copyWith(
                bodySmall: TextStyle(color: color.purple),
              ),
        ), //change the font style
        child: BottomNavigationBar(
          currentIndex: _page,
          onTap: (p) {
            _pageController.animateToPage(p,
                duration: const Duration(milliseconds: 550),
                curve: Curves.ease);
          },
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                'images/home-icon.png',
                color: color.darkGrey,
                scale: _scale,
              ),
              activeIcon: Image.asset(
                'images/home-icon.png',
                color: color.blueGreen,
                scale: _scale,
              ),
              label: ('Home'),
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'images/menu-icon.png',
                color: color.darkGrey,
                scale: _scale,
              ),
              activeIcon: Image.asset(
                'images/menu-icon.png',
                color: color.blueGreen,
                scale: _scale,
              ),
              label: ('Menu'),
            ),
          ],
          selectedFontSize: 12,
          selectedItemColor: color.blueGreen,
          unselectedItemColor: color.darkGrey,
          showSelectedLabels: true,
          showUnselectedLabels: true,
        ),
      ),
    );
  }
}
