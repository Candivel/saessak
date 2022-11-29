import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../app/resources/colors.dart';
import '../../../../app/resources/font.dart';
import '../../../../app/resources/inset.dart';

class AppBars extends AppBar {
  final AppBarTitle? titleItem;
  final AppBarIcon? leadingItem;
  final List<AppBarIcon> actionItems;

  AppBars({
    Key? key,
    required this.titleItem,
    required this.leadingItem,
    required this.actionItems,
  }) : super(
          key: key,
          leading: leadingItem?.icon,
          centerTitle: true,
          title: titleItem?.text,
          titleTextStyle: titleItem?.titleStyle,
          actions: [
            for (final item in actionItems) item.icon,
          ],
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        );

  factory AppBars.backButton({
    String? title,
    required VoidCallback onPressBack,
    List<AppBarIcon>? actionItems,
  }) =>
      AppBars(
        titleItem: title == null ? null : AppBarTitle(title: title),
        leadingItem: AppBarIcon.back(onPress: onPressBack),
        actionItems: actionItems ?? const [],
      );

  factory AppBars.newBackButton({
    String? title,
    required VoidCallback onPressBack,
    List<AppBarIcon>? actionItems,
  }) =>
      AppBars(
        titleItem: title == null ? null : AppBarTitle(title: title),
        leadingItem: AppBarIcon.newBack(onPress: onPressBack),
        actionItems: actionItems ?? const [],
      );

  factory AppBars.simpleShapeBackBtn({
    String? title,
    required VoidCallback onPressBack,
    List<AppBarIcon>? actionItems,
  }) =>
      AppBars(
        titleItem: title == null ? null : AppBarTitle(title: title, titleStyle: AppTextStyle.title2.copyWith(color: AppColor.bk)),
        leadingItem: AppBarIcon.simpleShape(onPress: onPressBack),
        actionItems: actionItems ?? const [],
      );
}

class SliverAppBars extends StatelessWidget {
  final AppBarTitle? titleItem;
  final AppBarIcon? leadingItem;
  final List<AppBarIcon> actionItems;
  final bool pinned;
  final bool floating;
  final bool snap;

  const SliverAppBars({
    Key? key,
    this.titleItem,
    this.leadingItem,
    this.actionItems = const [],
    this.pinned = true,
    this.floating = false,
    this.snap = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      key: key,
      leading: leadingItem?.icon,
      centerTitle: titleItem?.centerTitle,
      title: titleItem?.text,
      pinned: pinned,
      floating: floating,
      snap: snap,
      actions: [
        for (final item in actionItems) item.icon,
      ],
      backgroundColor: Colors.transparent,
      elevation: 0.0,
    );
  }
}

class AppBarTitle {
  final String title;
  final TextStyle titleStyle;
  final bool centerTitle;

  AppBarTitle({
    required this.title,
    TextStyle? titleStyle,
    this.centerTitle = true,
  }) : titleStyle = titleStyle ?? AppTextStyle.title1R1618;

  Widget get text => Text(title, style: titleStyle);
}

class AppBarIcon {
  final String assetPath;
  final VoidCallback onPress;
  final Color? color;
  final double size;

  AppBarIcon({
    required this.assetPath,
    required this.onPress,
    required this.color,
    this.size = 24,
  });

  Widget get icon => GestureDetector(
        onTap: onPress,
        child: Container(
          height: size + 32,
          padding: AppInset.all16,
          child: SvgPicture.asset(
            assetPath,
            height: size,
            color: color,
            fit: BoxFit.fitHeight,
          ),
        ),
      );

  factory AppBarIcon.ourtube() => AppBarIcon(
        assetPath: 'assets/icons/text_logo.svg',
        onPress: () {},
        color: null,
      );

  factory AppBarIcon.back({required VoidCallback onPress}) => AppBarIcon(
        assetPath: 'assets/icons/backarrow.svg',
        onPress: onPress,
        color: null,
      );

  // 새로운 뒤로가기 아이콘
  factory AppBarIcon.newBack({required VoidCallback onPress}) => AppBarIcon(
        assetPath: 'assets/icons/left_arrow_ic.svg',
        onPress: onPress,
        size: 32,
        color: null,
      );

  // 새로운 뒤로가기 아이콘2
  factory AppBarIcon.simpleShape({required VoidCallback onPress}) => AppBarIcon(
        assetPath: 'assets/icons/new_back_arrow_ic.svg',
        onPress: onPress,
        size: 64,
        color: AppColor.grey60,
      );

  factory AppBarIcon.settings({required VoidCallback onPress}) => AppBarIcon(
        assetPath: 'assets/icons/setting.svg',
        onPress: onPress,
        color: null,
      );
}
