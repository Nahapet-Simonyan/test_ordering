// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:go_router/go_router.dart';

// Project imports:
import 'package:test_ordering/features/home/home.dart';
import 'package:test_ordering/features/ordering/ordering.dart';

final GoRouter router = GoRouter(
  debugLogDiagnostics: true,
  routes: <GoRoute>[
    GoRoute(
        path: '/',
        name: 'home',
        builder: (BuildContext context, GoRouterState state) {
          return const HomeScreen();
        },
        routes: [
          GoRoute(
            path: 'ordering',
            name: 'ordering',
            builder: (BuildContext context, GoRouterState state) {
              return const OrderingScreen();
            },
          ),
        ]),
  ],
);
