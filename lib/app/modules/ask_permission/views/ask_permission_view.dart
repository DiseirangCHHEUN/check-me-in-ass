import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/ask_permission_controller.dart';

class AskPermissionView extends GetView<AskPermissionController> {
  const AskPermissionView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AskPermissionView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AskPermissionView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
