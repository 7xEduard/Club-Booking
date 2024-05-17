import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key, this.hintText, this.icon, this.onChanged, this.validator});
  final String? hintText;
  final IconData? icon;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      validator: validator,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 216, 214, 214),
            width: 2.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            width: 2,
            style: BorderStyle.solid,
            color: Color(0xFF17c3b2),
          ),
        ),
        prefixIcon: Icon(
          icon,
          color: Colors.grey,
        ),
        filled: true,
        fillColor: Colors.grey.withOpacity(0.1),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
      ),
    );
  }
}
