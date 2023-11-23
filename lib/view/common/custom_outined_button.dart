import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomOutlinedButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          side:  BorderSide(color: Colors.grey.shade500, width: 0.8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          )),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(color: Colors.grey.shade500),
      ),
    );
  }
}
