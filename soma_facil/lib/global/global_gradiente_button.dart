import 'package:flutter/material.dart';

class GlobalGradientButton extends StatelessWidget {
  final Widget child;
  final Gradient gradient;
  final bool isFluid;
  final VoidCallback onPressed;

  const GlobalGradientButton({
    required this.child,
    required this.gradient,
    required this.onPressed,
    required this.isFluid,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isFluid ? double.infinity : 120,
      height: 54,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(15),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.grey[500],
        //     offset: Offset(0.0, 1.5),
        //     blurRadius: 1.5,
        //   ),
        // ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          child: Center(
            child: child,
          ),
        ),
      ),
    );
  }
}
