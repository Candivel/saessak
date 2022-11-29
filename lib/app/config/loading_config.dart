import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_utils/src/extensions/num_extensions.dart';
import 'package:lottie/lottie.dart';

import '../resources/colors.dart';
import '../resources/font.dart';
import '../resources/inset.dart';

abstract class AppLoadingConfig {
  AppLoadingConfig._();

  static void init() {
    // Lottie(app_loading.json) 적용한 신규 코드
    EasyLoading.instance
      ..indicatorWidget = Lottie.asset('assets/lotties/app_loading.json', width: 72, height: 72)
      ..radius = 16
      ..indicatorType = EasyLoadingIndicatorType.threeBounce
      ..indicatorSize = 24
      ..indicatorColor = AppColor.blue300
      ..loadingStyle = EasyLoadingStyle.custom
      ..progressColor = AppColor.blue300
      ..backgroundColor = AppColor.wh
      ..textColor = AppColor.bk
      ..maskColor = AppColor.bk.withOpacity(0.5)
      ..userInteractions = false
      ..displayDuration = 3.seconds
      ..textPadding = AppInset.all8
      ..textStyle = AppTextStyle.body2R1424
      ..maskType = EasyLoadingMaskType.custom
      ..animationStyle = EasyLoadingAnimationStyle.scale
      ..dismissOnTap = false;
  }
}
