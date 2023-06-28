import 'package:flutter/material.dart';

import '../../infrastructure/core/base/base_view.dart';

import 'splash_controller.dart';

class SplashScreen extends BaseView<SplashController> {
  SplashScreen({super.key});

  @override
  Widget body(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            controller.image,
            fit: BoxFit.cover,
          )
        ],
      ),
    );
  }
}
