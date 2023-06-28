import 'package:bcpl_fun_club_project/infrastructure/theme/text.theme.dart';
import 'package:flutter/material.dart';


import '../../res.dart';
import 'colors.theme.dart';

AppBarTheme appBarTheme = const AppBarTheme();


appBarIconTitle({required Function onTapFunction,String? title,titleStyle,required margin}){
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      GestureDetector(
        onTap: () {
          onTapFunction();
        },
        child: Container(
            margin: margin,
            padding: const EdgeInsets.all(8),
            child: Image.asset(
              Res.back,
              width: 35,
              height: 35,
            )),
      ),
      title==null?Container():Padding(
        padding: const EdgeInsets.only(bottom: 2),
        child: Text(
          title,
          style: titleStyle??appBarTextStyle(color: ColorsTheme.colBlack),
        ),
      )
    ],
  );
}

