import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'colors.theme.dart';



class AppBackGround extends StatelessWidget{

  final Widget? child;

  const AppBackGround({super.key,this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      decoration:   BoxDecoration(
          color: ColorsTheme.col36b38b,
      ),
      child: child,
    );
  }

}