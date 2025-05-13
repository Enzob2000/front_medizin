
import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType? keyboardType;
  final bool obscureText;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;

  const AuthTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.keyboardType,
    this.obscureText = false,
    this.validator,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey[400]),
        filled: true,
        fillColor: Colors.grey[200],
        contentPadding: const EdgeInsets.symmetric(
          vertical: 19.0,
          horizontal: 24.0,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(19.0),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(19.0),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(19.0),
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 0, 87, 255),
            width: 1.5,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(19.0),
          borderSide: const BorderSide(color: Colors.red, width: 1.5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(19.0),
          borderSide: const BorderSide(color: Colors.red, width: 1.5),
        ),
        suffixIcon: suffixIcon,
      ),
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator,
    );
  }
}
