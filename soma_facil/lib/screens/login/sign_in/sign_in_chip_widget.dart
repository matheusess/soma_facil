import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:soma_facil/global/global_colors.dart';
import 'package:soma_facil/global/global_styles.dart';

class SignInChipWidget extends StatefulWidget {
  final String label;
  final bool isValid;
  const SignInChipWidget({
    super.key,
    required this.label,
    required this.isValid,
  });

  @override
  State<SignInChipWidget> createState() => _SignInChipWidgetState();
}

class _SignInChipWidgetState extends State<SignInChipWidget> {
  final GlobalColors color = GlobalColors();
  final GlobalSpaces space = GlobalSpaces();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        right: 12,
        left: 4,
        top: 4,
        bottom: 4,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: widget.isValid ? color.green : color.lightGrey,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: const Color.fromARGB(236, 255, 255, 255),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Icon(
              widget.isValid ? Icons.check : Icons.close,
              size: 18,
              color: widget.isValid ? color.green : color.grey,
            ),
          ),
          space.hSpace,
          Text(
            widget.label,
            style: GoogleFonts.quicksand(
              color: widget.isValid ? color.black : color.darkGrey,
              fontWeight: widget.isValid ? FontWeight.w600 : FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
