import 'package:flutter/material.dart';

class CustomFAB extends StatelessWidget {
  final VoidCallback onPressed;

  const CustomFAB({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 56,
        width: 56,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.orange, width: 2),
          color: Colors.white70, // Optional: to match background
        ),
        child: const Center(
          child: Icon(
            Icons.add,
            color: Colors.orange,
            size: 28,
          ),
        ),
      ),
    );
  }
}
