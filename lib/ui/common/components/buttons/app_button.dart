import 'package:flutter/material.dart';

import '../../../../app/resources/colors.dart';
import '../../../../app/resources/font.dart';
import '../../../../app/resources/radius.dart';
import '../../widgets/buttons/common_outline_button.dart';
import '../../widgets/buttons/common_round_button.dart';
import '../../widgets/buttons/common_text_button.dart';

abstract class AppButton {
  AppButton._();

  /* 새 버튼 디자인 */
  static Widget roundBlue30({
    Key? key,
    required VoidCallback onPressed,
    required String text,
    TextStyle? textStyle,
    double height = 48.0,
    double width = double.infinity,
    bool enabled = true,
    VoidCallback? onPressedDisabled,
    BorderRadius? borderRadius,
  }) =>
      _buildRoundButton(
        key: key,
        onPressed: onPressed,
        onPressedDisabled: onPressedDisabled,
        text: text,
        textStyle: textStyle ?? AppTextStyle.body3,
        color: AppColor.blue30,
        textColor: AppColor.white,
        height: height,
        width: width,
        enabled: enabled,
        disabledColor: AppColor.blue10,
        disabledTextColor: AppColor.white,
        borderRadius: borderRadius ?? AppRadius.all16,
      );

  static Widget roundGrey10({
    Key? key,
    required VoidCallback onPressed,
    required String text,
    TextStyle? textStyle,
    double height = 48.0,
    double width = double.infinity,
    bool enabled = true,
    Color? textColor,
    BorderRadius? borderRadius,
  }) =>
      _buildRoundButton(
        key: key,
        onPressed: onPressed,
        text: text,
        textStyle: textStyle ??
            PretendardTextStyle.medium(
              size: 16,
              height: 24,
            ),
        color: AppColor.grey10,
        textColor: textColor ?? AppColor.grey70,
        height: height,
        width: width,
        enabled: enabled,
        borderRadius: borderRadius ?? AppRadius.all16,
      );

  static Widget roundBlueGrey10({
    Key? key,
    required VoidCallback onPressed,
    required String text,
    TextStyle? textStyle,
    double height = 48.0,
    double width = double.infinity,
    bool enabled = true,
    Color? textColor,
    BorderRadius? borderRadius,
  }) =>
      _buildRoundButton(
        key: key,
        onPressed: onPressed,
        text: text,
        textStyle: textStyle ?? AppTextStyle.title2,
        color: AppColor.blueGrey10,
        textColor: textColor ?? AppColor.blue20,
        height: height,
        width: width,
        enabled: enabled,
        borderRadius: borderRadius ?? AppRadius.all12,
      );

  static Widget newRound({
    Key? key,
    required VoidCallback onPressed,
    required String text,
    TextStyle? textStyle,
    Color? disabledTextColor,
    required Color disabledColor,
    required Color activateColor,
    int? maxLines,
    double height = 56.0,
    double width = double.infinity,
    bool enabled = true,
    BorderRadius? borderRadius,
  }) =>
      _buildRoundButton(
        key: key,
        onPressed: onPressed,
        text: text,
        disabledTextColor: disabledTextColor,
        textStyle: textStyle,
        disabledColor: disabledColor,
        maxLines: maxLines,
        color: activateColor,
        textColor: AppColor.wh,
        height: height,
        width: width,
        enabled: enabled,
        borderRadius: borderRadius,
      );

  /* 파란색 라운드 버튼 */
  static Widget roundBlue300({
    Key? key,
    required VoidCallback onPressed,
    required String text,
    TextStyle? textStyle,
    int? maxLines,
    double height = 48.0,
    double width = double.infinity,
    bool enabled = true,
    BorderRadius? borderRadius,
  }) =>
      _buildRoundButton(
        key: key,
        onPressed: onPressed,
        text: text,
        textStyle: textStyle,
        maxLines: maxLines,
        color: AppColor.blue300,
        textColor: AppColor.wh,
        height: height,
        width: width,
        enabled: enabled,
        borderRadius: borderRadius,
      );

  /* 빨간색 라운드 버튼 */
  static Widget roundRed300({
    Key? key,
    required VoidCallback onPressed,
    required String text,
    TextStyle? textStyle,
    double height = 48.0,
    double width = double.infinity,
    bool enabled = true,
  }) =>
      _buildRoundButton(
        key: key,
        onPressed: onPressed,
        text: text,
        textStyle: textStyle,
        color: AppColor.red300,
        textColor: AppColor.wh,
        height: height,
        width: width,
        enabled: enabled,
      );

  /* 회색 라운드 버튼 */
  static Widget roundGray150({
    Key? key,
    required VoidCallback onPressed,
    required String text,
    TextStyle? textStyle,
    double height = 48.0,
    double width = double.infinity,
    bool enabled = true,
    BorderRadius? borderRadius,
  }) =>
      _buildRoundButton(
        key: key,
        onPressed: onPressed,
        height: height,
        width: width,
        text: text,
        textStyle: textStyle,
        textColor: AppColor.gray600,
        color: AppColor.gray150,
        enabled: enabled,
        borderRadius: borderRadius,
      );

