import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:soma_facil/global/global_colors.dart';
import 'package:soma_facil/global/global_styles.dart';

import '../../global/global_login_field.dart';
import '../../stores/login/login_store.dart';
import '../start/start_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController controller = TextEditingController();

  LoginStore loginStore = LoginStore();

  final GlobalColors colors = GlobalColors();
  final GlobalTextStyle style = GlobalTextStyle();
  final GlobalSpaces spaces = GlobalSpaces();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    loginStore = Provider.of<LoginStore>(context);

    autorun((_) {
      if (loginStore.isLogged) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const StartScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            alignment: FractionalOffset.bottomCenter,
            child: SvgPicture.asset(
              'images/bg-login5.svg',
              colorFilter: const ColorFilter.mode(
                Color.fromARGB(209, 255, 156, 42),
                BlendMode.modulate,
              ),
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: Image.asset(
                        'images/icon-black.png',
                        height: 200,
                      ),
                    ),
                    Text(
                      'Soma Fácil',
                      style: GoogleFonts.barlow(
                        fontSize: 42,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    GlobalLoginField(
                      isEnable: true,
                      placeHolder: 'seu@email.com',
                      controller: controller,
                      keyboardType: TextInputType.emailAddress,
                      setAttribute: (p0) => print('teste'),
                    ),
                    spaces.vSpace4,
                    GlobalLoginField(
                      isEnable: true,
                      placeHolder: 'seu@email.com',
                      controller: controller,
                      keyboardType: TextInputType.emailAddress,
                      setAttribute: (p0) => print('teste'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
