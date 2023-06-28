import 'package:flutter/material.dart';

import 'app_theme_service.dart';
import 'colors.theme.dart';


lightTextStyle({required fontSize,required color,height}) {
  return TextStyle(fontSize: fontSize, color: color,fontWeight: FontWeight.w300,fontFamily: 'PoppinsRegular.otf');
}

regularTextStyle({required fontSize,required color,height}) {
  return TextStyle(fontSize: fontSize, color: color,fontWeight: FontWeight.w400,fontFamily: 'PoppinsRegular.otf');
}

mediumTextStyle({required fontSize,required color,height}) {
  return TextStyle(fontSize: fontSize, color: color,fontWeight: FontWeight.w500,fontFamily: 'PoppinsMedium.otf');
}

semiBoldTextStyle({required fontSize,required color,height}) {
  return TextStyle(fontSize: fontSize, color: color,fontWeight: FontWeight.w600,fontFamily: 'PoppinsSemiBold.otf');
}

boldTextStyle({required fontSize,required color,height}) {
  return TextStyle(fontSize: fontSize, color: color,fontWeight: FontWeight.w700,fontFamily: 'PoppinsBold.otf');
}

appBarTextStyle({fontSize,required color}) {
  return TextStyle(fontSize: fontSize??dimen18, color: color,fontWeight: FontWeight.w500,fontFamily: 'PoppinsBold.otf');
}

// font size
var dimen6 = 6.0;
var dimen8 = 8.0;
var dimen9 = 9.0;
var dimen10 = 10.0;
var dimen11 = 11.0;
var dimen12 = 12.0;
var dimen13 = 13.0;
var dimen14 = 14.0;
var dimen15 = 15.0;
var dimen16 = 16.0;
var dimen17 = 17.0;
var dimen18 = 18.0;
var dimen19 = 19.0;
var dimen20 = 20.0;
var dimen21 = 21.0;
var dimen22 = 22.0;
var dimen23 = 23.0;
var dimen24 = 24.0;
var dimen25 = 25.0;
var dimen26 = 26.0;
var dimen27 = 27.0;
var dimen28 = 28.0;
var dimen29 = 29.0;

Color selectTextColor()  {
  var lightColor = ColorsTheme.colWhite;
  var darkColor = ColorsTheme.colBlack;


  Future.delayed(Duration.zero, () async {
    var isThemeLoaded = await ThemeService().loadThemeFromBox();
    return isThemeLoaded ? lightColor : darkColor;
  });
  return darkColor;


}
