import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../global/global_colors.dart';
import '../../global/global_login_field.dart';
import '../../stores/login/login_store.dart';

class LoginPasswordField extends StatefulWidget {
  const LoginPasswordField({super.key});

  @override
  State<LoginPasswordField> createState() => _LoginPasswordFieldState();
}

class _LoginPasswordFieldState extends State<LoginPasswordField> {
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
        Icons.password,
        color: color.black,
        size: 20,
      ),
      placeHolder: 'Senha',
      keyboardType: TextInputType.emailAddress,
      setAttribute: (p0) => print('teste'),
    );
  }
}
