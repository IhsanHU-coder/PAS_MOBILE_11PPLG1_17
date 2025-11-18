import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String labelText;
  final String hintText;
  final bool obscureText;

  const CustomField({
    super.key,
    required this.textEditingController,
    required this.labelText,
    required this.obscureText,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0), // Atur jarak di sekitar TextField
      child: TextField(
        obscureText: obscureText,
        controller: textEditingController,
        decoration: InputDecoration(
          labelText: labelText, // label sekarang dipakai
          hintText: hintText,
          border: OutlineInputBorder(), // biar lebih rapi
        ),
      ),
    );
  }
}
