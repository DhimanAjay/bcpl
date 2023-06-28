// import 'dart:convert';
//
//
// import '../constants/app_constants.dart';
//
// class Utils{
//
//   setUser(UserModel user){
//     PrefManager.putString(AppConstants.user, jsonEncode(user.toJson()));
//   }
//
//   Future<UserModel?> getUser() async {
//     String? json = await PrefManager.getString(AppConstants.user);
//     if (json!.isNotEmpty) {
//       return UserModel.fromJson(jsonDecode(json));
//     } else {
//       return null;
//     }
//   }
//
//   formatedDate(String date) {
//     final timestamp = DateTime.parse(date);
//     final currentTime = DateTime.now();
//
//     final difference = currentTime.difference(timestamp);
//     final timeAgo = timeago.format(currentTime.subtract(difference));
//
//
//     return timeAgo;
//   }
// }