import 'package:get/get.dart';

import 'base_view_model.dart';

abstract class BaseDialogViewModel extends BaseViewModel {
  RxDouble? customDialogMinHeight;
  RxDouble animationOpacity = 0.0.obs;
  RxDouble dialogMinHeight = 0.0.obs;

  /**
   * Dialog Increase Box Animation을 실행시키는 메소드.
   * ViewModel에서 Dialog 높이를 설정하지 않을 경우, 높이 300을 디폴트 값으로 가짐.
   */
  void setIncreaseAnimation(double minHeight) {
    dialogMinHeight = minHeight.obs;
    update();
  }

  void setDialogMinHeight(double minHeight) {
    customDialogMinHeight = minHeight.obs;
  }

  /**
   * Dialog FadeIn Animation을 실행시키는 메소드
   */
  void setFadeInAnimation() {
    animationOpacity = 1.0.obs;
    update();
  }

  @override
  void onReady() {
    super.onReady();
    setFadeInAnimation();
    if (customDialogMinHeight == null) {
      setIncreaseAnimation(300.0);
      return update();
    }
    setIncreaseAnimation(customDialogMinHeight!.value);
  }
}
