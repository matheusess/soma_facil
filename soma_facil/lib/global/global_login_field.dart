import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';

import 'global_colors.dart';

class GlobalLoginField extends StatefulWidget {
  final bool isEnable;
  final Icon? prefixIcon;
  final IconButton? sufixIcon;
  final bool? isObscureText;
  final String placeHolder;
  final String? initialValue;
  final TextInputType keyboardType;
  final void Function(String) setAttribute;

  const GlobalLoginField({
    super.key,
    this.prefixIcon,
    this.sufixIcon,
    this.isObscureText,
    this.initialValue,
    required this.placeHolder,
    required this.setAttribute,
    required this.isEnable,
    required this.keyboardType,
  });

  @override
  State<GlobalLoginField> createState() => _GlobalLoginFieldState();
}

class _GlobalLoginFieldState extends State<GlobalLoginField> {
  GlobalColors color = GlobalColors();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color.fromARGB(255, 242, 242, 242),
        ),
        height: 64,
        child: TextFormField(
          initialValue: widget.initialValue,
          onChanged: widget.setAttribute,
          enabled: widget.isEnable,
          autofocus: false,
          obscureText: widget.isObscureText ?? false,
          style: GoogleFonts.nunito(
            textStyle: const TextStyle(
              letterSpacing: 1,
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
          decoration: InputDecoration(
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.sufixIcon,
            fillColor: const Color.fromARGB(255, 242, 242, 242),
            filled: true,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 18.0, vertical: 2.0),
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
                Radius.circular(90.0),
              ),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromARGB(255, 242, 242, 242),
                width: 1,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(90.0),
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromARGB(255, 242, 242, 242),
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
