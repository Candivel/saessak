import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../app/resources/font.dart';
import '../../../../app/resources/inset.dart';

class NewAppBars extends AppBar {
  final AppBarTitle? titleItem;
  final AppBarIcon? leadingItem;
  final List<AppBarIcon> actionItems;

  NewAppBars({
    Key? key,
    required this.titleItem,
    required this.leadingItem,
    required this.actionItems,
  }) : super(
          key: key,
          leading: leadingItem?.icon,
          centerTitle: true,
          title: titleItem?.text,
          actions: [
            for (final item in actionItems) item.icon,
          ],
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        );

  factory NewAppBars.backButton({
    String? title,
    required VoidCallback onPressBack,
    List<AppBarIcon>? actionItems,
  }) =>
      NewAppBars(
        titleItem: title == null ? null : AppBarTitle(title: title),
        leadingItem: AppBarIcon.back(onPress: onPressBack),
        actionItems: actionItems ?? const [],
      );

  factory NewAppBars.simpleShapeBackBtn({
    String? title,
    required VoidCallback onPressBack,
    List<AppBarIcon>? actionItems,
  }) =>
      NewAppBars(
        titleItem: title == null ? null : AppBarTitle(title: title),
        leadingItem: AppBarIcon.simpleShape(onPress: onPressBack),
        actionItems: actionItems ?? const [],
      );
}

class AppBarTitle {
  final String title;
  final TextStyle titleStyle;
  final bool centerTitle;

  AppBarTitle({
    required this.title,
    TextStyle? titleStyle,
    this.centerTitle = true,
  }) : titleStyle = titleStyle ?? AppTextStyle.title2;

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
          padding: AppInset.all12,
          child: SvgPicture.asset(
            assetPath,
            height: size,
            color: color,
            fit: BoxFit.fitHeight,
          ),
        ),
      );

  // 새로운 뒤로가기 아이콘
  factory AppBarIcon.back({required VoidCallback onPress}) => AppBarIcon(
        assetPath: 'assets/icons/left_arrow_ic.svg',
        onPress: onPress,
        size: 32,
        color: null,
      );

  // 새로운 뒤로가기 아이콘2
  factory AppBarIcon.simpleShape({required VoidCallback onPress}) => AppBarIcon(
        assetPath: 'assets/icons/new_back_arrow_ic.svg',
        onPress: onPress,
        size: 32,
        color: null,
      );
}
