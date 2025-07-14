import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class FoodieLogo extends StatelessWidget {
  const FoodieLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Fork and knife icon
        Container(
          width: 40,
          height: 40,
          decoration: const BoxDecoration(
            gradient: AppTheme.primaryGradient,
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.restaurant,
            color: Colors.white,
            size: 24,
          ),
        ),
        const SizedBox(width: 12),
        // App title
        ShaderMask(
          shaderCallback: (bounds) => AppTheme.primaryGradient.createShader(bounds),
          child: const Text(
            'Foodie Queue',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: 'Inter',
            ),
          ),
        ),
      ],
    );
  }
}