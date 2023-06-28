
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class LoginBackgroundTheme extends StatelessWidget{

  final Widget? child;

  const LoginBackgroundTheme({super.key,this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
       width: Get.width,
      height: Get.height,
      decoration:  const BoxDecoration(
        color: Colors.redAccent,
      ),
      child: child,
    );
  }

}