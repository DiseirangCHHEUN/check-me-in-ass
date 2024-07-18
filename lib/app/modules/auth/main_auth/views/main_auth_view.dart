import 'package:check_me_in/app/modules/auth/signin/views/signin_view.dart';
import 'package:check_me_in/app/modules/auth/signup/views/signup_view.dart';
import 'package:flutter/material.dart';

class MainAuthView extends StatefulWidget {
  const MainAuthView({super.key});

  @override
  State<MainAuthView> createState() => _MainAuthViewState();
}

class _MainAuthViewState extends State<MainAuthView> {
  bool isSignIn = true;

  onToggle() {
    setState(() {
      isSignIn = !isSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isSignIn) {
      return SigninView(onPressed: onToggle);
    } else {
      return SignupView(onPressed: onToggle);
    }
  }
}
