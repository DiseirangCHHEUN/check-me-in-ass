import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:check_me_in/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardViewV2 extends GetView<DashboardController> {
  const DashboardViewV2({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
          body: controller.pages[controller.currentIndex.value],
          bottomNavigationBar: AnimatedNotchBottomBar(
            /// Provide NotchBottomBarController
            notchBottomBarController: controller.notchController,
            // color: Colors.white,
            showLabel: true,
            textOverflow: TextOverflow.visible,
            maxLine: 1,
            // shadowElevation: 5,
            kBottomRadius: 28.0,

            // notchShader: const SweepGradient(
            //   startAngle: 0,
            //   endAngle: pi / 2,
            //   colors: [Colors.red, Colors.green, Colors.orange],
            //   tileMode: TileMode.mirror,
            // ).createShader(Rect.fromCircle(center: Offset.zero, radius: 8.0)),
            // notchColor: Colors.white,

            /// restart app if you change or remove Margins
            removeMargins: false,
            bottomBarWidth: 500,
            showShadow: false,
            durationInMilliSeconds: 300,

            itemLabelStyle: const TextStyle(fontSize: 10),

            elevation: 1,
            bottomBarItems: const [
              BottomBarItem(
                inActiveItem: Icon(
                  Icons.home_filled,
                  color: Colors.blueGrey,
                ),
                activeItem: Icon(
                  Icons.home_filled,
                  color: Colors.amber,
                ),
              ),
              BottomBarItem(
                inActiveItem: Icon(
                  Icons.person_rounded,
                  color: Colors.blueGrey,
                ),
                activeItem: Icon(
                  Icons.person_rounded,
                  color: Colors.amber,
                ),
              ),
              BottomBarItem(
                inActiveItem: Icon(
                  Icons.settings,
                  color: Colors.blueGrey,
                ),
                activeItem: Icon(
                  Icons.settings,
                  color: Colors.amber,
                ),
              ),
            ],
            onTap: (index) {
              controller.onChangePageIndex(index);
            },
            kIconSize: 24.0,
          )),
    );
  }
}
