import 'package:flutter/material.dart';

class BuildAppLargeText extends StatelessWidget {
  final double size;
  final String text;
  final Color color;
  const BuildAppLargeText({
    super.key,
    required this.text,
    this.color = Colors.black,
    this.size = 30,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
