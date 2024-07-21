import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/management_controller.dart';

class ManagementView extends GetView<ManagementController> {
  const ManagementView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ManagementView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ManagementView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
