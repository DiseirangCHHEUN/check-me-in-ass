import 'package:check_me_in/app/modules/auth/auth_repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                AuthRepository.instance.signOut();
              },
              icon: const Icon(Icons.logout_rounded))
        ],
        title: const Text('DashboardView'),
        centerTitle: true,
      ),
      body: Obx(
        () {
          if (AuthRepository().isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return const Center(
              child: Text(
                'DashboardView is working',
                style: TextStyle(fontSize: 20),
              ),
            );
          }
        },
      ),
    );
  }
}
