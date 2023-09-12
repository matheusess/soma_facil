import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:soma_facil/global/global_colors.dart';
import 'package:soma_facil/global/global_styles.dart';

import '../../global/global_gradiente_button.dart';
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
          Image.asset('images/bg-login3.png'),
          /* Container(
            alignment: Alignment.topRight,
            child: SvgPicture.asset(
              'images/bg-login11.svg',
              fit: BoxFit.cover,
            ),
          ),*/
          Container(
            padding:
                const EdgeInsets.only(left: 16, right: 16, bottom: 36, top: 70),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'images/icon-black.png',
                  width: 60,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Login',
                      style: GoogleFonts.quicksand(
                        textStyle: const TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.w900,
                          fontSize: 42,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                    Text(
                      'Bora fazer uma comprinha?',
                      style: GoogleFonts.barlow(
                        textStyle: const TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          letterSpacing: .5,
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
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
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GlobalGradientButton(
                          gradient: const LinearGradient(
                            colors: <Color>[
                              Color(0xFFF5C75A),
                              Color(0xFFFDA23C),
                            ],
                          ),
                          onPressed: () {
                            null;
                          },
                          isFluid: false,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Login',
                                style: GoogleFonts.quicksand(
                                  textStyle: const TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontWeight: FontWeight.w800,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              spaces.hSpace2,
                              const Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                                size: 20,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Text('dsadasdasdaa'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
