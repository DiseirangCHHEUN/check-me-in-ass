import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../components/auth_button.dart';
import '../../../../components/auth_footer.dart';
import '../../../../components/auth_header.dart';
import '../../../../components/auth_textfield.dart';
import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  SignupView({super.key, required this.onPressed});

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const AuthHeader(
                    signText: 'Sign Up!',
                    welcomeText:
                        'Sign up now to start working on our organization.',
                  ),
                  const SizedBox(height: 16),
                  AuthTextField(
                    icon: Icons.person,
                    onSaved: (p0) {},
                    controller: _fullNameController,
                    label: 'Full name',
                    keyboardType: TextInputType.emailAddress,
                    validator: (p0) {
                      if (p0!.isEmpty) {
                        return 'Full name is empty.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  AuthTextField(
                    icon: Icons.email_rounded,
                    onSaved: (p0) {},
                    controller: _emailController,
                    label: 'Email',
                    keyboardType: TextInputType.emailAddress,
                    validator: (p0) {
                      if (p0!.isEmpty) {
                        return 'Email is empty.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  AuthTextField(
                    icon: Icons.lock_rounded,
                    onSaved: (p0) {},
                    controller: _passwordController,
                    label: 'Password',
                    keyboardType: TextInputType.emailAddress,
                    validator: (p0) {
                      if (p0!.isEmpty) {
                        return 'Password is empty.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  AuthTextField(
                    icon: Icons.lock_rounded,
                    onSaved: (p0) {},
                    controller: _confirmPasswordController,
                    label: 'Confirm password',
                    keyboardType: TextInputType.emailAddress,
                    validator: (p0) {
                      if (p0!.isEmpty) {
                        return 'Confirm password is empty.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child:
                            AuthButton(onPress: () {}, buttonText: 'sign up'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  AuthFooter(
                    onPressed: onPressed,
                    signText: "Already have an account?",
                    btnSignText: 'Sign in.',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
