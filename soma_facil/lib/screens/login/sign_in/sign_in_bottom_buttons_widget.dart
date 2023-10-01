import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:soma_facil/global/global_colors.dart';
import 'package:soma_facil/global/global_styles.dart';
import 'package:soma_facil/stores/login/login_store.dart';

class SignInBottomButtonsWidget extends StatefulWidget {
  const SignInBottomButtonsWidget({super.key});

  @override
  State<SignInBottomButtonsWidget> createState() =>
      _SignInBottomButtonsWidgetState();
}

class _SignInBottomButtonsWidgetState extends State<SignInBottomButtonsWidget> {
  final GlobalColors color = GlobalColors();
  final GlobalSpaces spaces = GlobalSpaces();
  LoginStore loginStore = LoginStore();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    loginStore = Provider.of<LoginStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      /*decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 9,
            offset: const Offset(6, 0), // changes position of shadow
          ),
        ],
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: color.cardBackground,
            width: 1,
          ),
        ),
      ),*/
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: 42,
        top: 16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FloatingActionButton(
            heroTag: "backButton",
            onPressed: () => Navigator.pop(
              context,
            ),
            backgroundColor: color.darkOrange,
            child: const Icon(Icons.arrow_back),
          ),
          Observer(
            builder: (_) => FloatingActionButton.extended(
              heroTag: "createNewUser",
              // ignore: avoid_print
              onPressed: () => print('teste'),
              backgroundColor: loginStore.isNewUserValid
                  ? color.green
                  : color.cardBackground,
              label: Text(
                'Criar usuário',
                style: GoogleFonts.quicksand(
                  textStyle: TextStyle(
                    color: loginStore.isNewUserValid ? color.white : color.grey,
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
