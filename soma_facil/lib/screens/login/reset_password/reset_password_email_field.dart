import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soma_facil/global/global_colors.dart';
import 'package:soma_facil/stores/login/login_store.dart';

import '../../../global/global_login_field.dart';

class ResetPasswordEmailField extends StatefulWidget {
  const ResetPasswordEmailField({super.key});

  @override
  State<ResetPasswordEmailField> createState() =>
      _ResetPasswordEmailFieldState();
}

class _ResetPasswordEmailFieldState extends State<ResetPasswordEmailField> {
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
      setAttribute: (p0) => print('teste'),
    );
  }
}
