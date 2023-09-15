import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:soma_facil/global/global_colors.dart';
import 'package:soma_facil/global/global_styles.dart';
import 'package:soma_facil/screens/login/login_apple_button.dart';
import 'package:soma_facil/screens/login/login_email_field.dart';

import '../../stores/login/login_store.dart';
import '../start/start_screen.dart';
import 'login_button_field.dart';
import 'login_divider_widget.dart';
import 'login_forget_password_button.dart';
import 'login_google_button.dart';
import 'login_hero_text_widget.dart';
import 'login_password_field.dart';
import 'login_signin_button.dart';

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset('images/bg-login3.png'),
                Container(
                  padding: const EdgeInsets.only(
                    top: 92,
                    left: 18,
                    right: 18,
                    bottom: 42,
                  ),
                  child: Image.asset(
                    'images/icon-black.png',
                    width: 44,
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const LoginHeroTextWidget(),
                  spaces.vSpace6,
                  const LoginEmailField(),
                  spaces.vSpace4,
                  const LoginPasswordField(),
                  spaces.vSpace4,
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      LoginForgetPasswordButton(),
                      LoginButtonField(),
                    ],
                  ),
                  spaces.vSpace4,
                  const LoginDividerWidget(),
                  spaces.vSpace4,
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      LoginGoogleButton(),
                      LoginAppleButton(),
                    ],
                  ),
                ],
              ),
            ),
            const LoginSignInButton(),
          ],
        ),
      ),
    );
  }
}
