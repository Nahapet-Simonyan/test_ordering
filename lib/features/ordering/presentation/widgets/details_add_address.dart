// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:email_validator/email_validator.dart';

// Project imports:
import 'package:test_ordering/components/components.dart';
import 'package:test_ordering/config/theme/colors.dart';
import 'package:test_ordering/core/enum.dart';
import 'package:test_ordering/features/ordering/ordering.dart';

class DetailsAddAddress extends StatelessWidget {
  const DetailsAddAddress({
    super.key,
    required this.senderOrRecipient,
    required this.textControllers,
    this.editing = true,
  });

  final SenderOrRecipient senderOrRecipient;
  final Map<String, dynamic> textControllers;
  final bool? editing;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderingCubit, OrderingState>(
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Full name
            CustomFieldBox(
              title: 'Full name*',
              child: CustomTextField(
                controller: textControllers['name'],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Name is required';
                  }
                  if (value.length < 6) {
                    return 'Enter full name';
                  }
                  return null;
                },
                icon: Image.asset('assets/icons/user.png'),
              ),
            ),
            const SizedBox(height: 12.0),

            /// Email
            CustomFieldBox(
              title: 'Email*',
              child: CustomTextField(
                controller: textControllers['email'],
                validator: (value) {
                  if (value != null && !EmailValidator.validate(value)) {
                    return 'Enter a valid email';
                  }
                  return null;
                },
                icon: Image.asset('assets/icons/email.png'),
              ),
            ),
            const SizedBox(height: 12.0),

            /// Phone number
            CustomFieldBox(
              title: 'Phone number*',
              child: CustomTextField(
                controller: textControllers['phone'],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Phone number is required';
                  }
                  if (value.length < 8) {
                    return 'Enter valid phone number';
                  }
                  return null;
                },
                icon: Image.asset('assets/icons/phone.png'),
              ),
            ),
            const SizedBox(height: 12.0),

            /// Country
            CustomFieldBox(
              title: 'Country*',
              child: CustomTextField(
                controller: textControllers['country'],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Country is required';
                  }
                  return null;
                },
                icon: Image.asset('assets/icons/country.png'),
              ),
            ),
            const SizedBox(height: 12.0),

            /// City
            CustomFieldBox(
              title: 'City*',
              child: CustomTextField(
                controller: textControllers['city'],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'City is required';
                  }
                  return null;
                },
                icon: Image.asset('assets/icons/city.png'),
              ),
            ),
            const SizedBox(height: 12.0),

            /// Address line
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: (senderOrRecipient == SenderOrRecipient.sender)
                  ? state.senderAddressLine
                  : state.recipientAddressLine,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomFieldBox(
                      title: 'Address line ${index + 1}*',
                      child: CustomTextField(
                        controller: textControllers['addressLine'][index],
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Address is required';
                          }
                          if (value.length < 6) {
                            return 'Enter valid address';
                          }
                          return null;
                        },
                        icon: Image.asset('assets/icons/address.png'),
                      ),
                    ),
                    const SizedBox(height: 12.0),
                  ],
                );
              },
            ),

            /// Add address line+
            InkWell(
              onTap: () {
                context.read<OrderingCubit>().addAddressLine(senderOrRecipient);
                textControllers['addressLine'].add(TextEditingController());
              },
              child: Text(
                'Add address line +',
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: AppColors.orange,
                    ),
              ),
            ),
            const SizedBox(height: 20.0),

            /// Postcode
            CustomFieldBox(
              title: 'Postcode*',
              child: CustomTextField(
                controller: textControllers['postcode'],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Address is required';
                  }
                  return null;
                },
                icon: Image.asset(
                  'assets/icons/postcode.png',
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
