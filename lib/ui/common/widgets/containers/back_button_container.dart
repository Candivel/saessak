import 'package:cupertino_will_pop_scope/cupertino_will_pop_scope.dart';
import 'package:flutter/widgets.dart';

// 화면 클릭 시 포커스 초기화 기능 추가
// SafeArea 바깥 영역 색상 지정 기능 추가
class BackButtonContainer extends StatelessWidget {
  const BackButtonContainer({
    Key? key,
    required this.onPressBack,
    required this.child,
    this.willPop = false,
    this.preventSwipeBack = false,
    required this.outerAreaColor,
  }) : super(key: key);

  final VoidCallback? onPressBack;
  final Widget child;
  final bool willPop;
  final Color? outerAreaColor;
  final bool preventSwipeBack;

  @override
  Widget build(BuildContext context) {
    return ConditionalWillPopScope(
      onWillPop: () async {
        onPressBack?.call();
        return willPop;
      },
      shouldAddCallback: preventSwipeBack,
      child: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: (outerAreaColor == null)
            ? child
            : Container(
                color: outerAreaColor,
                child: child,
              ),
      ),
    );
  }
}
