import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/waiting_controller.dart';

class WaitingView extends GetView<WaitingController> {
  const WaitingView({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          color: Color(0xffffdd99),
        ),
      ),
    );
  }
}
