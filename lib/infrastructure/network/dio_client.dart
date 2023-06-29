import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get_utils/get_utils.dart';

import '../model/all_gift_model.dart';
import '../model/all_winner_name.dart';
import '../model/gift_detail_model.dart';
import '../model/gift_status_model.dart';
import '../model/otp_model.dart';
import '../shared/Utils/snackbar.util.dart';
import '../shared/custom_http_exception.dart';
import '../shared/dio_logger.dart';
import 'api_constants.dart';

class DioClient {
  Dio _dio = Dio();
  DioError? _dioError;
  var apiEndPoints = ApiConstants();
  var tag = 'ApiProvider';
  int count = 0;

  //without multipart
  DioClient.base({remoteBaseUrl, apiToken, language}) {
    var baseUrl = remoteBaseUrl ?? apiEndPoints.baseUrl;
    BaseOptions dioOptions = BaseOptions(
        connectTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60),
        receiveDataWhenStatusError: true,
        followRedirects: false,

        baseUrl: baseUrl);
    _dio = Dio(dioOptions);
    _dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options, handler) {
      if (apiToken != null && apiToken.toString().isNotEmpty) {
        options.headers = {
          'Authorization': 'Bearer $apiToken',
          'content-type': 'application/json',
          'language': language
        };
      } else {
        options.headers = {
          'content-type': 'application/json',
          'language': language
        };
      }
      DioLogger.onSend(tag, options);
      return handler.next(options);
    }, onResponse: (Response response, handler) {
      DioLogger.onSuccess(tag, response);
      return handler.next(response);
    }, onError: (DioError error, handler) async {
      _dioError = error;
      return handler.next(error);
    }));
  }

  //with multipart
  DioClient.fBase({remoteBaseUrl, apiToken, language}) {
    var baseUrl = remoteBaseUrl ?? apiEndPoints.baseUrl;
    BaseOptions dioOptions = BaseOptions(
        connectTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60),
        receiveDataWhenStatusError: true,
        followRedirects: false,
        baseUrl: baseUrl);
    _dio = Dio(dioOptions);
    _dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options, handler) {
      DioLogger.onSend(tag, options);
      if (apiToken != null && apiToken != '') {
        options.headers = {
          'Authorization': 'Bearer $apiToken',
          'content-type': 'multipart/form-data',
          'language': language
        };
      } else {
        options.headers = {
          'content-type': 'multipart/form-data',
          'language': language
        };
      }
      DioLogger.onSend(tag, options);
      return handler.next(options);
    }, onResponse: (Response response, handler) {
      DioLogger.onSuccess(tag, response);
      return handler.next(response);
    }, onError: (DioError error, handler) async {
      _dioError = error;
      if (_checkSocketException(error)) {
        SnackBarUtil.showError(message: 'no_internet_connection'.tr);
      }
      return handler.next(error);
    }));
  }

  DioClient.mapBase() {
    // var baseUrl = 'https://maps.googleapis.com/maps/api/geocode/';
    var baseUrl = 'https://maps.googleapis.com/maps/api/';
    BaseOptions dioOptions = BaseOptions(
        connectTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60),
        receiveDataWhenStatusError: true,
        followRedirects: false,
        baseUrl: baseUrl);
    _dio = Dio(dioOptions);
    _dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options, handler) {
      DioLogger.onSend(tag, options);
      options.headers = {'Content-Type': 'application/json'};
      return handler.next(options);
    }, onResponse: (Response response, handler) {
      DioLogger.onSuccess(tag, response);
      return handler.next(response);
    }, onError: (DioError error, handler) async {
      _dioError = error;
      return handler.next(error);
    }));
  }

  catchErrorHandler() {
    print("Catch Error Handler >>>>>>>>>>>>>>");
    print(_dioError!.response!.statusCode);
    print(_dioError!.response!.statusMessage);
    print(_dioError!.response!.data);

    if (_dioError!.response!.statusCode == 500) {
      throwIfNoSuccess(
          'Something went wrong', _dioError!.response!.statusCode, _dioError!);
    } else if (_dioError!.response!.statusCode == 400) {
      throwIfNoSuccess(/*_dioError!.response!.data["message"],*/ "",_dioError!.response!.statusCode, _dioError!);
    } else {
      throwIfNoSuccess("",
          // _dioError!.response!.data == null
          //     ? _dioError!.response!.statusMessage
          //     : _dioError!.response!.data['message'],
          _dioError!.response!.statusCode,
          _dioError!);
    }
  }

  void throwIfNoSuccess(String response, int? code, DioError exception) {
    throw CustomHttpException(response, code, exception);
  }

  bool _checkSocketException(DioError err) {
    return err.type == DioErrorType.unknown && err.error is SocketException;
  }

  Future getAllGift() async {
    try {
      Response response = await _dio.get(apiEndPoints.allGift);
      print(response.data.runtimeType);
      return AllGift.fromJson(json.decode(response.data));
    } catch (error, stacktrace) {
      catchErrorHandler();
    }
  }

  Future getAllWinner() async {
    try {
      Response response = await _dio.get(apiEndPoints.allWinner);
      print(response.data.runtimeType);
      return AllWinerName.fromJson(json.decode(response.data));
    } catch (error, stacktrace) {
      catchErrorHandler();
    }
  }

