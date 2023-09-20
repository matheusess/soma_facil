import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../global/global_colors.dart';
import '../../../global/global_login_field.dart';
import '../../../stores/login/login_store.dart';

class SignInEmailField extends StatefulWidget {
  const SignInEmailField({super.key});

  @override
  State<SignInEmailField> createState() => _SignInEmailFieldState();
}

class _SignInEmailFieldState extends State<SignInEmailField> {
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
