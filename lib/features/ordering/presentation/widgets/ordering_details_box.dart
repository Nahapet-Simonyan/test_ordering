// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:test_ordering/components/components.dart';
import 'package:test_ordering/config/theme/colors.dart';
import 'package:test_ordering/core/enum.dart';
import 'package:test_ordering/features/ordering/ordering.dart';

class OrderingDetailsBox extends StatelessWidget {
  const OrderingDetailsBox({
    super.key,
    required this.cubit,
    required this.state,
    required this.senderOrRecipient,
    required this.textEditingControllers,
    required this.title,
  });

  final OrderingCubit cubit;
  final OrderingState state;
  final SenderOrRecipient senderOrRecipient;
  final Map<String, dynamic> textEditingControllers;
  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final detailsType = senderOrRecipient == SenderOrRecipient.sender
        ? state.senderDetailsType
        : state.recipientDetailsType;
    return Container(
      color: theme.cardColor,
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //Select buttons
          SizedBox(
            height: 69,
            width: MediaQuery.sizeOf(context).width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: theme.textTheme.headlineMedium),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //Add address
                    CustomButton(
                      onTap: () {
                        if (detailsType != DetailsType.addAddress) {
                          cubit.changeDetailsType(
                            DetailsType.addAddress,
                            senderOrRecipient,
                          );
                        }
                      },
                      width: (MediaQuery.sizeOf(context).width - 40 - 7) / 2,
                      buttonType: ButtonType.small,
                      color: detailsType == DetailsType.addAddress
                          ? AppColors.orange
                          : AppColors.gray5,
                      child: Text(
                        'Add address',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: detailsType == DetailsType.addAddress
                              ? AppColors.white
                              : AppColors.gray2,
                        ),
                      ),
                    ),
                    const SizedBox(width: 7),

                    //Select address
                    CustomButton(
                      onTap: () {
                        if (detailsType != DetailsType.selectAddress) {
                          cubit.changeDetailsType(
                            DetailsType.selectAddress,
                            senderOrRecipient,
                          );
                        }
                      },
                      width: (MediaQuery.sizeOf(context).width - 40 - 7) / 2,
                      buttonType: ButtonType.small,
                      color: detailsType == DetailsType.selectAddress
                          ? AppColors.orange
                          : AppColors.gray5,
                      child: Text(
                        'Select address',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: detailsType == DetailsType.selectAddress
                              ? AppColors.white
                              : AppColors.gray2,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20.0),

          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: detailsType == DetailsType.addAddress
                ? DetailsAddAddress(
                    senderOrRecipient: senderOrRecipient,
                    textControllers: textEditingControllers,
                  )
                : DetailsSelectAddress(
                    senderOrRecipient: senderOrRecipient,
                    textEditingControllers: textEditingControllers,
                  ),
          ),
        ],
      ),
    );
  }
}
