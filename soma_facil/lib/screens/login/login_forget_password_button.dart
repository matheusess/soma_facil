import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:soma_facil/global/global_colors.dart';
import 'package:soma_facil/stores/login/login_store.dart';

class LoginForgetPasswordButton extends StatefulWidget {
  const LoginForgetPasswordButton({super.key});

  @override
  State<LoginForgetPasswordButton> createState() =>
      _LoginForgetPasswordButtonState();
}

class _LoginForgetPasswordButtonState extends State<LoginForgetPasswordButton> {
  final GlobalColors color = GlobalColors();
  LoginStore loginStore = LoginStore();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    loginStore = Provider.of<LoginStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(
        'Esqueceu a senha?',
        style: GoogleFonts.quicksand(
          textStyle: TextStyle(
            color: color.black,
            fontWeight: FontWeight.w800,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
