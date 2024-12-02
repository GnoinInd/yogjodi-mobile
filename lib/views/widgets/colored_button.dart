import 'package:flutter/material.dart';

class ColoredButton extends StatelessWidget {
  final double width;
  final EdgeInsetsGeometry padding;
  final Color color;
  final Widget child;
  final double radius;
  final VoidCallback onPressed;

  const ColoredButton({
    super.key,
    this.width = double.infinity,
    this.padding = const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
    required this.color,
    required this.child,
    this.radius = 5.0,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onPressed,
          child: Container(
            width: width,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(radius),
            ),
            padding: padding,
            child: Center(
              child: child,
            ),
          ),
        ),
      ],
    );
  }
}
