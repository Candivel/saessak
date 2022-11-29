import 'package:get/get.dart';
import 'package:unibeam/ui/screens/splash/splash_view_model.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<SplashViewModel>(SplashViewModel());
  }
}