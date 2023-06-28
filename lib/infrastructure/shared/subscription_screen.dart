
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/colors.theme.dart';
import '../theme/text.theme.dart';


class SubScriptionScreen extends StatelessWidget{
  const SubScriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return showDataAlert(context);
  }
  showDataAlert(context) {
    showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        backgroundColor: ColorsTheme.colBackground,
        title: Wrap(
          alignment: WrapAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Text(
                    "thanks".tr,
                    style: mediumTextStyle(
                      fontSize: dimen16,
                      color: ColorsTheme.colBlack,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 15),
                  padding: const EdgeInsets.only(left: 34, right: 34),
                  child: Text(
                    "we_will_review_report".tr,
                    style: regularTextStyle(
                        fontSize: dimen12,
                        color: ColorsTheme.colBlack,
                        height: 2.0),
                    textAlign: TextAlign.center,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.back();
                    Get.back();
                  },
                  child: Container(
                      margin: const EdgeInsets.only(
                          bottom: 30, left: 35, right: 35, top: 30),
                      decoration: BoxDecoration(
                        color: ColorsTheme.colPrimary,
                        border: Border.all(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 19, bottom: 18),
                        child: Center(
                          child: Text('got_it'.tr,
                              style: regularTextStyle(
                                  fontSize: dimen13,
                                  color: ColorsTheme.colWhite)),
                        ),
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}