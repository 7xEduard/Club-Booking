import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  final String? hintText;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final TextInputType? keyboardType;

  const PasswordField(
      {super.key,
      this.hintText,
      this.onChanged,
      this.validator,
      required this.controller,
      this.keyboardType = TextInputType.text});

  @override
  // ignore: library_private_types_in_public_api
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _isHidden = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      onChanged: widget.onChanged,
      obscureText: _isHidden,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: Icon(
            _isHidden ? Icons.visibility_off : Icons.visibility,
          ),
          onPressed: () {
            setState(() {
              _isHidden = !_isHidden;
            });
          },
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 216, 214, 214),
            width: 2.0,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            width: 2,
            style: BorderStyle.solid,
            color: Colors.red,
          ),
        ),
         focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            width: 2,
            style: BorderStyle.solid,
            color: Colors.red,
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
        prefixIcon: const Icon(
          Icons.lock_outline_rounded,
          color: Colors.grey,
        ),
        filled: true,
        fillColor: Colors.grey.withOpacity(0.1),
        hintText: widget.hintText,
        hintStyle: const TextStyle(color: Colors.grey),
      ),
    );
  }
}
