import 'package:check_me_in/app/components/auth_button.dart';
import 'package:check_me_in/app/components/auth_header.dart';
import 'package:check_me_in/app/components/auth_textfield.dart';
import 'package:check_me_in/app/modules/home/views/home_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/signin_controller.dart';

class SignInView extends GetView<SigninController> {
  const SignInView({
    super.key,
  });

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
                      signText: 'Sign In!',
                      welcomeText:
                          'Please sign in to check in/out from your work.',
                    ),
                    const SizedBox(height: 16),
                    AuthTextField(
                      icon: Icons.email_rounded,
                      onSaved: (p0) {},
                      controller: controller.idController,
                      label: 'Id',
                      keyboardType: TextInputType.emailAddress,
                      validator: (p0) {
                        if (p0!.isEmpty) {
                          return 'Id is empty.';
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
                    Row(
                      children: [
                        Expanded(
                          child: AuthButton(
                              onPress: () async {
                                FocusScope.of(context).unfocus();
                                String id = controller.idController.text.trim();
                                String password =
                                    controller.passwordController.text.trim();

                                if (id.isEmpty) {
                                  Get.snackbar('Failed', 'ID is still empty!');
                                } else if (password.isEmpty) {
                                  Get.snackbar(
                                      'Failed', 'Password is still empty!');
                                } else {
                                  QuerySnapshot snap = await FirebaseFirestore
                                      .instance
                                      .collection('test')
                                      .where('id', isEqualTo: id)
                                      .get();

                                  try {
                                    // DocumentSnapshot userdocs = snap.docs.first;
                                    if (snap.docs[0]['password'] == password) {
                                      Get.to(const HomeView());
                                    } else {
                                      Get.snackbar(
                                          'Failed', 'Password is incorrect');
                                    }
                                  } catch (e) {
                                    controller.setError(e.toString());
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Obx(
                                          () {
                                            return Text(controller.error.value);
                                          },
                                        ),
                                      ),
                                    );
                                  }
                                }
                              },
                              buttonText: 'sign in'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
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
