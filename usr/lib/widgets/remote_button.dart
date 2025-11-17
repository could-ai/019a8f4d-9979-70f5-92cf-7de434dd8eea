import 'package:flutter/material.dart';

class RemoteButton extends StatelessWidget {
  final IconData? icon;
  final Widget? child;
  final VoidCallback onPressed;
  final Color? color;
  final Color? backgroundColor;

  const RemoteButton({
    super.key,
    this.icon,
    this.child,
    required this.onPressed,
    this.color,
    this.backgroundColor,
  }) : assert(icon != null || child != null);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(15),
        backgroundColor: backgroundColor ?? Colors.grey[850],
        foregroundColor: color ?? Colors.white,
        elevation: 5,
      ),
      child: child ?? Icon(icon, size: 30),
    );
  }
}
