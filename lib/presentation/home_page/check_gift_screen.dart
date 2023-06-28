import 'package:bcpl_fun_club_project/presentation/home_page/manage_subscription_binding.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../infrastructure/core/base/base_view.dart';
import '../../infrastructure/theme/colors.theme.dart';
import '../../infrastructure/theme/text.theme.dart';

class CheckGiftScreen extends BaseView<ManageSubscriptionBinding> {
  CheckGiftScreen({Key? key}) : super(key: key);

  @override
  Widget body(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [ColorsTheme.colPrimary, ColorsTheme.col8B0000])),
        child: Stack(
          fit: StackFit.expand,
          children: [
            SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 10, top: 50, right: 10),
                    padding: const EdgeInsets.only(left: 10, top: 4, bottom: 4),
                    decoration: BoxDecoration(
                      color: ColorsTheme.colWhite,
                      border: Border.all(
                          color: ColorsTheme.colBlack.withOpacity(0.35),
                          width: 1),
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      //controller: controller.emailController,
                      //keyboardType: TextInputType.emailAddress,
                      children: [
                        Center(
                          child: Text(
                            "gift_details".tr,
                            style: const TextStyle(color: Colors.black54),
                          ),
                        ),
                        Divider(
                          color: ColorsTheme.colBlack,
                          thickness: 2,
                        ),
                        const SizedBox(
                          height: 200,
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.back();

                      //Get.offAndToNamed(Routes.dropdownScreen);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          ColorsTheme.colPrimary,
                          ColorsTheme.col8B0000
                        ]),
                        /*tileMode: TileMode.decal,*/

                        border: Border.all(color: Colors.white54, width: 1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.only(
                          left: 40, right: 40, top: 80, bottom: 20),
                      padding: const EdgeInsets.only(top: 11, bottom: 11),
                      child: Center(
                        child: Text(
                          'close'.tr,
                          style: regularTextStyle(
                              fontSize: dimen14, color: ColorsTheme.colWhite),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
