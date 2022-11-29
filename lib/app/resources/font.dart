import 'package:flutter/material.dart';

import 'colors.dart';

/* 2021.11.04(목) 변경사항 by 우수몽
 *
 * 1. Figma 수정사항 반영 : Title0_M1622 변경, Title5_R1012 추가, 삭제된 Style 제거 등등.
 * 2. letterSpacing 추가.
 */

abstract class AppTextStyle {
  AppTextStyle._();

  /* DISPLAY */
  static TextStyle display1M1828 = NotoSansTextStyle.medium(
    size: 18,
    fontWeight: FontWeight.w700,
    height: 28,
  );

  static TextStyle display2R2032 = NotoSansTextStyle.regular(
    size: 20,
    fontWeight: FontWeight.w700,
    height: 32,
    letterSpacing: -1,
  );

  static TextStyle display3M1824 = NotoSansTextStyle.medium(
    size: 18,
    fontWeight: FontWeight.w700,
    height: 24,
    letterSpacing: -0.5,
  );

  static TextStyle display4M2224 = NotoSansTextStyle.medium(
    size: 22,
    fontWeight: FontWeight.w700,
    height: 24,
  );

  /* TITLE */

  static TextStyle title0M1622 = NotoSansTextStyle.medium(
    size: 16,
    fontWeight: FontWeight.w400,
    height: 22,
  );

  static TextStyle title1R1618 = NotoSansTextStyle.regular(
    size: 16,
    fontWeight: FontWeight.w400,
    height: 18,
  );

  static TextStyle title2M1418 = NotoSansTextStyle.medium(
    size: 14,
    fontWeight: FontWeight.w400,
    height: 18,
  );

  static TextStyle title3R1418 = NotoSansTextStyle.regular(
    size: 14,
    fontWeight: FontWeight.w400,
    height: 18,
  );

  static TextStyle title4R1216 = NotoSansTextStyle.regular(
    size: 12,
    fontWeight: FontWeight.w400,
    height: 16,
  );

  static TextStyle title5R1012 = NotoSansTextStyle.regular(
    size: 10,
    fontWeight: FontWeight.w400,
    height: 12,
  );

  /* BODY */

  static TextStyle body1R1626 = NotoSansTextStyle.regular(
    size: 16,
    fontWeight: FontWeight.w400,
    height: 26,
  );

  static TextStyle body2R1424 = NotoSansTextStyle.regular(
    size: 14,
    fontWeight: FontWeight.w400,
    height: 24,
  );

  static TextStyle body3R1220 = NotoSansTextStyle.regular(
    size: 12,
    fontWeight: FontWeight.w400,
    height: 20,
  );

  /* BUTTON */

  static TextStyle button1B1618 = NotoSansTextStyle.bold(
    size: 16,
    fontWeight: FontWeight.w400,
    height: 18,
  );

  static TextStyle button2M1618 = NotoSansTextStyle.medium(
    size: 16,
    fontWeight: FontWeight.w400,
    height: 18,
  );

  static TextStyle button3M1416 = NotoSansTextStyle.medium(
    size: 14,
    fontWeight: FontWeight.w400,
    height: 16,
  );

  static TextStyle button4R1214 = NotoSansTextStyle.regular(
    size: 12,
    fontWeight: FontWeight.w400,
    height: 14,
  );

  /* CAPTION */

  static TextStyle captionR1218 = NotoSansTextStyle.regular(
    size: 12,
    fontWeight: FontWeight.w400,
    height: 18,
  );

  /// 새로운 Design Guide

  static TextStyle web1 = PretendardTextStyle.bold(
    size: 40,
    height: 52,
  );

  static TextStyle web2 = PretendardTextStyle.bold(
    size: 36,
    height: 46,
  );

  static TextStyle web3 = PretendardTextStyle.bold(
    size: 32,
    height: 48,
  );

  static TextStyle headline3 = PretendardTextStyle.semiBold(
    size: 18,
    height: 22,
  );

  static TextStyle headline2 = PretendardTextStyle.bold(
    size: 20,
    height: 30,
  );

  static TextStyle headline1 = PretendardTextStyle.bold(
    size: 24,
    height: 37,
    letterSpacing: -0.1,
  );

  static TextStyle title3 = PretendardTextStyle.bold(
    size: 14,
    height: 20,
  );
  static TextStyle title3Bold = PretendardTextStyle.bold(
    size: 14,
    height: 20,
  );

