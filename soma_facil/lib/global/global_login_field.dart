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

  final FocusNode _textFieldFocus = FocusNode();
  Color _color = const Color.fromARGB(255, 242, 242, 242);

  @override
  void initState() {
    _textFieldFocus.addListener(() {
      if (_textFieldFocus.hasFocus) {
        setState(() {
          _color = Colors.white;
        });
      } else {
        setState(() {
          _color = const Color.fromARGB(255, 242, 242, 242);
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => TextFormField(
        focusNode: _textFieldFocus,
        initialValue: widget.initialValue,
        onChanged: widget.setAttribute,
        enabled: widget.isEnable,
        autofocus: false,
        obscureText: widget.isObscureText ?? false,
        style: GoogleFonts.quicksand(
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
          fillColor: _color,
          filled: true,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 22,
          ),
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
