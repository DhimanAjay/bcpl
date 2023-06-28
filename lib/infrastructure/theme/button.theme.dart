import 'package:bcpl_fun_club_project/infrastructure/theme/text.theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'colors.theme.dart';

ElevatedButtonThemeData buttonTheme = ElevatedButtonThemeData(
    style: ButtonStyle(
        shape: MaterialStateProperty.resolveWith<OutlinedBorder>((_) {
          return RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10));
        }),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (states) => ColorsTheme.colBackground)));


customButton({required String text,textStyle,margin,buttonColor,borderRadius,width}){
  return Container(
    decoration: BoxDecoration(
      color: buttonColor??ColorsTheme.colPrimary,
      borderRadius: BorderRadius.circular(borderRadius??15),
    ),
    width: width??Get.size.width,
    margin: margin,
    height: 60,
    padding: const EdgeInsets.symmetric(horizontal: 39,vertical: 21),
    alignment: Alignment.center,
    child: Text(
      text,
      style: textStyle??mediumTextStyle(fontSize: dimen14, color: ColorsTheme.colWhite),
    ),
  );
}
