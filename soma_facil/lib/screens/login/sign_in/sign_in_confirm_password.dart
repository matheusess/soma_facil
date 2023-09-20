import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../../global/global_colors.dart';
import '../../../global/global_login_field.dart';
import '../../../stores/login/login_store.dart';

class SignInConfirmPassword extends StatefulWidget {
  const SignInConfirmPassword({super.key});

  @override
  State<SignInConfirmPassword> createState() => _SignInConfirmPasswordState();
}

class _SignInConfirmPasswordState extends State<SignInConfirmPassword> {
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
          Icons.password_rounded,
          color: color.black,
          size: 20,
        ),
        sufixIcon: IconButton(
          onPressed: () => loginStore.setConfirmPasswordObscure(),
          icon: Icon(
            loginStore.isConfirmPasswordObscure
                ? Icons.lock
                : Icons.lock_open_outlined,
          ),
        ),
        isObscureText: loginStore.isConfirmPasswordObscure,
        placeHolder: 'Confirme sua senha',
        keyboardType: TextInputType.emailAddress,
        setAttribute: loginStore.setConfirmationPassword,
        initialValue: loginStore.confirmPassword,
      ),
    );
  }
}
