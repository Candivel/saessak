import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../base/base_view_model.dart';

/// 2022.06.07(화) : EasyLoading 기반으로 변경
mixin LoadingBarMixin {
  void initLoadingBar(BaseViewModel vm) {
    vm.loading.listen((loading) {
      if (loading) {
        _showLoadingBar();
      } else {
        _dismissLoadingBar();
      }
    }).bindTo(vm);
  }

  /**
   * 화면 상단에 띄울 loading progress bar (배경 투명한 SnackBar 로 띄움)
   * Scaffold context 가 필요하지 않으므로 GetX 에서 제공하는 GetBar 사용함
   */
  /*late final _loadingBar = GetSnackBar(
    showProgressIndicator: true,
    snackPosition: SnackPosition.TOP,
    backgroundColor: Colors.transparent,
    isDismissible: false,
    snackbarStatus: (status) =>
        _loadingBarStatus = status ?? SnackbarStatus.CLOSED,
    animationDuration: Duration.zero,
    messageText: const Text(''),
  );*/

  /**
   * loadingBar 열고 닫기 전에 open/close 여부 체크하기 위한 status 저장
   */
  // SnackbarStatus _loadingBarStatus = SnackbarStatus.CLOSED;

  /* 로딩바 띄우기 */
  void _showLoadingBar() {
    if(EasyLoading.isShow == false) {
      EasyLoading.show(status: '로딩중......');
    }

    /*if (_loadingBarStatus != SnackbarStatus.OPEN &&
        _loadingBarStatus != SnackbarStatus.OPENING) {
      _loadingBar.show();
    }*/
  }

  /* 로딩바 닫기 */
  void _dismissLoadingBar() {
    if(EasyLoading.isShow == true) {
      EasyLoading.dismiss();
    }

    /*if (_loadingBarStatus == SnackbarStatus.OPEN ||
        _loadingBarStatus == SnackbarStatus.OPENING) {
      Get.until((route) => !Get.isSnackbarOpen);
    }*/
  }
}
