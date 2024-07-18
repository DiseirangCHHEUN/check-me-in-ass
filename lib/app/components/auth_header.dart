import 'package:flutter/material.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader(
      {super.key, required this.signText, required this.welcomeText});

  final String welcomeText, signText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        Text(
          'check me in'.toUpperCase(),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        Text(
          signText,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          textAlign: TextAlign.center,
          welcomeText,
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
