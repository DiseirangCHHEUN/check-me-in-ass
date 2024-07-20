import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../components/auth_button.dart';
import '../../../../components/auth_footer.dart';
import '../../../../components/auth_header.dart';
import '../../../../components/auth_textfield.dart';
import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  SignupView({super.key, required this.onPressed});
  final signUpController = Get.put(SignupController());
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    const AuthHeader(
                      signText: 'New EMP? Sign Up Now!',
                      welcomeText:
                          'Sign up to start your beautiful working day\nin our organization.',
                    ),
                    const SizedBox(height: 10),
                    AuthTextField(
                      icon: Icons.person,
                      onSaved: (p0) {},
                      controller: controller.fullNameController,
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
                      controller: controller.emailController,
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
                      controller: controller.passwordController,
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
                      controller: controller.confirmPasswordController,
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
                          child: AuthButton(
                              onPress: () {
                                if (controller.formKey.currentState!
                                    .validate()) {}
                              },
                              buttonText: 'sign up'),
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
      ),
    );
  }
}
