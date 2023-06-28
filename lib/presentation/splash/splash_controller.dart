import 'package:get/get.dart';
import '../../infrastructure/navigation/routes.dart';
import '../../res.dart';

class SplashController extends GetxController{

  var image = Res.splashLogo;


  @override
  void onReady() {
    Future.delayed(const Duration(seconds: 2),(){
      Get.offNamed(Routes.manageSubscription);
     // Get.offNamed(Routes.baseScreen);
    });
    super.onReady();
  }

}