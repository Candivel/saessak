import 'package:flutter/material.dart';

class CommonRoundButton extends StatelessWidget {
  const CommonRoundButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.textColor,
    this.color,
    this.elevation,
    this.textStyle,
    this.height = 48,
    this.width,
    this.padding,
    this.maxLines = 1,
    this.borderRadius = const BorderRadius.all(Radius.circular(30)),
    this.disabledColor,
    this.disabledTextColor,
    this.enabled = true,
    this.onPressedDisabled,
  }) : super(key: key);

  final VoidCallback onPressed;
  final VoidCallback? onPressedDisabled;
  final String text;
  final Color? textColor;
  final Color? color;
  final double? elevation;
  final TextStyle? textStyle;
  final double height;
  final double? width;
  final EdgeInsets? padding;
  final BorderRadius borderRadius;
  final Color? disabledColor;
  final Color? disabledTextColor;
  final bool enabled;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ClipRRect(
        borderRadius: borderRadius,
        child: MaterialButton(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          key: key,
          padding: padding,
          minWidth: 0,
          onPressed: enabled ? onPressed : onPressedDisabled,
          color:
              (!enabled && onPressedDisabled != null) ? disabledColor : color,
          elevation: elevation,
          textColor: (!enabled && onPressedDisabled != null)
              ? disabledTextColor
              : textColor,
          disabledColor: disabledColor,
          disabledTextColor: disabledTextColor,
          child: Text(
            text,
            textAlign: TextAlign.center,
            maxLines: maxLines,
            style: textStyle?.copyWith(
              height: 0,
              color: enabled ? textColor : disabledTextColor,
            ),
          ),
        ),
      ),
    );
  }
}
