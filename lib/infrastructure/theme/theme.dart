import 'package:flutter/material.dart';

import 'app_bar.theme.dart';
import 'button.theme.dart';
import 'colors.theme.dart';

ThemeData themeData = ThemeData(
  primaryColor:ColorsTheme.colPrimary,
  hintColor: ColorsTheme.colCC,
  appBarTheme: appBarTheme,
  elevatedButtonTheme: buttonTheme,
  fontFamily: "Poppins",
  scaffoldBackgroundColor: Colors.white, colorScheme: ColorScheme.fromSeed(
    seedColor: ColorsTheme.colPrimary,
    primary: ColorsTheme.colPrimary,
    secondary: ColorsTheme.colSecondary,
    brightness: Brightness.dark,
    background: ColorsTheme.colBackground,
  ).copyWith(background: ColorsTheme.colBackground),
);