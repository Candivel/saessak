import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/config/size_config.dart';
import '../../../app/resources/colors.dart';
import '../../../app/resources/inset.dart';
import '../../../app/resources/radius.dart';
import 'base_dialog_view_model.dart';

/*
* 작업자 by 우수몽, 이해주
* `BaseDialogViewModel`의 값으로 해당 `View`의 애니메이션을 Trigger함
* TODO: 현재는 대략적인 Dialog 높이 값으로 애니메이션 값을 주고 있지만, 추후 [TextPaint] 기능을 이용해 정확한 높이를 측정해 애니메이션 효과를 줄 필요가 있음.
* */
abstract class BaseDialog<T extends BaseDialogViewModel> extends GetView<T> {
  const BaseDialog({super.key});

  T get vm => controller;

  double get safeAreaHeight => SizeConfig().safeAreaHeight;
  double get appBarHeight => SizeConfig().appBarHeight;

  @override
  Widget build(BuildContext context) {
    initViewModel();
    observeRxData(context);
    return WillPopScope(
      onWillPop: () async {
        if (barrierDismissible == true) {
          dismiss.call();
        }
        return barrierDismissible;
      },
      child: Stack(
        children: [
          if (barrierDismissible == true)
            GestureDetector(
              onTap: dismiss.call,
              child: Container(
                color: AppColor.dialogBackground,
                width: double.infinity,
                height: double.infinity,
              ),
            )
          else
            Container(
              color: AppColor.dialogBackground,
              width: double.infinity,
              height: double.infinity,
            ),
          Dialog(
            shape: (radius != null)
                ? RoundedRectangleBorder(borderRadius: radius!)
                : null,
            elevation: elevation,
            backgroundColor: Colors.transparent,
            insetPadding: insetPadding,
            child: GetBuilder<T>(
              init: vm,
              builder: (_) {
                return AnimatedOpacity(
                  duration: const Duration(milliseconds: 400),
                  opacity: vm.animationOpacity.value,
                  child: AnimatedContainer(
                    constraints: BoxConstraints(
                      minHeight: vm.dialogMinHeight.value,
                    ),
                    duration: const Duration(milliseconds: 200),
                    child: buildDialog(context),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  @mustCallSuper
  void initViewModel() {
    vm.initialized;
  }

  @mustCallSuper
  void observeRxData(BuildContext context) {}

  Widget buildDialog(BuildContext context);

  @protected
  VoidCallback get dismiss => vm.navigation.finish;

  @protected
  bool get barrierDismissible => true;

  @protected
  BorderRadius? get radius => AppRadius.all8;

  @protected
  EdgeInsets? get insetPadding => AppInset.horizontal16;

  @protected
  double get elevation => 0;
}
