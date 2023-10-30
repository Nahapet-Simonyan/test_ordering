import 'package:flutter/material.dart';
import 'package:test_ordering/config/theme/colors.dart';

class CustomButtonField extends StatelessWidget {
  const CustomButtonField({
    super.key,
    this.onTap,
    this.icon,
    required this.child,
  });

  final void Function()? onTap;
  final Widget? icon;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.gray3),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          if (icon != null) SizedBox(width: 20.0, height: 20, child: icon!),
          const SizedBox(width: 12.0),
          InkWell(onTap: onTap, child: child),
        ],
      ),
    );
  }
}
