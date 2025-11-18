import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color textColour;
  final VoidCallback onPressed;

  const CustomButton({
    super.key, 
    required this.text, 
    required this.textColour, 
    required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text, style: TextStyle(color: textColour),),
    );
  }
}