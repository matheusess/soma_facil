import 'package:flutter/material.dart';

class GlobalBackButton extends StatelessWidget {
  final VoidCallback onPressed;
  const GlobalBackButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: CircleAvatar(
        backgroundColor: const Color.fromARGB(255, 233, 233, 233),
        child: IconButton(
          highlightColor: Colors.white,
          onPressed: onPressed,
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.black,
            size: 24,
          ),
        ),
      ),
    );
  }
}
