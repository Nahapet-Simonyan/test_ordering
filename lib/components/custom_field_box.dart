import 'package:flutter/material.dart';

class CustomFieldBox extends StatelessWidget {
  const CustomFieldBox({
    super.key,
    this.title,
    required this.child,
  });

  final String? title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      height: 67,
      color: theme.cardColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null) Text(title!, style: theme.textTheme.headlineSmall),
          Container(
            constraints: (const BoxConstraints(minHeight: 44)),
            height: 44,
            child: child,
          ),
        ],
      ),
    );
  }
}