  static TextStyle title2 = PretendardTextStyle.semiBold(
    size: 16,
    height: 20,
  );

  static TextStyle title1 =
      PretendardTextStyle.bold(size: 16, height: 22, letterSpacing: -0.1);

  static TextStyle body3 = PretendardTextStyle.medium(
    size: 13,
    height: 16,
  );

  static TextStyle body2 = PretendardTextStyle.medium(
    size: 14,
    height: 22,
  );

  static TextStyle body1 = PretendardTextStyle.semiBold(
    size: 14,
    height: 22,
  );

  static TextStyle alert1 = PretendardTextStyle.semiBold(
    size: 12,
    height: 18,
  );

  static TextStyle alert2 = PretendardTextStyle.regular(
    size: 12,
    height: 18,
  );

  /// 2022.10.28 by Max
  /// 차트 라벨
  static TextStyle lineChartLabel = PretendardTextStyle.regular(
    size: 10,
    height: 18,
  );
}

@immutable
class NotoSansTextStyle extends TextStyle {
  static const notoSansRegular = 'noto_sans_regular';
  static const notoSansMedium = 'noto_sans_medium';
  static const notoSansBold = 'noto_sans_bold';

  const NotoSansTextStyle(
    String fontFamily,
    Color color,
    double size,
    FontWeight fontWeight,
    double height,
    double? letterSpacing,
  ) : super(
          fontFamily: fontFamily,
          color: color,
          fontSize: size,
          fontWeight: fontWeight,
          height: height / size,
          letterSpacing: letterSpacing,
        );

  factory NotoSansTextStyle.regular({
    required double size,
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.normal,
    double height = 1.0,
    double? letterSpacing,
  }) =>
      NotoSansTextStyle(
          notoSansRegular, color, size, fontWeight, height, letterSpacing);

  factory NotoSansTextStyle.medium({
    required double size,
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.normal,
    double height = 1.0,
    double? letterSpacing,
  }) =>
      NotoSansTextStyle(
          notoSansMedium, color, size, fontWeight, height, letterSpacing);

  factory NotoSansTextStyle.bold({
    required double size,
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.normal,
    double height = 1.0,
    double? letterSpacing,
  }) =>
      NotoSansTextStyle(
          notoSansBold, color, size, fontWeight, height, letterSpacing);
}

/// 새로운 Design Guide
@immutable
class PretendardTextStyle extends TextStyle {
  static const pretendardBold = 'pretendard_bold';
  static const pretendardRegular = 'pretendard_regular';
  static const pretendardSemiBold = 'pretendard_semiBold';
  static const pretendardMedium = 'pretendard_medium';

  const PretendardTextStyle(
    String fontFamily,
    Color color,
    double size,
    FontWeight fontWeight,
    double height,
    double? letterSpacing,
  ) : super(
            fontFamily: fontFamily,
            color: color,
            fontSize: size,
            fontWeight: fontWeight,
            height: height / size,
            letterSpacing: letterSpacing,
            leadingDistribution: TextLeadingDistribution.even);

  factory PretendardTextStyle.regular({
    required double size,
    Color color = AppColor.black,
    FontWeight fontWeight = FontWeight.normal,
    double height = 1.0,
    double? letterSpacing,
  }) =>
      PretendardTextStyle(
          pretendardRegular, color, size, fontWeight, height, letterSpacing);

  factory PretendardTextStyle.semiBold({
    required double size,
    Color color = AppColor.black,
    FontWeight fontWeight = FontWeight.normal,
    double height = 1.0,
    double? letterSpacing,
  }) =>
      PretendardTextStyle(
          pretendardSemiBold, color, size, fontWeight, height, letterSpacing);

  factory PretendardTextStyle.medium({
    required double size,
    Color color = AppColor.black,
    FontWeight fontWeight = FontWeight.normal,
    double height = 1.0,
    double? letterSpacing,
  }) =>
      PretendardTextStyle(
          pretendardMedium, color, size, fontWeight, height, letterSpacing);

  factory PretendardTextStyle.bold({
    required double size,
    Color color = AppColor.black,
    FontWeight fontWeight = FontWeight.normal,
    double height = 1.0,
    double? letterSpacing,
  }) =>
      PretendardTextStyle(
          pretendardBold, color, size, fontWeight, height, letterSpacing);
}
