import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:soma_facil/global/global_colors.dart';
import 'package:soma_facil/global/global_styles.dart';
import 'package:soma_facil/stores/login/login_store.dart';

import '../../../global/global_gradiente_button.dart';

class ResetPasswordButtonField extends StatefulWidget {
  const ResetPasswordButtonField({super.key});

  @override
  State<ResetPasswordButtonField> createState() =>
      _ResetPasswordButtonFieldState();
}

class _ResetPasswordButtonFieldState extends State<ResetPasswordButtonField> {
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
      gradient: LinearGradient(
        colors: <Color>[
          color.darkOrange,
          color.darkOrange,
        ],
      ),
      onPressed: () {
        null;
      },
      isFluid: true,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Resetar senha',
            style: GoogleFonts.quicksand(
              textStyle: const TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontWeight: FontWeight.w800,
                fontSize: 14,
              ),
            ),
          ),
          space.hSpace2,
        ],
      ),
    );
  }
}
