import 'package:get/get.dart';
import 'package:unibeam/ui/screens/splash/splash_binding.dart';

import '../../ui/screens/splash/splash_screen.dart';

part 'app_routes.dart';

abstract class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: Routes.splash,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
  ];
}
