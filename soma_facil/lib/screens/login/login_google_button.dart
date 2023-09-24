import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:soma_facil/global/global_colors.dart';

import '../../stores/login/login_store.dart';

class LoginGoogleButton extends StatefulWidget {
  const LoginGoogleButton({super.key});

  @override
  State<LoginGoogleButton> createState() => _LoginGoogleButtonState();
}

class _LoginGoogleButtonState extends State<LoginGoogleButton> {
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
      builder: (_) => SizedBox(
        width: 50,
        height: 50,
        child: TextButton(
          onPressed: !loginStore.isLoading
              ? () {
                  loginStore.googleLogin();
                }
              : null,
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
                side: BorderSide(
                  color: loginStore.isLoading ? color.grey : color.black,
                  width: 1.4,
                ),
              ),
            ),
          ),
          child: loginStore.isGoogleLoading
              ? const Padding(
                  padding: EdgeInsets.symmetric(vertical: 4),
                  child: CircularProgressIndicator(
                    strokeWidth: 3,
                    valueColor: AlwaysStoppedAnimation(
                      Color.fromARGB(221, 0, 0, 0),
                    ),
                  ),
                )
              : SvgPicture.asset(
                  'images/google-l.svg',
                  height: 22.0,
                  width: 100.0,
                  // ignore: deprecated_member_use
                  color: loginStore.isLoading ? color.grey : color.black,
                ),
        ),
      ),
    );
  }
}
