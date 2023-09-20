import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soma_facil/global/global_styles.dart';
import 'package:soma_facil/stores/login/login_store.dart';

import 'reset_password_button_field.dart';
import 'reset_password_email_field.dart';
import 'reset_password_header_widget.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final GlobalSpaces space = GlobalSpaces();
  LoginStore loginStore = LoginStore();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    loginStore = Provider.of<LoginStore>(context);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const ResetPasswordHeaderWidget(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            const ResetPasswordEmailField(),
            space.vSpace2,
            const ResetPasswordButtonField()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "backButton",
        onPressed: () => Navigator.pop(
          context,
        ),
        backgroundColor: color.darkOrange,
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}
