// Flutter imports:
import 'package:flutter/material.dart';

//Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:test_ordering/components/components.dart';
import 'package:test_ordering/config/theme/colors.dart';
import 'package:test_ordering/core/enum.dart';
import 'package:test_ordering/features/ordering/presentation/manager/manager.dart';

class DetailsSelectAddress extends StatelessWidget {
  const DetailsSelectAddress({
    super.key,
    required this.senderOrRecipient,
    required this.textEditingControllers,
  });

  final SenderOrRecipient senderOrRecipient;
  final Map<String, dynamic> textEditingControllers;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<OrderingCubit, OrderingState>(
      builder: (context, state) {
        final cubit = context.read<OrderingCubit>();
        final sender = state.sender;
        final recipient = state.recipient;

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 44,
              child: CustomTextField(
                controller: textEditingControllers['search'],
                icon: Image.asset('assets/icons/search.png'),
                hintText: 'Search',
                hintStyle: theme.textTheme.bodySmall?.copyWith(
                  color: AppColors.gray1,
                ),
              ),
            ),
            const SizedBox(height: 12.0),
            Container(
              decoration: BoxDecoration(
                color: theme.primaryColor,
                borderRadius: BorderRadius.circular(12.0),
              ),
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          senderOrRecipient == SenderOrRecipient.sender
                              ? sender.fullName
                              : recipient.fullName,
                          style: theme.textTheme.headlineSmall?.copyWith(
                            color: theme.cardColor,
                          ),
                        ),
                        const SizedBox(height: 4.0),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount:
                              senderOrRecipient == SenderOrRecipient.sender
                                  ? sender.address.length
                                  : recipient.address.length,
                          itemBuilder: (context, index) {
                            return Text(
                              senderOrRecipient == SenderOrRecipient.sender
                                  ? '${sender.country}, '
                                      '${sender.city}, '
                                      '${sender.address[index]}, '
                                      '${sender.postCode}'
                                  : '${recipient.country}, '
                                      '${recipient.city}, '
                                      '${recipient.address[index]}, '
                                      '${recipient.postCode}',
                              overflow: TextOverflow.ellipsis,
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: theme.dialogBackgroundColor,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      cubit.changeDetailsType(
                        DetailsType.addAddress,
                        senderOrRecipient,
                      );
                    },
                    child: Image.asset('assets/icons/edit.png'),
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
