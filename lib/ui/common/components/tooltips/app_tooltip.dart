import 'package:flutter/material.dart';

import '../../../../app/config/app_space_config.dart';
import '../../../../app/resources/colors.dart';
import '../../../../app/resources/font.dart';
import '../../../../app/resources/inset.dart';
import '../../../../app/resources/radius.dart';

class AppTooltip extends StatelessWidget {
  // 메세지 내용
  final List<MessageAppTooltip> messages;
  // 메세지 기본 스타일
  final TextStyle? textStyle;
  static final _textStyle = AppTextStyle.body1;

  // 그림자 표시 여부(기본값은 true)
  final bool showShadow;
  // 말풍선 방향, 기본값은 bottomCenter.
  // final Alignment direction;

  const AppTooltip({
    super.key,
    required this.messages,
    this.textStyle,
    this.showShadow = true,
    // this.direction = Alignment.bottomCenter,
  });

  @override
  Widget build(BuildContext context) {
    List<TextSpan> subMessages = [];
    for (var i = 1; i < messages.length; i++) {
      subMessages.add(
        TextSpan(
          text: messages[i].message,
          style: (textStyle != null)
              ? textStyle!.copyWith(color: messages[i].color)
              : _textStyle.copyWith(color: messages[i].color),
        ),
      );
    }

    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          if (showShadow)

            /// 그림자
            // S: 0
            const BoxShadow(
              color: Color(0x40566E93),
              blurRadius: 42, // B: 42
              offset: Offset(0, 4), // X: 0, Y: 4
            ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: AppInset.vertical12 + AppInset.horizontal24,
            decoration: const BoxDecoration(
              color: AppColor.wh,
              borderRadius: AppRadius.all12,
            ),
            child: RichText(
              text: TextSpan(
                text: messages[0].message,
                style: (textStyle != null)
                    ? textStyle!.copyWith(color: messages[0].color)
                    : _textStyle.copyWith(color: messages[0].color),
                children: subMessages,
              ),
            ),
          ),
          CustomPaint(
            painter: _TriangleAppTooltip(),
          ),

          /// size12를 단 이유 : [_TriangleAppTooltip]의 높이인 12만큼 아래쪽 영역을 확보하기 위함.
          // _TriangleAppTooltip의 경우, Painter로 그려서 그런지 padding 등의 영향을 안 받는 것으로 보인다. 그래서 별도로 값을 넣었다.
          AppSpace.size12,
        ],
      ),
    );
  }
}

/// [AppTooltip]에서 메세지를 표현하기 위해 사용하는 모델
class MessageAppTooltip {
  final String message;
  final Color color;

  const MessageAppTooltip({
    required this.message,
    this.color = AppColor.black,
  });
}

/// [AppTooltip]에서 사용하는 삼각형
class _TriangleAppTooltip extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()..color = AppColor.white;

    var path = Path()
      ..moveTo(-10, 0)
      ..lineTo(10, 0)
      ..lineTo(0, 12)
      ..lineTo(-10, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
