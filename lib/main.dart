// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

// Project imports:
import 'package:test_ordering/config/router/router.dart';
import 'package:test_ordering/config/theme/light_theme.dart';
import 'package:test_ordering/features/ordering/presentation/manager/manager.dart';

import 'core/hive/ordering_box/ordering_box.dart';

late Box box;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Hive initialization
  await Hive.initFlutter();
  Hive.registerAdapter(OrderingBoxAdapter());
  box = await Hive.openBox('box');

  runApp(const OrderingApp());
}

class OrderingApp extends StatelessWidget {
  const OrderingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => OrderingCubit(),
        ),
      ],
      child: MaterialApp.router(
        title: 'Med Service',
        theme: lightTheme,
        routerConfig: router,
      ),
    );
  }
}
