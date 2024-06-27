import 'package:flutter/material.dart';
import 'package:screenerplus/utils/styles.dart';

class ColorfulButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  ColorfulButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Styles.buttonColor,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}
