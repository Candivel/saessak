import 'package:dio/dio.dart';
import 'package:get/get.dart';

abstract class RemoteModules {
  RemoteModules._();

  static void dependencies() {
    /* dio */
    // Get.put<Dio>(AppDio.getInstance(), permanent: true);
  }
}
