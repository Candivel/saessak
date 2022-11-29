import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:unibeam/ui/common/base/base_screen.dart';
import 'package:unibeam/ui/screens/splash/splash_view_model.dart';

class SplashScreen extends BaseScreen<SplashViewModel> {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget buildBody(BuildContext context) {
    return Center(
      child: Lottie.asset('assets/lotties/sprout.json'),
    );
  }
}