Future sendOtp(Map<String, dynamic> otpData) async {
  try {
    FormData formData = FormData.fromMap(otpData);
    Response response = await _dio.post(apiEndPoints.sendOtp, data: formData);
    return SendOtpModel.fromJson(json.decode(response.data));
  } catch (error, stacktrace) {
    catchErrorHandler();
  }
  return null;
}

Future verifyOtp(Map<String, dynamic> otpData) async {
  try {
    FormData formData = FormData.fromMap(otpData);
    Response response = await _dio.post(apiEndPoints.verifyOtp, data: formData);
    return SendOtpModel.fromJson(json.decode(response.data));
  } catch (error, stacktrace) {
    catchErrorHandler();
  }
  return null;
}

Future verifyImei(Map<String, dynamic> otpData) async {
  try {
    FormData formData = FormData.fromMap(otpData);
    Response response = await _dio.post(apiEndPoints.verifyImei, data: formData);
    return SendOtpModel.fromJson(json.decode(response.data));
  } catch (error, stacktrace) {
    catchErrorHandler();
  }
  return null;
}

Future saveData(Map<String, dynamic> otpData) async {
  try {
    FormData formData = FormData.fromMap(otpData);
    Response response = await _dio.post(apiEndPoints.saveData, data: formData);
    return SendOtpModel.fromJson(json.decode(response.data));
  } catch (error, stacktrace) {
    catchErrorHandler();
  }
  return null;
}

Future giftStatus(/*Map<String, dynamic>*/ otpData) async {
  try {
    FormData formData = FormData();
      formData.fields.add(MapEntry("number", otpData));

    _dio.options.headers['Content-Type'] = 'application/x-www-form-urlencoded';
    Response response = await _dio.post(apiEndPoints.giftStatusModel,  data: formData);
    return GiftStatusModel.fromJson(json.decode(response.data));
  } catch (error, stacktrace) {
    catchErrorHandler();
  }
  return null;
}

Future giftDetail(Map<String, dynamic> otpData) async {
  try {
    FormData formData = FormData.fromMap(otpData);
    Response response = await _dio.post(apiEndPoints.getGiftDetail, data: formData);
    return GiftDetailsModel.fromJson(json.decode(response.data));
  } catch (error, stacktrace) {
    catchErrorHandler();
  }
  return null;
}

Future giftMessage(Map<String, dynamic> otpData) async {
  try {
    FormData formData = FormData.fromMap(otpData);
    Response response = await _dio.post(apiEndPoints.giftMessage, data: formData);
    return GiftDetailsModel.fromJson(json.decode(response.data));
  } catch (error, stacktrace) {
    catchErrorHandler();
  }
  return null;
}

}
