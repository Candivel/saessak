import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/config/size_config.dart';
import '../../../app/resources/colors.dart';
import '../extensions/snack_bar_extension.dart';
import '../helper/navigation_helper.dart';
import '../widgets/containers/back_button_container.dart';
import 'base_view_model.dart';

@immutable
abstract class BaseScreen<T extends BaseViewModel> extends GetView<T> {
  const BaseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /* init view model */
    initViewModel();
    observeRxData(context);

    /* build screen */
    return BackButtonContainer(
      preventSwipeBack: preventSwipeBack,
      onPressBack: onPressBack,
      outerAreaColor:
          (setOuterAreaColor == null) ? setOuterAreaColor : setBackgroundColor,
      child: wrapWithSafeArea
        ? SafeArea(
          bottom: setBottomSafeArea,
          child: _buildScaffold(context),
        )
        : _buildScaffold(context),

      /*ClearFocusContainer(
        child: wrapWithSafeArea
            ? SafeArea(child: _buildScaffold(context))
            : _buildScaffold(context),
      ),*/
    );
  }

  @mustCallSuper
  void initViewModel() {
    vm.initialized;
  }

  @mustCallSuper
  void observeRxData(BuildContext context) {
    showSnackBarWhenMessageEmitted(context, vm);
  }

  /* 스낵바 띄우기 */
  @protected
  void showSnackBarWhenMessageEmitted(
    final BuildContext context,
    final BaseViewModel vm,
  ) {
    vm.snackBarMessage
        .listen((message) => SnackBarHelper.message(message).show(context))
        .bindTo(vm);
  }

  Widget _buildScaffold(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: buildAppBar(context),
      body: buildBody(context),
      backgroundColor: setBackgroundColor,
      floatingActionButton: buildFloatingActionButton(context),
      floatingActionButtonLocation: floatingActionButtonLocation,
      bottomNavigationBar: buildBottomNavigationBar(context),
    );
  }

  @protected
  Color? get setBackgroundColor => AppColor.wh;

  @protected
  Color? get setOuterAreaColor => AppColor.wh;

  // 사용 용도 : TabsScreen에서 탭(홈/옥션/거래/내정보) 아래 영역의 색상을 탭 색상과 동일하게 맞추기 위함.
  @protected
  bool get setBottomSafeArea => true;

  @protected
  Widget buildBody(BuildContext context);

  @protected
  PreferredSizeWidget? buildAppBar(BuildContext context) => null;

  @protected
  Widget? buildBottomNavigationBar(BuildContext context) => null;

  @protected
  Widget? buildFloatingActionButton(BuildContext context) => null;

  @protected
  FloatingActionButtonLocation? get floatingActionButtonLocation => null;

  @protected
  VoidCallback get onPressBack => NavigationHelper.instance.finish;

  @protected
  bool get wrapWithSafeArea => true;

  @protected
  T get vm => controller;

  @protected
  double get safeAreaHeight => SizeConfig().safeAreaHeight;

  @protected
  double get appBarHeight => SizeConfig().appBarHeight;

  @protected
  bool get preventSwipeBack => false;
}
