import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'global_colors.dart';
import 'global_styles.dart';

class GlobalMenuItem extends StatefulWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final String label;
  const GlobalMenuItem(
      {super.key,
      required this.icon,
      required this.onPressed,
      required this.label});

  @override
  State<GlobalMenuItem> createState() => _GlobalMenuItemState();
}

class _GlobalMenuItemState extends State<GlobalMenuItem> {
  @override
  Widget build(BuildContext context) {
    final GlobalColors color = GlobalColors();
    final GlobalSpaces spaces = GlobalSpaces();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
      child: TextButton(
        onPressed: widget.onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              widget.icon,
              size: 18,
              color: color.blue,
            ),
            spaces.hSpace,
            Text(
              widget.label,
              style: GoogleFonts.quicksand(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: color.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
