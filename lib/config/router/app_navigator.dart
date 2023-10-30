// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:go_router/go_router.dart';

class AppNavigator {
  AppNavigator(this.context);

  final BuildContext context;

  void goOrderingScreen() {
    context.go(context.namedLocation('ordering'));
  }
}
