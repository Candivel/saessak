import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../app/routes/app_pages.dart';

/** 2022.10.24 by Max
 *  주의 : parameters 사용 금지
 *        AuthGuard에서 유저 권한 체크용으로 사용하기 때문에, 값을 넘겨주는 건 arguments로만 처리한다.
 *        (여기서 parameters를 쓰면 권한 체크용으로 넣어둔 parameters를 덮어씌워버리기 때문에, AuthGuard에서 오류가 발생한다.)
 */
class NavigationHelper {
  static final NavigationHelper _instance = NavigationHelper._internal();

  factory NavigationHelper() => _instance;

  static NavigationHelper get instance => _instance;

  NavigationHelper._internal();

  /**
   * 현재 Screen 닫고 [page] 새로 열기
   */
  Future<void> finishAndOpen(String page, {dynamic arguments}) async {
    await Get.offAndToNamed(page, arguments: arguments);
  }

  /**
   * 열려있는 모든 Screen 닫고 [page] 새로 열기
   */
  Future<void> finishAllAndOpen(String page, {dynamic arguments}) async {
    await Get.offAllNamed(page, arguments: arguments);
  }

  /**
   * [until] 위에 열려있는 Screen 모두 닫고 [page] 새로 열기
   */
  /*Future<void> finishUntilAndOpen(
    String page, {
    required String until,
    dynamic arguments,
  }) async {
    await Get.offNamedUntil(page, ModalRoute.withName(until), arguments: arguments);
  }*/

  /**
   * [page] 새로 열기
   */
  Future<T?>? open<T>(String page, {dynamic arguments}) async {
    return Get.toNamed(page, arguments: arguments);
  }

  /**
   * [until]로 돌아가기 (위에 열려있던 Screen 모두 닫음)
   */
  void finishUntil(String until) {
    Get.until((route) {
      return !route.willHandlePopInternally &&
          route is ModalRoute &&
          route.settings.name == until;
    });
  }

  /**
   * 현재 페이지 닫기
   */
  void finish<T>({T? result}) {
    Get.back<T>(result: result);
  }

  /**
   * 앱 종료
   */
  Future<void> finishApp() async {
    await SystemNavigator.pop();
    exit(1);
  }

  /**
   * 2022.11.14 by Max : 해당 T 객체의 binding 여부(의존성 주입 여부)를 체크함.
   */
  bool isRegistered<T>() {
    return Get.isRegistered<T>();
  }
}
