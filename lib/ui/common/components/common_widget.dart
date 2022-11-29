import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../app/config/app_space_config.dart';
import '../../../app/resources/colors.dart';
import '../../../app/resources/font.dart';
import '../../../app/resources/inset.dart';
import '../../../app/resources/radius.dart';

/* 2021.11.03(수)~04(목) 변경사항 by 우수몽
 *
 * 1. Snackbar 추가
 * 2. lint 적용 - warning 제거
 * 3. AppSpace, AppRadius 적용
 * 4. rowWidth, rowHeight 제거
 */

class CommonWidget {
  static AppBar appBar(
    BuildContext context, {
    String title = '',
    String? backIcon,
    String? funcIcon,
    Color? backIconColor,
    void Function()? backEvent,
    void Function()? funcEvent,
  }) {
    return AppBar(
      leading: GestureDetector(
        onTap: () {
          if (backEvent != null) {
            backEvent();
          } else {
            Navigator.pop(context);
          }
        },
        child: Container(
          width: 56.0,
          height: 56.0,
          padding: AppInset.all16,
          child: backIcon == null
              ? SvgPicture.asset(
                  'assets/icons/backarrow.svg',
                  width: 24,
                  height: 24,
                  color: backIconColor,
                )
              : SvgPicture.asset(
                  'assets/icons/$backIcon.svg',
                  width: 24,
                  height: 24,
                ),
        ),
      ),
      centerTitle: true,
      title: Text(
        title,
        style: AppTextStyle.title1R1618,
      ),
      actions: funcIcon == null
          ? null
          : [
              GestureDetector(
                onTap: () {
                  if (funcEvent != null) {
                    funcEvent();
                  } else {
                    Navigator.pop(context);
                  }
                },
                child: Container(
                  width: 56.0,
                  height: 56.0,
                  padding: AppInset.all16,
                  child: SvgPicture.asset('assets/icons/$funcIcon.svg',
                      width: 24, height: 24),
                ),
              ),
            ],
      backgroundColor: Colors.transparent,
      elevation: 0.0,
    );
  }

  static void toast(String error) async {
    showToastWidget(
      Container(
        key: const Key('toast'),
        decoration: const BoxDecoration(
          borderRadius: AppRadius.all20,
          color: AppColor.bk,
        ),
        margin: AppInset.bottom24 + AppInset.horizontal16,
        padding: AppInset.vertical12 + AppInset.horizontal20,
        child: Text(
          error,
          style: AppTextStyle.title1R1618.copyWith(color: AppColor.wh),
        ),
      ),
      context: Get.context,
      animDuration: Duration.zero,
    );
  }

  /** 2022.07.11(월) made by Max(우수몽)
   *  광고수익금을 포함한 여러 부분에서 쓰이는 새로운 형태의 토스트 메세지.
   */
  static Future<void> iconToast(
      {required String message, required String icon}) async {
    Get.showSnackbar(
      GetSnackBar(
        backgroundColor: AppColor.white,
        borderRadius: 16,
        margin: AppInset.horizontal20,
        padding: AppInset.vertical16 + AppInset.horizontal20,
        boxShadows: const [
          BoxShadow(
            spreadRadius: 18,
            color: Color.fromRGBO(185, 192, 203, 0.07),
            blurRadius: 177,
            offset: Offset(0, 5),
          ),
          BoxShadow(
            spreadRadius: 17,
            color: Color.fromRGBO(185, 192, 203, 0.17),
            blurRadius: 66,
            offset: Offset(0, 5.86),
          ),
        ],
        messageText: Row(
          children: [
            SvgPicture.asset(icon, width: 24, height: 24),
            AppSpace.size8,
            Text(
              message,
              style: AppTextStyle.body1.copyWith(color: AppColor.grey70),
            )
          ],
        ),
        duration: const Duration(milliseconds: 1500),
      ),
    );
  }

  /* Snackbar 추가 (GetX에서 제공하는 것을 사용함) */
  static void snackBar(String message,
      {String? buttonTitle, VoidCallback? onPressed}) {
    if (buttonTitle != null && onPressed != null) {
      Get.showSnackbar(
        GetBar(
          backgroundGradient: AppColor.snackbarBackground,
          barBlur: 7,
          borderRadius: 12,
          margin: AppInset.all8,
          padding: AppInset.vertical6 + AppInset.left16 + AppInset.right8,
          messageText: Text(
            message,
            style: AppTextStyle.body2R1424,
            textAlign: TextAlign.start,
          ),
          mainButton: TextButton(
            onPressed: onPressed,
            child: Container(
              padding: AppInset.all8,
              child: Text(
                buttonTitle,
                style:
                    AppTextStyle.title2M1418.copyWith(color: AppColor.blue300),
              ),
            ),
          ),
          duration: const Duration(seconds: 3),
          snackPosition: SnackPosition.TOP,
        ),
      );
    } else {
      Get.showSnackbar(
        GetBar(
          backgroundGradient: AppColor.snackbarBackground,
          barBlur: 7,
          borderRadius: 12,
          margin: AppInset.all8,
          padding: AppInset.vertical6 + AppInset.left16 + AppInset.right8,
          messageText: Text(
            message,
            style: AppTextStyle.body2R1424,
            textAlign: TextAlign.start,
          ),
          duration: const Duration(seconds: 3),
          snackPosition: SnackPosition.TOP,
        ),
      );
    }
  }
}
