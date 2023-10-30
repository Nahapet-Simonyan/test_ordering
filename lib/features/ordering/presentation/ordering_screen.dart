// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

// Project imports:
import 'package:test_ordering/components/components.dart';
import 'package:test_ordering/config/theme/colors.dart';
import 'package:test_ordering/core/enum.dart';
import 'package:test_ordering/core/hive/ordering_box/ordering_box.dart';
import 'package:test_ordering/main.dart';
import 'manager/manager.dart';
import 'widgets/widgets.dart';

final _formKey = GlobalKey<FormState>();

Map<String, dynamic> senderCont = {
  'name': TextEditingController(),
  'email': TextEditingController(),
  'phone': TextEditingController(),
  'country': TextEditingController(),
  'city': TextEditingController(),
  'addressLine': [TextEditingController()],
  'postcode': TextEditingController(),
  'search': TextEditingController(),
};

Map<String, dynamic> recipeCont = {
  'name': TextEditingController(),
  'email': TextEditingController(),
  'phone': TextEditingController(),
  'country': TextEditingController(),
  'city': TextEditingController(),
  'addressLine': [TextEditingController()],
  'postcode': TextEditingController(),
  'search': TextEditingController(),
};

class OrderingScreen extends StatelessWidget {
  const OrderingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: const CustomAppBar(title: Text('Ordering')),
      body: BlocBuilder<OrderingCubit, OrderingState>(
        builder: (context, state) {
          final cubit = context.read<OrderingCubit>();
          TextEditingController();
          return Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  /// Step
                  Container(
                    margin: const EdgeInsets.all(8.0),
                    height: 19,
                    child: Center(child: Text('Step ${state.step}')),
                  ),

                  /// Date
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: CustomFieldBox(
                      title: 'Start date',
                      child: CustomButtonField(
                        onTap: () {
                          showDatePicker(
                            context: context,
                            initialDate: state.date ?? DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2030),
                          ).then((value) => cubit.changeDate(value!));
                        },
                        icon: Image.asset('assets/icons/calendar.png'),
                        child: Text(
                          DateFormat.yMMMd().format(
                            state.date ?? DateTime.now(),
                          ),
                          style: theme.textTheme.bodySmall,
                        ),
                      ),
                    ),
                  ),

                  /// Sender
                  OrderingDetailsBox(
                    cubit: cubit,
                    state: state,
                    senderOrRecipient: SenderOrRecipient.sender,
                    textEditingControllers: senderCont,
                    title: 'Sender details',
                  ),
                  const SizedBox(height: 16.0),

                  /// Recipient
                  OrderingDetailsBox(
                    cubit: cubit,
                    state: state,
                    senderOrRecipient: SenderOrRecipient.recipient,
                    textEditingControllers: recipeCont,
                    title: 'Recipient address',
                  ),

                  /// Next button
                  Padding(
                    padding: const EdgeInsets.all(20.0).copyWith(bottom: 10.1),
                    child: CustomButton(
                      buttonType: ButtonType.large,
                      child: Text(
                        'Next Step',
                        style: theme.textTheme.labelMedium?.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          try {
                            box.put(
                              'orderingBox',
                              OrderingBox(sender: {
                                'name': toUpper(senderCont['name'].text),
                                'email': senderCont['email'].text,
                                'phone': senderCont['phone'].text,
                                'country': toUpper(senderCont['country'].text),
                                'city': toUpper(senderCont['city'].text),
                                'addressLine': senderCont['addressLine']
                                    .map((e) => toUpper(e.text))
                                    .toList(),
                                'postcode': senderCont['postcode'].text,
                              }, recipient: {
                                'name': toUpper(recipeCont['name'].text),
                                'email': recipeCont['email'].text,
                                'phone': recipeCont['phone'].text,
                                'country': toUpper(recipeCont['country'].text),
                                'city': toUpper(recipeCont['city'].text),
                                'addressLine': recipeCont['addressLine']
                                    .map((e) => e.text)
                                    .toList(),
                                'postcode': recipeCont['postcode'].text,
                              }),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Data Saved')),
                            );
                            cubit.loadLocalData();
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(e.toString())),
                            );
                          }
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

String toUpper(String input) {
  return input.replaceAllMapped(RegExp(r'\b\w'), (match) {
    return match.group(0)!.toUpperCase();
  });
}
