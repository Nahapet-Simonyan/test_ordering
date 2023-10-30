// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:test_ordering/config/router/app_navigator.dart';
import 'package:test_ordering/components/components.dart';
import 'package:test_ordering/config/theme/colors.dart';
import 'package:test_ordering/core/enum.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text('HomeScreen'),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: CustomButton(
          onTap: () => AppNavigator(context).goOrderingScreen(),
          buttonType: ButtonType.large,
          child: Text(
            'Ordering',
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: AppColors.white,
                ),
          ),
        ),
      ),
    );
  }
}
