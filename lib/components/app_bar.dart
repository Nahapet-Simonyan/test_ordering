// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, this.title});

  final Widget? title;

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    final canPop = GoRouter.of(context).canPop();
    return AppBar(
      automaticallyImplyLeading: false,
      leading: canPop
          ? InkWell(
              onTap: () => GoRouter.of(context).pop(),
              borderRadius: BorderRadius.circular(50),
              enableFeedback: false,
              child: Image.asset('assets/icons/arrow_back.png'),
            )
          : null,
      title: title,
      titleTextStyle: Theme.of(context).textTheme.headlineLarge,
    );
  }
}
