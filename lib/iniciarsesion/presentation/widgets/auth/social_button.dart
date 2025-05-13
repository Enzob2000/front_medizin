
import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  final String imagePath;
  final String label;
  final VoidCallback onPressed;

  const SocialButton({
    super.key,
    required this.imagePath,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        side: BorderSide.none,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        backgroundColor: const Color.fromARGB(255, 227, 227, 227),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(imagePath, width: 24, height: 24),
              const SizedBox(width: 22),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 114, 109, 109),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
