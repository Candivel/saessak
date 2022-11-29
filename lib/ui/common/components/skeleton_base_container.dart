import 'package:flutter/material.dart';

/* 2021.11.18(목) 추가사항 by 우수몽
 *
 * Skeleton 처리를 용이하게 하기 위한 Base Widget.
 */
class SkeletonBaseContainer extends Stack {
  SkeletonBaseContainer({
    Key? key,
    // 삭제 가능
    required bool isLoaded,
    required Widget skeleton,
    required Widget child,
  }) : super(
    key: key,
    children: [
      Visibility(visible: !isLoaded, child: skeleton),
      Visibility(visible: isLoaded,child: child)
    ],
  );
}