import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';

import '../../../../app/resources/colors.dart';
import '../../../../app/resources/font.dart';

class InputField extends StatelessWidget {
  /// Validation 및 control 관련
  bool? validate; //입력이 없을때는 null, 이후 입력이 생기면 true<->false 왔다갔다.
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;

  /// InputField 속성
  final TextInputType keyboardType;
  final String? text;
  final String? bottomGuide;
  final String? hint;
  final String? errorText;
  final String? successText;
  final TextInputAction? inputAction;

  /// 버튼 상태 관련
  final bool active;
  final bool enable;
  final bool password;

  InputField({
    this.validate,
    this.controller,
    this.onChanged,
    this.keyboardType = TextInputType.text,
    this.text,
    this.bottomGuide,
    this.hint,
    this.errorText,
    this.successText,
    this.inputAction,
    this.active = true,
    this.enable = true,
    this.password = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: (!active)
          ? false
          : (!enable)
              ? false
              : true,
      decoration: InputDecoration(
        fillColor: enable ? Colors.transparent : AppColor.gray100,
        contentPadding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 8.0),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: (validate != null && validate!)
                ? AppColor.success
                : AppColor.gray200,
          ),
        ),
        disabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColor.gray200,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: (validate != null && validate!)
                ? AppColor.success
                : AppColor.bk,
          ),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColor.error,
          ),
        ),
        focusedErrorBorder: UnderlineInputBorder(
            borderSide: BorderSide(
          color: AppColor.error,
        )),
        hintText: hint,
        hintStyle: AppTextStyle.title3R1418.copyWith(color: AppColor.gray400),
        helperText: (validate != null && validate!) ? successText : bottomGuide,
        helperStyle: (validate != null && validate!)
            ? AppTextStyle.title1R1618.copyWith(color: AppColor.success)
            : AppTextStyle.title1R1618.copyWith(color: AppColor.gray500),
        errorText: (validate != null && !validate!) ? (errorText ?? '') : null,
        errorStyle: errorText == null
            ? TextStyle(height: 0)
            : AppTextStyle.title4R1216.copyWith(color: AppColor.error),
        filled: true,
        isDense: true,
      ),
      controller: text != null ? TextEditingController(text: text) : controller,
      style: AppTextStyle.title3R1418.copyWith(
          color: !enable
              ? AppColor.gray600
              : !active
                  ? AppColor.gray400
                  : AppColor.bk),
      keyboardType: keyboardType,
      inputFormatters: (keyboardType == TextInputType.phone)
          ? [MaskedInputFormatter('###-####-####')]
          : [],
      obscureText: password,
      autocorrect: false,
      onChanged: onChanged,
      textInputAction: inputAction,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}