  /* 파란색 테두리 버튼 */
  static Widget outlinedBlue300({
    Key? key,
    required VoidCallback onPressed,
    required String text,
    TextStyle? textStyle,
    double height = 48.0,
    double width = double.infinity,
    bool enabled = true,
  }) =>
      _buildOutlinedButton(
        key: key,
        onPressed: onPressed,
        text: text,
        height: height,
        width: width,
        textStyle: textStyle,
        textColor: AppColor.blue300,
        color: AppColor.blue300,
        enabled: enabled,
      );

  /* 빨간색 테두리 버튼 */
  static Widget outlinedRed300({
    Key? key,
    required VoidCallback onPressed,
    required String text,
    TextStyle? textStyle,
    double height = 48.0,
    double width = double.infinity,
    bool enabled = true,
  }) =>
      _buildOutlinedButton(
        key: key,
        onPressed: onPressed,
        text: text,
        height: height,
        width: width,
        textStyle: textStyle,
        textColor: AppColor.red300,
        color: AppColor.red300,
        enabled: enabled,
      );

  /* 회색 테두리 버튼 */
  static Widget outlinedGray200({
    Key? key,
    required VoidCallback onPressed,
    required String text,
    TextStyle? textStyle,
    double height = 48.0,
    double width = double.infinity,
    bool enabled = true,
  }) =>
      _buildOutlinedButton(
        key: key,
        onPressed: onPressed,
        text: text,
        height: height,
        width: width,
        textStyle: textStyle,
        textColor: AppColor.bk,
        color: AppColor.gray200,
        enabled: enabled,
      );

  /* 파란색 텍스트 버튼 */
  static Widget textBlue300({
    Key? key,
    required VoidCallback onPressed,
    required String text,
    TextStyle? textStyle,
    double height = 48.0,
    double width = double.infinity,
    bool enabled = true,
  }) =>
      _buildTextButton(
        key: key,
        onPressed: onPressed,
        text: text,
        textStyle: textStyle,
        height: height,
        width: width,
        color: AppColor.blue300,
        enabled: enabled,
      );

  /* 파란색 라운드 - 회색 테두리 토글 버튼 */
  static Widget toggleBlueGray({
    Key? key,
    required VoidCallback onPressed,
    required String text,
    required bool selected,
    String? inactiveText,
    String? disabledText,
    double height = 48.0,
    double width = double.infinity,
    bool enabled = true,
    BorderRadius? borderRadius,
    TextStyle? textStyle,
  }) =>
      selected
          ? roundBlue300(
              key: key,
              onPressed: onPressed,
              text: enabled ? text : disabledText ?? text,
              textStyle: textStyle ?? AppTextStyle.button3M1416,
              height: height,
              width: width,
              enabled: enabled,
              borderRadius: borderRadius,
            )
          : roundGray150(
              key: key,
              onPressed: onPressed,
              text: (enabled == false)
                  ? (disabledText ?? inactiveText ?? text)
                  : inactiveText ?? text,
              textStyle: textStyle ?? AppTextStyle.button3M1416,
              height: height,
              width: width,
              enabled: enabled,
              borderRadius: borderRadius,
            );

  /* default */
  static const _disabledColor = AppColor.gray200;
  static const _disabledTextColor = AppColor.gray400;
  static const _elevation = 0.0;
  static final _textStyle = AppTextStyle.button2M1618;

  /* 라운드 버튼 */
  static Widget _buildRoundButton({
    Key? key,
    required VoidCallback onPressed,
    required String text,
    required Color color,
    required Color textColor,
    VoidCallback? onPressedDisabled,
    TextStyle? textStyle,
    int? maxLines,
    double width = double.infinity,
    double height = 48.0,
    bool enabled = true,
    Color? disabledColor,
    Color? disabledTextColor,
    BorderRadius? borderRadius,
  }) =>
      CommonRoundButton(
        key: key,
        onPressed: onPressed,
        onPressedDisabled: onPressedDisabled,
        width: width ?? double.infinity,
        height: height,
        text: text,
        textStyle: textStyle ?? _textStyle,
        maxLines: maxLines ?? 1,
        elevation: _elevation,
        color: color,
        textColor: textColor,
        disabledColor: disabledColor ?? _disabledColor,
        disabledTextColor: disabledTextColor ?? _disabledTextColor,
        enabled: enabled,
        borderRadius:
            borderRadius ?? const BorderRadius.all(Radius.circular(30)),
      );

  /* 테두리 버튼 */
  static Widget _buildOutlinedButton({
    Key? key,
    required VoidCallback onPressed,
    required String text,
    required Color textColor,
    required Color color,
    TextStyle? textStyle,
    double height = 48.0,
    double width = double.infinity,
    bool enabled = true,
  }) =>
      CommonOutlineButton(
        key: key,
        onPressed: onPressed,
        text: text,
        textStyle: textStyle ?? _textStyle,
        width: width,
        height: height,
        elevation: _elevation,
        color: color,
        textColor: textColor,
        disabledColor: _disabledColor,
        disabledTextColor: _disabledTextColor,
        enabled: enabled,
      );

  /* 텍스트 버튼 */
  static Widget _buildTextButton({
    Key? key,
    required VoidCallback onPressed,
    required String text,
    required Color color,
    TextStyle? textStyle,
    double height = 48.0,
    double width = double.infinity,
    bool enabled = true,
  }) =>
      CommonTextButton(
        key: key,
        onPressed: onPressed,
        text: text,
        style: textStyle ?? _textStyle,
        width: width,
        height: height,
        elevation: _elevation,
        disabledColor: _disabledColor,
        color: color,
        enabled: enabled,
      );
}
