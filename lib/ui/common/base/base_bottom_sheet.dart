import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/resources/colors.dart';
import '../../../app/resources/inset.dart';
import '../../../app/resources/radius.dart';
import 'base_dialog_view_model.dart';

abstract class BaseBottomSheet<T extends BaseDialogViewModel> extends GetView<T> {
  const BaseBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if(barrierDismissible == true) {
          dismiss.call();
        }
        return barrierDismissible;
      },
      child: SafeArea(
        child: Stack(
          children: [
            if(barrierDismissible == true)
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
            Align(
              alignment: Alignment.bottomCenter,
              child: BottomSheet(
                onClosing: () {},
                shape: (radius != null) ? RoundedRectangleBorder(borderRadius: radius!) : null,
                elevation: elevation,
                backgroundColor: Colors.transparent,
                builder: buildBottomSheet,
              ),
            )
          ],
        ),
      ),
    );
  }

  @protected
  Widget buildBottomSheet(BuildContext context);

  @protected
  VoidCallback get dismiss => controller.navigation.finish;

  @protected
  bool get barrierDismissible => true;

  @protected
  BorderRadius? get radius => AppRadius.top16;

  @protected
  EdgeInsets? get insetPadding => AppInset.horizontal16;

  @protected
  double get elevation => 0;
}