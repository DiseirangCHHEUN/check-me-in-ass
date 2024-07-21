import 'package:check_me_in_web_ass/app/modules/dashboard/views/dashboard_view.dart';
import 'package:check_me_in_web_ass/app/modules/employee/views/employee_view.dart';
import 'package:check_me_in_web_ass/app/modules/home/models/home_menu.dart';
import 'package:check_me_in_web_ass/app/modules/login/repository/auth_repository.dart';
import 'package:check_me_in_web_ass/app/modules/management/views/management_view.dart';
import 'package:check_me_in_web_ass/app/modules/setting/views/setting_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    var appSizeWidth = MediaQuery.of(context).size.width;
    var appSizeheight = MediaQuery.of(context).size.height;

    var pages = [
      const DashboardView(),
      const ManagementView(),
      const EmployeeView(),
      const SettingView(),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.asset('assets/app_icons/32.png'),
            ),
            // const SizedBox(width: 5),
            Text(
              '  Check Me In $appSizeWidth',
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              // Do some code to change theme mode
            },
            icon: const Icon(Icons.light_mode_rounded),
          ),
          const SizedBox(width: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            onPressed: () {
              // do some code for logout
              AuthRepository.instance.signOut();
            },
            child: appSizeWidth > 500
                ? const Row(
                    children: [
                      Text(
                        'Log Out',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 5),
                      Icon(Icons.logout_outlined),
                    ],
                  )
                : const Icon(Icons.logout_outlined),
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: SizedBox(
        height: appSizeheight,
        width: appSizeWidth,
        child: Row(
          children: [
            appSizeWidth > 800
                ? BigMenu(controller: controller)
                : SmallMenu(controller: controller),
            Obx(
              () => Expanded(
                child: pages[controller.currentIndex.value],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BigMenu extends StatelessWidget {
  const BigMenu({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220,
      // color: const Color(0xFFFFF48E),
      child: ListView.builder(
        itemCount: homeMenus.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            controller.changeIndex(index: index);
          },
          child: Obx(
            () {
              bool isCurrent = controller.currentIndex.value == index;
              Color selectedColor = Colors.white;
              return ListTile(
                tileColor: isCurrent ? const Color(0xFFFFA49D) : null,
                title: Text(
                  homeMenus[index].title,
                  style: TextStyle(
                    fontWeight: isCurrent ? FontWeight.bold : FontWeight.normal,
                    color: isCurrent ? selectedColor : Colors.black,
                  ),
                ),
                leading: Icon(
                  homeMenus[index].leadingIcon,
                  color: isCurrent ? selectedColor : Colors.black,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 14,
                  color: isCurrent ? selectedColor : Colors.black,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class SmallMenu extends StatelessWidget {
  const SmallMenu({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      // color: const Color(0xFFFFF48E),
      child: ListView.builder(
        itemCount: homeMenus.length,
        itemBuilder: (context, index) => Obx(
          () => IconButton(
            padding: const EdgeInsets.symmetric(vertical: 7),
            style: IconButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 10),
              shape: const RoundedRectangleBorder(),
              backgroundColor: controller.currentIndex.value == index
                  ? const Color(0xFFFFA49D)
                  : null,
            ),
            color: controller.currentIndex.value == index ? Colors.white : null,
            onPressed: () => controller.changeIndex(index: index),
            icon: Icon(homeMenus[index].leadingIcon),
          ),
        ),
      ),
    );
  }
}
