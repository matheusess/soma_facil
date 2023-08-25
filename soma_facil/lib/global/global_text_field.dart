import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';

import 'global_colors.dart';

class GlobalTextField extends StatefulWidget {
  final Icon? prefixIcon;
  final Color color;
  final String placeHolder;
  final TextInputType keyboardType;
  final void Function(String) setAttribute;
  final bool isObscureField;
  final bool isEnable;

  const GlobalTextField({
    super.key,
    required this.placeHolder,
    required this.keyboardType,
    required this.setAttribute,
    required this.isObscureField,
    required this.color,
    required this.isEnable,
    this.prefixIcon,
  });

  @override
  State<GlobalTextField> createState() => _GlobalTextFieldState();
}

class _GlobalTextFieldState extends State<GlobalTextField> {
  GlobalColorsLibrary color = GlobalColorsLibrary();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromARGB(255, 240, 240, 240),
        ),
        height: 64,
        child: TextFormField(
          obscureText: widget.isObscureField,
          onChanged: widget.setAttribute,
          enabled: widget.isEnable,
          autofocus: false,
          style: GoogleFonts.quicksand(
            textStyle: TextStyle(
              letterSpacing: 1,
              color: widget.color,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
          decoration: InputDecoration(
            prefixIcon: widget.prefixIcon,
            fillColor: const Color.fromARGB(255, 240, 240, 240),
            filled: true,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 18.0, vertical: 2.0),
            hintText: widget.placeHolder,
            hintStyle: GoogleFonts.quicksand(
              textStyle: TextStyle(
                letterSpacing: 1,
                color: color.grey,
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
            disabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromARGB(255, 240, 240, 240),
                width: 1,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(90.0),
              ),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromARGB(255, 240, 240, 240),
                width: 1,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(90.0),
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromARGB(255, 240, 240, 240),
                width: 1,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(90.0),
              ),
            ),
          ),
          keyboardType: widget.keyboardType,
        ),
      ),
    );
  }
}
