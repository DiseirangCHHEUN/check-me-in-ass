import 'package:check_me_in/app/constants/color_manager.dart';
import 'package:check_me_in/app/modules/auth/signin/controllers/signin_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    super.key,
    required this.onPress,
    required this.buttonText,
  });

  final void Function()? onPress;
  final String buttonText;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SigninController());

    return FilledButton(
      onPressed: onPress,
      style: FilledButton.styleFrom(
        backgroundColor: ColorManager().appColor,
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        // backgroundColor:
        //     controller.isLoading.value ? Colors.grey : ColorManager().bgColor,
      ),
      // child: Text(
      //   buttonText.toUpperCase(),
      //   style: const TextStyle(
      //     fontSize: 18.0,
      //     fontWeight: FontWeight.bold,
      //   ),
      // ),
      child: Obx(
        () {
          if (controller.isLoading.value) {
            return const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Loading... ',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2,
                  ),
                ),
              ],
            );
          } else {
            return Text(
              buttonText.toUpperCase(),
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            );
          }
        },
      ),
    );
  }
}
