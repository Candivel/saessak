import 'package:flutter/material.dart';

import '../../../../app/resources/colors.dart';
import '../../../../app/resources/inset.dart';
import '../../../../app/resources/radius.dart';

/** 2022.07.11(월) made by Max(우수몽)
 *  광고수익금을 포함한 여러 부분에서 쓰이는 CardView.
 *
 *  다음 사항들이 적용되어 있다.
 *  - 그림자
 *  - radius
 *  - 배경색
 *  - padding
 *  edited by Ximya
 *  - margin
 *  - alignment
 *
 *  child는 따로 만들어줘야 한다.
 */
class AppCardView extends StatelessWidget {
  final bool showShadow;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double? width;
  final double? height;
  final Widget child;
  final Alignment? alignment;

  const AppCardView({
    super.key,
    this.showShadow = true,
    this.padding,
    this.margin,
    this.width,
    this.height,
    required this.child,
    this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment ?? Alignment.center,
      margin: margin ?? EdgeInsets.zero,
      padding: padding ?? AppInset.vertical16 + AppInset.horizontal20,
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: AppRadius.all20,
        color: AppColor.white,
        boxShadow: [
          if (showShadow)

            /// 그림자
            // S: 0
            const BoxShadow(
              color: Color(0x24767A8B),
              blurRadius: 36, // B: 36
              offset: Offset(0, 3), // X: 0, Y: 3
            ),
        ],
      ),
      child: child,
    );
  }
}
