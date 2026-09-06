import 'package:flutter/material.dart';

class AppIconButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final IconData icon;
  final double size;
  final EdgeInsetsGeometry padding;
  final AlignmentGeometry alignment;
  const AppIconButton({
    super.key,
    this.onPressed,
    required this.icon,
    this.size = 20,
    this.padding = EdgeInsets.zero,
    this.alignment = Alignment.centerLeft,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed:
          onPressed ??
          () {
            Navigator.of(context).maybePop();
          },
      padding: padding,
      alignment: alignment,
      icon: Icon(icon, size: size),
    );
  }
}
