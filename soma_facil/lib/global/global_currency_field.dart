import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';

import 'global_colors.dart';
import 'global_currency_formatter.dart';

class GlobalCurrencyField extends StatefulWidget {
  final String placeHolder;
  final TextInputType keyboardType;
  final bool isEnable;
  final void Function(String) setAttribute;
  final TextEditingController controller;
  final String initialValue;

  const GlobalCurrencyField({
    super.key,
    required this.placeHolder,
    required this.controller,
    required this.keyboardType,
    required this.setAttribute,
    required this.isEnable,
    required this.initialValue,
  });

  @override
  State<GlobalCurrencyField> createState() => _GlobalCurrencyFieldState();
}

class _GlobalCurrencyFieldState extends State<GlobalCurrencyField> {
  GlobalColors color = GlobalColors();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => TextFormField(
        initialValue: widget.initialValue,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          GlobalCurrencyFormatter()
        ],
        onChanged: widget.setAttribute,
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
