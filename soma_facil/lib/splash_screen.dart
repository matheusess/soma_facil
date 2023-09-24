import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:soma_facil/global/global_colors.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:soma_facil/global/global_styles.dart';
import 'package:page_transition/page_transition.dart';

import 'screens/login/login_screen.dart';
import 'screens/start/start_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final GlobalColors color = GlobalColors();
  final GlobalSpaces spaces = GlobalSpaces();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      User? user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        Future.delayed(const Duration(seconds: 1)).then(
          (value) => Navigator.of(context, rootNavigator: true).pushReplacement(
            PageTransition(
              duration: const Duration(milliseconds: 400),
              reverseDuration: const Duration(milliseconds: 400),
              type: PageTransitionType.bottomToTop,
              child: const LoginScreen(),
            ),
          ),
        );
      }
      if (user != null) {
        Future.delayed(const Duration(seconds: 1)).then((value) async {
          Navigator.pushReplacement(
            context,
            PageTransition(
              duration: const Duration(milliseconds: 400),
              reverseDuration: const Duration(milliseconds: 400),
              type: PageTransitionType.fade,
              child: const StartScreen(),
            ),
          );
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: <Color>[color.orange, color.darkOrange],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'images/icon-black.png',
                width: 80,
              ),
              spaces.vSpace9,
              SpinKitThreeBounce(
                color: color.black,
                size: 24,
              ),
            ],
          ),
        ],
      ),
      backgroundColor: color.darkOrange,
    );
  }
}
