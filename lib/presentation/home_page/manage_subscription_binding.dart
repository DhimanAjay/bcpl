import 'package:get/get.dart';

import 'manage_subscription_controller.dart';

class ManageSubscriptionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ManageSubscriptionController>(
        () => ManageSubscriptionController());
  }
}
