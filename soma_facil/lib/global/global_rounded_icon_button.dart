import 'package:flutter/material.dart';

class GlobalRoundedIconButton extends StatefulWidget {
  final Color backgroundColor;
  final Icon icon;
  final VoidCallback onPressed;

  const GlobalRoundedIconButton({
    super.key,
    required this.backgroundColor,
    required this.icon,
    required this.onPressed,
  });

  @override
  State<GlobalRoundedIconButton> createState() =>
      _GlobalRoundedIconButtonState();
}

class _GlobalRoundedIconButtonState extends State<GlobalRoundedIconButton> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      color: widget.backgroundColor,
      textColor: Colors.white,
      padding: const EdgeInsets.all(10),
      shape: const CircleBorder(
        side: BorderSide(
          width: 0,
          color: Color.fromARGB(255, 162, 162, 162),
        ),
      ),
      onPressed: widget.onPressed,
      child: widget.icon,
    );
  }
}
