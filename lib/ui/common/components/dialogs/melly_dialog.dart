import 'package:flutter/material.dart';

import '../../../../app/config/app_space_config.dart';
import '../../../../app/resources/colors.dart';
import '../../../../app/resources/font.dart';
import '../../../../app/resources/inset.dart';
import '../../../../app/resources/radius.dart';
import '../../helper/navigation_helper.dart';
import '../buttons/app_button.dart';

/* 2022.08.18 Created By Ximya
   새로운 Dialog UI
*/

class MellyDialog extends Dialog {
  const MellyDialog({
    Key? key,
    required this.title,
    required this.content,
    required this.hasTwoBtn,
    required this.rightBtnContent,
    required this.onRightBtnClicked,
    this.leftBtnContent,
    this.onLeftBtnClicked,
    this.imgPath,
    this.leftUniqBtnColor,
  }) : super(key: key);

  final String title;
  final String content;
  final bool hasTwoBtn; // 하단 버튼이 두개로 구성되 있는 위젯인지에 대한 여부.
  final String rightBtnContent;
  final String? leftBtnContent;
  final String? imgPath; // imagePath가 Null이면 이미지가 없는 다이어로그
  final VoidCallback onRightBtnClicked;
  final VoidCallback? onLeftBtnClicked;
  final Color? leftUniqBtnColor;

  @override
  Dialog build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(0),
      shape: const RoundedRectangleBorder(
        borderRadius: AppRadius.all24,
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        margin: AppInset.horizontal16,
        constraints: const BoxConstraints(minHeight: 196),
        decoration: const BoxDecoration(
          borderRadius: AppRadius.all24,
          color: AppColor.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding:
                      AppInset.top20 + AppInset.bottom8 + AppInset.horizontal24,
                  child: Text(
                    title,
                    textAlign: TextAlign.start,
                    style: AppTextStyle.headline2,
                  ),
                ),
                Padding(
                  padding: AppInset.vertical8 + AppInset.horizontal24,
                  child: Text(
                    content,
                    textAlign: TextAlign.start,
                    style: AppTextStyle.body2
                        .copyWith(color: AppColor.grey40, letterSpacing: -0.6),
                  ),
                ),
                // 이미지
                if (imgPath != null)
                  Padding(
                    padding: AppInset.vertical8 + AppInset.horizontal12,
                    child: Image.asset(
                      'assets/images/event_congratulate_img.png',
                      width: double.infinity,
                      fit: BoxFit.contain,
                    ),
                  ),
              ],
            ),
            Padding(
              padding: AppInset.horizontal20 + AppInset.vertical16,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (hasTwoBtn)
                    Expanded(
                      child: AppButton.roundGrey10(
                        textColor: leftUniqBtnColor ?? AppColor.greyScale70,
                        textStyle: AppTextStyle.title2,
                        onPressed: onLeftBtnClicked ??
                            NavigationHelper.instance.finish,
                        text: leftBtnContent == null ? '닫기' : leftBtnContent!,
                      ),
                    ),
                  AppSpace.size8,
                  Expanded(
                    flex: hasTwoBtn ? 1 : 0,
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 136),
                      child: AppButton.roundBlue30(
                        textStyle: AppTextStyle.title2,
                        onPressed: onRightBtnClicked,
                        text: rightBtnContent,
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

// Dialog(
// shape: const RoundedRectangleBorder(
// borderRadius: AppRadius.all24,
// ),
// elevation: 0,
// backgroundColor: Colors.transparent,
// child: Container(
// constraints: const BoxConstraints(minHeight: 198),
// decoration: const BoxDecoration(
// borderRadius: AppRadius.all24,
// color: AppColor.white,
// ),
// padding: AppInset.horizontal20 + AppInset.top20 + AppInset.bottom16,
// child: Column(
// mainAxisSize: MainAxisSize.min,
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: <Widget>[
// Padding(
// padding: AppInset.horizontal4 + AppInset.bottom16,
// child: Text(
// title,
// textAlign: TextAlign.start,
// style: AppTextStyle.headline2,
// ),
// ),
// Padding(
// padding: AppInset.horizontal4 + AppInset.bottom24,
// child: Text(
// content,
// textAlign: TextAlign.start,
// style: AppTextStyle.body2.copyWith(color: AppColor.grey40),
// ),
// ),
// // 이미지
// if (imgPath != null)
// Padding(
// padding: AppInset.bottom24 + AppInset.top8,
// child: Image.asset(
// 'assets/images/event_congratulate_img.png',
// width: double.infinity,
// fit: BoxFit.contain,
// ),
// ),
// ],
// ),
// Row(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// if (hasTwoBtn)
// Expanded(
// child: AppButton.roundGrey10(
// textStyle: AppTextStyle.title2.copyWith(
// color: leftUniqBtnColor ?? AppColor.greyScale70),
// onPressed: Get.back,
// text: leftBtnContent == null ? '닫기' : leftBtnContent!,
// ),
// ),
// AppSpace.size8,
// Expanded(
// flex: hasTwoBtn ? 1 : 0,
// child: ConstrainedBox(
// constraints: const BoxConstraints(maxWidth: 136),
// child: AppButton.roundBlue30(
// textStyle: AppTextStyle.title2,
// onPressed: onRightBtnClicked,
// text: rightBtnContent,
// ),
// ),
// ),
// ],
// )
// ],
// ),
// ),
// );
