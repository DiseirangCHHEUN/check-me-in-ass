import 'package:flutter/material.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({
    super.key,
    required this.signText,
    required this.welcomeText,
  });

  final String welcomeText, signText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset('assets/app_icons/152.png'),
        ),
        // const SizedBox(height: 16),
        Image(
          image: AssetImage('assets/splash/branding.png'),
          width: 200,
        ),
        // Text(
        //   'check me in'.toUpperCase(),
        //   style: const TextStyle(
        //     fontWeight: FontWeight.bold,
        //     fontSize: 30,
        //   ),
        // ),
        // Text(
        //   signText,
        //   style: const TextStyle(
        //     fontWeight: FontWeight.bold,
        //     fontSize: 24,
        //   ),
        // ),
        const SizedBox(height: 10),
        Text(
          textAlign: TextAlign.center,
          welcomeText,
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
