//Flutter imports:
import 'package:flutter/material.dart';

//Project imports:
import 'package:test_ordering/config/theme/colors.dart';
import 'package:test_ordering/core/enum.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onTap,
    this.buttonType = ButtonType.individual,
    this.width,
    this.height,
    this.color,
    this.borderRadius,
    required this.child,
  });

  final void Function()? onTap;
  final ButtonType? buttonType;
  final double? width;
  final double? height;
  final Color? color;
  final BorderRadiusGeometry? borderRadius;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      enableFeedback: false,
      child: Container(
        width: width ?? double.infinity,
        height: buttonType == ButtonType.large
            ? 52
            : buttonType == ButtonType.small
                ? 33
                : height ?? 52,
        decoration: BoxDecoration(
          color: color ?? AppColors.orange,
          borderRadius: buttonType == ButtonType.large
              ? BorderRadius.circular(50)
              : buttonType == ButtonType.small
                  ? BorderRadius.circular(36)
                  : borderRadius ?? BorderRadius.circular(50),
        ),
        child: Center(child: child),
      ),
    );
  }
}
