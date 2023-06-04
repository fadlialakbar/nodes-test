import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData? icon;
  final String? text;

  const CalculatorButton(
      {super.key, required this.onPressed, this.icon, this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: onPressed,
        child: icon != null
            ? Icon(icon)
            : Text(
                text!,
                style: const TextStyle(fontSize: 20),
              ),
      ),
    );
  }
}
