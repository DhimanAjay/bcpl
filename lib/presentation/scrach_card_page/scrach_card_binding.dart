
import 'package:bcpl_fun_club_project/presentation/scrach_card_page/scrach_card_controller.dart';
import 'package:get/get.dart';

class ScratchCardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScratchCardController>(() => ScratchCardController());
  }
}
