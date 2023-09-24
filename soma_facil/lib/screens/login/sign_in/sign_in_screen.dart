import 'package:flutter/material.dart';
import 'package:soma_facil/global/global_styles.dart';
import 'package:soma_facil/screens/login/sign_in/sign_in_bottom_buttons_widget.dart';
import 'package:soma_facil/screens/login/sign_in/sign_in_chip_row_widget.dart';
import 'package:soma_facil/screens/login/sign_in/sign_in_confirm_password.dart';
import 'package:soma_facil/screens/login/sign_in/sign_in_email_field.dart';

import 'package:soma_facil/screens/login/sign_in/sign_in_header_widget.dart';
import 'package:soma_facil/screens/login/sign_in/sign_in_name_field.dart';
import 'package:soma_facil/screens/login/sign_in/sign_in_password_field.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalSpaces spaces = GlobalSpaces();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      /*appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const SignInHeaderWidget(),
      ),*/
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset('images/bg-login7.png'),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  spaces.vSpace8,
                  const SignInHeaderWidget(),
                  spaces.vSpace6,
                  const SignInNameField(),
                  spaces.vSpace3,
                  const SignInEmailField(),
                  spaces.vSpace3,
                  const SignInPasswordFiled(),
                  spaces.vSpace3,
                  const SignInConfirmPassword(),
                  spaces.vSpace5,
                  const SignInChipRowWidget()
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const SignInBottomButtonsWidget(),
    );
  }
}
