import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:soma_facil/stores/login/login_store.dart';

import 'sign_in_chip_widget.dart';

class SignInChipRowWidget extends StatefulWidget {
  const SignInChipRowWidget({super.key});

  @override
  State<SignInChipRowWidget> createState() => _SignInChipRowWidgetState();
}

class _SignInChipRowWidgetState extends State<SignInChipRowWidget> {
  LoginStore loginStore = LoginStore();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    loginStore = Provider.of<LoginStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      alignment: WrapAlignment.start,
      spacing: 10.0,
      runSpacing: 6.0,
      children: [
        Observer(
          builder: (_) => SignInChipWidget(
            label: '9 caracteres',
            isValid: loginStore.hasMinimumCharacter,
          ),
        ),
        Observer(
          builder: (_) => SignInChipWidget(
            label: '2 números',
            isValid: loginStore.hasNumberCharacter,
          ),
        ),
        Observer(
          builder: (_) => SignInChipWidget(
            label: '1 letra maíscula',
            isValid: loginStore.hasOneUpperCase,
          ),
        ),
        Observer(
          builder: (_) => SignInChipWidget(
            label: '1 caracter especial',
            isValid: loginStore.hasSpecialCharacter,
          ),
        ),
      ],
    );
  }
}
