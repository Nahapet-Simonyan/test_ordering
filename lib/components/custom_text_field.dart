// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:test_ordering/config/theme/colors.dart';
import 'package:test_ordering/features/ordering/presentation/manager/manager.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    this.initialValue,
    this.validator,
    this.hintText,
    this.hintStyle,
    this.icon,
    this.keyboardType,
  });

  final TextEditingController controller;
  final String? initialValue;
  final String? Function(String?)? validator;
  final String? hintText;
  final TextStyle? hintStyle;
  final Widget? icon;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderingCubit, OrderingState>(
      builder: (context, state) {
        return TextFormField(
          controller: controller,
          validator: validator,
          keyboardType: keyboardType,
          style: const TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w400,
            color: AppColors.gray1,
          ),
          cursorColor: AppColors.gray2,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: hintStyle,
            prefixIconConstraints: const BoxConstraints(maxWidth: 100),
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: icon,
            ),
          ),
          onTapOutside: (_) => FocusScope.of(context).unfocus(),
        );
      },
    );
  }
}
