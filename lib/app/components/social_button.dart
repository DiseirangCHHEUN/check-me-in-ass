import 'package:flutter/material.dart';
import '../constants/color_manager.dart';

class SocialButton extends StatefulWidget {
  const SocialButton({
    super.key,
  });

  @override
  State<SocialButton> createState() => _SocialButtonState();
}

class _SocialButtonState extends State<SocialButton>
    with SingleTickerProviderStateMixin {
  // final _authService = AuthService();

  AnimationController? animationController;
  Animation<Offset>? gSlideAnimation;
  Animation<Offset>? fSlideAnimation;
  Animation<Offset>? aSlideAnimation;
  Animation<Offset>? tSlideAnimation;
  initAnimationController() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
      animationBehavior: AnimationBehavior.preserve,
    );

    // slide from left to right
    gSlideAnimation = Tween<Offset>(
      begin: const Offset(-10, 0),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: animationController!,
        curve: Curves.decelerate,
      ),
    );

    // slide from down to top
    aSlideAnimation = Tween<Offset>(
      begin: const Offset(0, 10),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: animationController!,
        curve: Curves.decelerate,
      ),
    );

    // slide from top to down
    tSlideAnimation = Tween<Offset>(
      begin: const Offset(0, -10),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: animationController!,
        curve: Curves.decelerate,
      ),
    );

    // slide from right to left
    fSlideAnimation = Tween<Offset>(
      begin: const Offset(10, 0),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: animationController!,
        curve: Curves.decelerate,
      ),
    );

    animationController?.forward();
  }

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 700));
    initAnimationController();
    super.initState();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // SlideTransition(
        //   position: gSlideAnimation!,
        //   child: buildSocialButtonItem(
        //     icon: Icons.g_mobiledata_rounded,
        //     onTap: () => SignInController.instance.signInWithGoogle(),
        //   ),
        // ),
        SlideTransition(
          position: aSlideAnimation!,
          child: buildSocialButtonItem(
            icon: Icons.apple_rounded,
            onTap: () {},
          ),
        ),
        SlideTransition(
          position: tSlideAnimation!,
          child: buildSocialButtonItem(
            icon: Icons.telegram_rounded,
            onTap: () {},
          ),
        ),
        SlideTransition(
          position: fSlideAnimation!,
          child: buildSocialButtonItem(
            icon: Icons.facebook_rounded,
            onTap: () {},
          ),
        ),
      ],
    );
  }

  GestureDetector buildSocialButtonItem({
    required IconData icon,
    required Function() onTap,
    double size = 45,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: ColorManager().bgColor,
        child: Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            icon,
            size: size,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
