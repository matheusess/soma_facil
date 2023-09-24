import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soma_facil/global/global_colors.dart';
import 'package:soma_facil/stores/login/login_store.dart';

import '../../global/global_login_field.dart';

class LoginEmailField extends StatefulWidget {
  const LoginEmailField({super.key});

  @override
  State<LoginEmailField> createState() => _LoginEmailFieldState();
}

class _LoginEmailFieldState extends State<LoginEmailField> {
  GlobalColors color = GlobalColors();
  LoginStore loginStore = LoginStore();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    loginStore = Provider.of<LoginStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    return GlobalLoginField(
      isEnable: true,
      prefixIcon: Icon(
        Icons.email,
        color: color.black,
        size: 20,
      ),
      placeHolder: 'seu@email.com',
      keyboardType: TextInputType.emailAddress,
      setAttribute: loginStore.setEmail,
      initialValue: loginStore.email,
    );
  }
}
