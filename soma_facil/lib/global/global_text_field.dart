import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';

import 'global_colors.dart';

class GlobalTextField extends StatefulWidget {
  final bool isEnable;
  final Icon? prefixIcon;
  final String placeHolder;
  final String? initialValue;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final void Function(String) setAttribute;

  const GlobalTextField({
    super.key,
    this.prefixIcon,
    this.initialValue,
    required this.controller,
    required this.placeHolder,
    required this.setAttribute,
    required this.isEnable,
    required this.keyboardType,
  });

  @override
  State<GlobalTextField> createState() => _GlobalTextFieldState();
}

class _GlobalTextFieldState extends State<GlobalTextField> {
  GlobalColors color = GlobalColors();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => TextFormField(
        cursorColor: color.darkOrange,
        initialValue: widget.initialValue,
        onChanged: widget.setAttribute,
        controller: widget.controller,
        enabled: widget.isEnable,
        autofocus: false,
        style: GoogleFonts.nunito(
          textStyle: const TextStyle(
            letterSpacing: 1,
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 14,
          ),
        ),
        decoration: InputDecoration(
          fillColor: const Color.fromARGB(255, 240, 240, 240),
          filled: true,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 22,
          ),
          hintText: widget.placeHolder,
          hintStyle: GoogleFonts.nunito(
            textStyle: TextStyle(
              letterSpacing: 1,
              color: color.grey,
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
          ),
          disabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromARGB(255, 242, 242, 242),
              width: 1,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromARGB(255, 242, 242, 242),
              width: 1,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: color.orange,
              width: 1,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          focusColor: color.white,
        ),
        keyboardType: widget.keyboardType,
      ),
    );
  }
}
