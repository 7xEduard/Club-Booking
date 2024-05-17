import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.labelText, this.onPressed});
  final String? labelText;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      height: 50,
      color: const Color(0xFF17c3b2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          "$labelText",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 26,
          ),
        ),
      ),
    );
  }
}
