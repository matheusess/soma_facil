import 'package:flutter/material.dart';
import 'package:soma_facil/global/global_back_button.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: GlobalBackButton(
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(),
    );
  }
}
