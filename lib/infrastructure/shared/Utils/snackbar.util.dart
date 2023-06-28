import 'package:flutter/material.dart';
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../theme/colors.theme.dart';


class SnackBarUtil {
  static void showSuccess({required String message,Color? color}) {
    Get.rawSnackbar(
      title: 'Success',
      message: message,
      backgroundColor:color??Colors.green.shade600,
    );
  }

  static void showWarning({required String message}) {
    Get.rawSnackbar(
      title: 'Warning',
      message: message,
      backgroundColor: Colors.orange.shade900,
    );
  }

  static void showError({required String message}) {
    Get.rawSnackbar(
      title: 'Error',
      message: message,
      backgroundColor: Colors.redAccent.shade700,
    );
  }

  static void showWorkingDevelopmentMessage({required String message}) {
    Get.rawSnackbar(
      title: 'Message',
      message: message,
      backgroundColor: ColorsTheme.colPrimary,
    );
  }

  // showToast(msg, color){
  //   Fluttertoast.showToast(
  //       msg: msg,
  //       toastLength: Toast.LENGTH_LONG,
  //       gravity: ToastGravity.BOTTOM,
  //       backgroundColor: color,
  //       textColor: Colors.white,
  //       timeInSecForIosWeb: 2,
  //       fontSize: 16.0
  //   );
  // }

}
