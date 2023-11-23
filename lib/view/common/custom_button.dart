import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget buttonText;
  final Color? buttonColor;
  final Color? borderColor;

  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.buttonText,
    this.buttonColor, this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        // Text color of the button
        backgroundColor: buttonColor,
        elevation: 4, // Elevation of the button
        shape: RoundedRectangleBorder(
          side: BorderSide(color: borderColor ?? Colors.transparent,width: 0.5),
          borderRadius: BorderRadius.circular(6), // Border radius of the button
        ),
      ),
      child: buttonText,
    );
  }
}
