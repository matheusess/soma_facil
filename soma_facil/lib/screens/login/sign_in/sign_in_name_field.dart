import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../global/global_colors.dart';
import '../../../global/global_login_field.dart';
import '../../../stores/login/login_store.dart';

class SignInNameField extends StatefulWidget {
  const SignInNameField({super.key});

  @override
  State<SignInNameField> createState() => _SignInNameFieldState();
}

class _SignInNameFieldState extends State<SignInNameField> {
  final GlobalColors color = GlobalColors();
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
        Icons.person,
        color: color.black,
        size: 20,
      ),
      placeHolder: 'Felipe Cruz',
      keyboardType: TextInputType.name,
      setAttribute: loginStore.setName,
      initialValue: loginStore.name,
    );
  }
}
