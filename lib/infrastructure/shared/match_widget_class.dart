
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../res.dart';
import '../core/base/base_view.dart';
import '../theme/app_bar.theme.dart';
import '../theme/background.theme.dart';
import '../theme/colors.theme.dart';
import '../theme/text.theme.dart';


class MatchWidgetClass extends BaseView {
  MatchWidgetClass({super.key});

  @override
  Brightness statusBarIconBrightness() => Brightness.dark;

  @override
  Brightness statusBarBrightness() => Brightness.dark;

  @override
  Widget body(BuildContext context) {
    return AppBackGround(
      child: Container(
        height: Get.size.height,
        margin: const EdgeInsets.symmetric(vertical: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              appBarIconTitle(
                margin: const EdgeInsets.only(right: 10, left: 10, bottom: 10),
                onTapFunction: () {
                  Get.back();
                },
              ),
              Stack(
               children: [
                 SizedBox(
                  // color: Colors.green,
                   width: Get.width,
                   child: Center(
                     child: Stack(
                       children: [
                         RotationTransition(
                           turns: const AlwaysStoppedAnimation(10 / 360),
                           child: Container(
                             width: 150,
                             height: 200,
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(8.0),
                               color: Colors.red,
                             ),
                             margin: EdgeInsets.only(
                                 left: Get.size.width * .3,
                                 bottom: Get.size.height *0.15,
                                 top: Get.size.height *0.03),
                             child: ClipRRect(
                               borderRadius: BorderRadius.circular(8.0),
                               child: Image.asset(
                                 Res.intro_4,
                                 fit: BoxFit.cover,
                               ),
                             ),
                           ),
                         ),
                         Positioned(
                           left: 0,
                           top: Get.size.height * 0.1,
                           child: RotationTransition(
                             turns: const AlwaysStoppedAnimation(-10 / 360),
                             child: Container(
                               decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(8.0),
                                 color: Colors.red,
                               ),
                               width: 150,
                               height: 200,
                               child: ClipRRect(
                                 borderRadius: BorderRadius.circular(8.0),
                                 child: Image.asset(
                                   Res.intro1,
                                   fit: BoxFit.cover,
                                 ),
                               ),
                             ),
                           ),),
                       ],
                     ),
                   ),
                 ),
                 Positioned(
                     bottom: 20,
                     left: 40,
                     child: Image.asset(Res.redHeartWithWhiteBackground,height: 62,width: 62,)),
                 Positioned(
                     top: 0,
                     right: 135,
                     child: Image.asset(Res.redHeartWithWhiteBackground,height: 62,width: 62,)),
               ],
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Text(
                    "It's a Match!!!".tr,
                    style: semiBoldTextStyle(
                      fontSize: dimen29,
                      color: ColorsTheme.colPrimary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
                  child: Text(
                    "Don't waste more time. just start a conversation with each other."
                        .tr,
                    style: regularTextStyle(
                      fontSize: dimen14,
                      color: ColorsTheme.col828693,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              GestureDetector(
                  onTap: () {
                    Get.back(result: "result");
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: ColorsTheme.colPrimary,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    height: 60,
                    width: Get.width,
                    margin: const EdgeInsets.only(left: 15, right: 15, top: 30),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Starting Dating Now",
                            style: mediumTextStyle(
                                fontSize: dimen14, color: ColorsTheme.colWhite),
                          ),
                        ),
                        Image.asset(
                          Res.rightRedIcon,
                          height: 50,
                          width: 30,
                        )
                      ],
                    ),
                  )),
              Center(
                child: GestureDetector(
                  onTap: (){

                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 30),
                    child: Text(
                      "I'll do it later",
                      style: mediumTextStyle(
                          fontSize: dimen14, color: ColorsTheme.col8e8e93),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
