import 'package:flutter/material.dart';

import '../../../app/resources/colors.dart';

class CommonSeperatorContainer extends StatelessWidget {
  const CommonSeperatorContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8,
      color: AppColor.gray100,
    );
  }
}
