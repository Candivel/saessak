import 'package:flutter/material.dart';

import '../../../../app/config/app_space_config.dart';
import '../../../../app/config/size_config.dart';
import '../../../../app/resources/colors.dart';
import '../../../../app/resources/font.dart';
import '../../../../app/resources/inset.dart';
import '../../../../app/resources/radius.dart';

class DisabledTextFormFieldBox extends StatelessWidget {
  const DisabledTextFormFieldBox({
    Key? key,
    required this.contents,
  }) : super(key: key);

  final List<String> contents;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppInset.horizontal16 + AppInset.vertical20,
      width: SizeConfig().safeAreaWidth,
      decoration: const BoxDecoration(
        borderRadius: AppRadius.all8,
        color: AppColor.gray150,
      ),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: contents.length,
        itemBuilder: (_, index) => Text(
          contents[index],
          style: AppTextStyle.title1R1618,
        ),
        separatorBuilder: (_, __) => AppSpace.size24,
      ),
    );
  }
}
