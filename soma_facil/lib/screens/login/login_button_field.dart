import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:soma_facil/global/global_colors.dart';
import 'package:soma_facil/global/global_styles.dart';
import 'package:soma_facil/stores/login/login_store.dart';

import '../../global/global_gradiente_button.dart';

class LoginButtonField extends StatefulWidget {
  const LoginButtonField({super.key});

  @override
  State<LoginButtonField> createState() => _LoginButtonFieldState();
}

class _LoginButtonFieldState extends State<LoginButtonField> {
  final GlobalColors color = GlobalColors();
  final GlobalSpaces space = GlobalSpaces();
  LoginStore loginStore = LoginStore();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    loginStore = Provider.of<LoginStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    return GlobalGradientButton(
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
          space.hSpace2,
          const Icon(
            Icons.arrow_forward,
            color: Colors.white,
            size: 20,
          ),
        ],
      ),
    );
  }
}
