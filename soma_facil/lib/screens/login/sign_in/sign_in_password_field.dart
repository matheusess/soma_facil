import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../../global/global_colors.dart';
import '../../../global/global_login_field.dart';
import '../../../stores/login/login_store.dart';

class SignInPasswordFiled extends StatefulWidget {
  const SignInPasswordFiled({super.key});

  @override
  State<SignInPasswordFiled> createState() => _SignInPasswordFiledState();
}

class _SignInPasswordFiledState extends State<SignInPasswordFiled> {
  GlobalColors color = GlobalColors();
  LoginStore loginStore = LoginStore();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    loginStore = Provider.of<LoginStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => GlobalLoginField(
        isEnable: true,
        prefixIcon: Icon(
          Icons.password,
          color: color.black,
          size: 20,
        ),
        sufixIcon: IconButton(
          onPressed: () => loginStore.setPasswordObscure(),
          icon: Icon(
            loginStore.isPasswordObscure
                ? Icons.lock
                : Icons.lock_open_outlined,
          ),
        ),
        isObscureText: loginStore.isPasswordObscure,
        placeHolder: 'Digite sua senha',
        keyboardType: TextInputType.emailAddress,
        setAttribute: loginStore.setPassword,
        initialValue: loginStore.password,
      ),
    );
  }
}
