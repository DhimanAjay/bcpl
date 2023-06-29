import 'dart:io';

import 'package:bcpl_fun_club_project/res.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';

import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:image_picker/image_picker.dart';

import '../../infrastructure/core/widget/progress_dialog.dart';
import '../../infrastructure/model/otp_model.dart';
import '../../infrastructure/navigation/routes.dart';
import '../../infrastructure/network/dio_client.dart';
import '../../infrastructure/shared/Utils/snackbar.util.dart';
import '../../infrastructure/shared/app_exception_handle.dart';
import '../../infrastructure/shared/custom_http_exception.dart';

class DetailsController extends GetxController {
  var scannedNumber = ''.obs;
  late bool mounted;
  final numberController = TextEditingController();
  final nameController = TextEditingController();
  final imeiController = TextEditingController();
  final otpController = TextEditingController();
  final addressController = TextEditingController();
  final pinController = TextEditingController();
  final modelController = TextEditingController();
  final oldbrandController = TextEditingController();

  ProgressDialog progressDialog = ProgressDialog();
  var userPhoto = ''.obs;
  var userPhoto2 = ''.obs;
  var fileName1 = ''.obs;
  var fileName2 = ''.obs;

  @override
  void onInit() {
    // scanBarCode();
    super.onInit();
  }
  //  scanBarCode() async {
  //   String barcodeScanResult = await FlutterBarcodeScanner.scanBarcode(
  //       '#000000', Res.cancel, true, ScanMode.BARCODE);
  //   if (!mounted) return;
  //   scannedNumber.value = barcodeScanResult;
  // }
  sendOtp() async {
    try {
      progressDialog.show();
      Map<String, dynamic> mapData = {};
      mapData['name'] = nameController.text;
      mapData['number'] = numberController.text.trim();
      mapData['imeiNo'] = imeiController.text.trim();
      print("allgiftfetchsuccess $mapData ${nameController.text}");

      SendOtpModel sendOtp = await DioClient.base().sendOtp(mapData);
      if (sendOtp.status!) {
        progressDialog.dismiss();

        print("allgiftfetchsuccess ");
      } else {
        progressDialog.dismiss();
        print("allgiftfail");
        SnackBarUtil.showError(message: sendOtp.message.toString());
      }
    } on CustomHttpException catch (exception, code) {
      progressDialog.dismiss();

      AppExceptionHandle().showException(
          exception.code, exception.response, exception.exception,
          type: exception.code);
    } catch (e) {
      progressDialog.dismiss();

      print("api_exception_allGift");
      print(e);
    }
  }

  verifyOtp() async {
    try {
      progressDialog.show();
      Map<String, dynamic> mapData = {};
      mapData['name'] = nameController.text;
      mapData['number'] = numberController.text.trim();
      mapData['otp'] = otpController.text.trim();
      print("allgiftfetchsuccess $mapData ${nameController.text}");

      SendOtpModel sendOtp = await DioClient.base().verifyOtp(mapData);
      if (sendOtp.status!) {
        progressDialog.dismiss();

        print("allgiftfetchsuccess ");
      } else {
        progressDialog.dismiss();
        print("allgiftfail");
        SnackBarUtil.showError(message: sendOtp.message.toString());
      }
    } on CustomHttpException catch (exception, code) {
      progressDialog.dismiss();

      AppExceptionHandle().showException(
          exception.code, exception.response, exception.exception,
          type: exception.code);
    } catch (e) {
      progressDialog.dismiss();

      print("api_exception_allGift");
      print(e);
    }
  }

  verifyImei() async {
    try {
      progressDialog.show();
      Map<String, dynamic> mapData = {};
      mapData['imeiNo'] = imeiController.text;

      SendOtpModel sendOtp = await DioClient.base().verifyImei(mapData);
      if (sendOtp.status!) {
        progressDialog.dismiss();
        SnackBarUtil.showSuccess(message: sendOtp.message.toString());

        print("allgiftfetchsuccess ");
      } else {
        progressDialog.dismiss();
        print("allgiftfail");
        SnackBarUtil.showError(message: sendOtp.message.toString());
      }
    } on CustomHttpException catch (exception, code) {
      progressDialog.dismiss();

      AppExceptionHandle().showException(
          exception.code, exception.response, exception.exception,
          type: exception.code);
    } catch (e) {
      progressDialog.dismiss();

      print("api_exception_allGift");
      print(e);
    }
  }

  saveDataToDb() async {
    try {
      progressDialog.show();
      Map<String, dynamic> mapData = {};
      mapData['name'] = nameController.text;
      mapData['number'] = numberController.text.trim();
      mapData['imeiNo'] = imeiController.text.trim();
      print(mapData);
      SendOtpModel sendOtp = await DioClient.base().saveData(mapData);
      if (sendOtp.status!) {
        progressDialog.dismiss();
        Get.toNamed(Routes.scratchCard, arguments: [
          nameController.text,
          imeiController.text,
          numberController.text,
        ]);
        SnackBarUtil.showSuccess(message: sendOtp.message.toString());

        print("allgiftfetchsuccess ");
      } else {
        progressDialog.dismiss();
        print("allgiftfail");
        SnackBarUtil.showError(message: sendOtp.message.toString());
      }
    } on CustomHttpException catch (exception, code) {
      progressDialog.dismiss();

      AppExceptionHandle().showException(
          exception.code, exception.response, exception.exception,
          type: exception.code);
    } catch (e) {
      progressDialog.dismiss();

      print("api_exception_allGift");
      print(e);
    }
  }

   getImage(ImageSource imageSource, context, imgType) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    var date = DateTime.now();
    String imgPath = date.millisecondsSinceEpoch.toString();
    if (pickedFile != null) {
      // Compress
      final dir = Directory.systemTemp;
      final targetPath = "${dir.absolute.path}/$imgPath.jpg";
      var compressedFile = await FlutterImageCompress.compressAndGetFile(pickedFile.path, targetPath, quality: 90);
      if(imgType == "customImage"){
        fileName1.value = pickedFile.name;
        userPhoto.value = compressedFile!.path;
      }
      else{
        fileName2.value = pickedFile.name;
        userPhoto2.value = compressedFile!.path;
      }


    }
  }

}
