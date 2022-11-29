import 'package:flutter/material.dart';

/* 2021.11.04(목) 변경사항 by 우수몽
 *
 * 1. Figma 수정사항 반영 : blue200, blue50 삭제
 */

abstract class AppColor {
  AppColor._();

  /* snackbar 배경색. */
  static LinearGradient snackbarBackground = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      gray300.withOpacity(0.6),
      gray300.withOpacity(0.2),
    ],
  );

  static const Color bk = Color(0xFF333333);
  static const Color wh = Color(0xFFFFFFFF);

  static const Color blue300 = Color(0xFF026BFB);
  static const Color blue100 = Color(0xFFF2FAFF);

  static const Color red300 = Color(0xFFFF484E);
  static const Color red100 = Color(0xFFFFF5F5);

  static const Color gray600 = Color(0xFF818181);
  static const Color gray500 = Color(0xFF9D9FA3);
  static const Color gray400 = Color(0xFFB4B4B8);
  static const Color gray300 = Color(0xFFD9D9DB);
  static const Color gray200 = Color(0xFFEFEFEF);
  static const Color gray150 = Color(0xFFF6F6F6);
  static const Color gray100 = Color(0xFFFBFBFB);

  static const Color success = Color(0xFF026BFB);
  static const Color error = Color(0xFFFF484E);

  static const Color skeleton = gray200;

  // BaseDialog background Color
  static const Color dialogBackground = Color(0x99333333);

  /// 새로운 Design Guide
  /// 1. Brand Colors
  static const Color blue10 = Color(0xFFCDE2FF);
  static const Color blue30 = Color(0xFF026BFB);
  static const Color blue20 = Color(0xFF5297F6);

  /// 2. Sub Colors
  static const Color orange = Color(0xFFEB683F);
  static const Color red = Color(0xFFDF1D1D);
  static const Color red1 = Color(0xFFFF484E);
  static const Color blue = Color(0xFF0078D4);
  static const Color green = Color(0xFF34C759);
  static const Color pink = Color(0xFFFF628F);

  /// 3. Greyscale Colors
  static const Color white = Color(0xFFFFFFFF);
  static const Color grey10 = Color(0xFFE4E4E5);
  static const Color grey20 = Color(0xFFCCCCD0);
  static const Color grey30 = Color(0xFFABABB2);
  static const Color grey40 = Color(0xFF8B8B96);
  static const Color grey50 = Color(0xFF6F6F7B);
  static const Color grey60 = Color(0xFF50515F);
  static const Color grey70 = Color(0xFF41424D);
  static const Color grey80 = Color(0xFF33333C);
  static const Color greyScale80 = Color(0xFF2F3037);
  static const Color greyScale70 = Color(0xFF4A4D57);
  static const Color greyScale60 = Color(0xFF5C606B);
  static const Color greyScale50 = Color(0xFF767B89);
  static const Color greyScale40 = Color(0xFF969BAB);
  static const Color greyScale30 = Color(0xFFB6BAC7);
  static const Color greyScale10 = Color(0xFFDCDEE5);
  static const Color greyScaleBlack = Color(0xFF141414);
  static const Color black = Color(0xFF141414);

  /// 4. Background Colors
  static const Color blueGrey10 = Color(0xFFF7F7F7);
  static const Color blueGrey20 = Color(0xFFF2F4F8);

  /// 5. Other Colors
  static const Color toastBackground = Color(0xFFECEFF5);
  static const Color tooltipBackground = Color(0xFFD9D9D9);
}
