import 'package:flutter/material.dart';

Padding buildTextFormField({
  required String hintText,
  required TextInputType keyboardType,
  required String? Function(String?)? validator,
  IconButton? suffix,
  required TextEditingController controller,
  bool obscureText = false, // Add this parameter
}) {
  return Padding(
    padding: const EdgeInsets.all(16.0), // Adjust padding here
    child: TextFormField(
      controller: controller,
      maxLength: 30,
      keyboardType: keyboardType,
      obscureText: obscureText, // Use this for password fields
      decoration: InputDecoration(
        counterText: "",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
          borderSide: BorderSide(color: Colors.blue),
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: 20,
        ),
        suffixIcon: suffix,
      ),
      validator: validator,
    ),
  );
}
