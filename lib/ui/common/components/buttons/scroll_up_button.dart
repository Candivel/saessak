import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_utils/src/extensions/num_extensions.dart';

import '../../../../app/resources/colors.dart';
import '../../../../app/resources/radius.dart';

/**
 * 화면을 위로 올리는 FloatingActionButton.
 * 화면이 리스트 영역으로 내려갈 때만 표시된다.
 */
class ScrollUpButton extends StatefulWidget {
  final ScrollController controller;
  final double visibleOffset;
  final double opacity;
  final double size;

  const ScrollUpButton({
    Key? key,
    required this.controller,
    this.visibleOffset = 100,
    this.opacity = 0.9,
    this.size = 40,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ScrollUpButtonState();
}

class _ScrollUpButtonState extends State<ScrollUpButton> {
  bool isScrollStarted = false;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(scrollListener);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: isScrollStarted ? widget.opacity : 0.0,
      duration: 200.milliseconds,
      child: IgnorePointer(
        ignoring: isScrollStarted == false,
        child: GestureDetector(
          onTap: isScrollStarted ? scrollUp : null,
          child: _PageUpIcon(size: widget.size),
        ),
      ),
    );
  }

  void scrollListener() {
    setState(() {
      isScrollStarted = widget.controller.offset > widget.visibleOffset;
    });
  }

  void scrollUp() {
    widget.controller.animateTo(
      0,
      duration: 300.milliseconds,
      curve: Curves.ease,
    );
  }

  @override
  void dispose() {
    widget.controller.removeListener(scrollListener);
    super.dispose();
  }
}

class _PageUpIcon extends StatelessWidget {
  final double size;

  const _PageUpIcon({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: AppRadius.all20,
        border: Border.all(color: AppColor.gray200),
        color: AppColor.wh,
      ),
      child: Center(
        child: SvgPicture.asset('assets/icons/page_up.svg'),
      ),
    );
  }
}
