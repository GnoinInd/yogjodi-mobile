import 'package:flutter/material.dart';

class BorderButton extends StatelessWidget {
  final double width;
  final EdgeInsetsGeometry padding;
  final Color bgColor;
  final Color borderColor;
  final BoxShadow boxShadow;
  final Widget child;
  final VoidCallback onPressed;

  const BorderButton({
    super.key,
    this.width = double.infinity,
    this.padding = const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
    this.bgColor = Colors.transparent,
    this.boxShadow = const BoxShadow(color: Colors.transparent),
    required this.borderColor,
    required this.child,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        decoration: BoxDecoration(
          color: bgColor,
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(30.0),
          boxShadow: [
            boxShadow,
          ],
        ),
        padding: padding,
        child: Center(
          child: child,
        ),
      ),
    );
  }
}
