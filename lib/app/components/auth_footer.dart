import 'package:check_me_in/app/modules/auth/signin/controllers/signin_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/color_manager.dart';

class AuthFooter extends StatelessWidget {
  AuthFooter(
      {super.key,
      required this.btnSignText,
      required this.signText,
      required this.onPressed});

  final String signText, btnSignText;
  final Function()? onPressed;

  final controller = Get.put(SigninController());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: Divider()),
              Text(' OR '),
              Expanded(child: Divider()),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: ColorManager().appColor,
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  // backgroundColor:
                  //     controller.isLoading.value ? Colors.grey : ColorManager().bgColor,
                ),
                onPressed: () {
                  controller.signInWithGoogle();
                },
                child: Text(
                  'sign in with google'.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(signText),
            TextButton(
              onPressed: onPressed,
              child: Text(btnSignText),
            ),
          ],
        ),
      ],
    );
  }
}
