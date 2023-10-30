// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_ordering/core/enum.dart';
import 'package:test_ordering/core/hive/ordering_box/ordering_box.dart';
import 'package:test_ordering/features/ordering/domain/entities/entities.dart';
import 'package:test_ordering/main.dart';

// Project imports:
import 'ordering_state.dart';

class OrderingCubit extends Cubit<OrderingState> {
  OrderingCubit() : super(const OrderingState()) {
    init();
    loadLocalData();
  }

  init() {
    emit(
      state.copyWith(
        date: DateTime.now(),
        senderDetailsType: DetailsType.addAddress,
        recipientDetailsType: DetailsType.addAddress,
      ),
    );
  }

  changeDate(DateTime date) => emit(state.copyWith(date: date));

  changeDetailsType(DetailsType type, SenderOrRecipient senderOrRecipient) {
    (senderOrRecipient == SenderOrRecipient.sender)
        ? emit(state.copyWith(senderDetailsType: type))
        : emit(state.copyWith(recipientDetailsType: type));
  }

  addAddressLine(SenderOrRecipient senderOrRecipient) {
    (senderOrRecipient == SenderOrRecipient.sender)
        ? emit(state.copyWith(senderAddressLine: state.senderAddressLine + 1))
        : emit(state.copyWith(
            recipientAddressLine: state.recipientAddressLine + 1));
  }

  loadLocalData() {
    OrderingBox orderingBox = box.get('orderingBox');
    emit(
      state.copyWith(
        sender: SenderDetailsEntity(
          fullName: orderingBox.sender['name'] ?? '',
          email: orderingBox.sender['email'] ?? '',
          phoneNumber: orderingBox.sender['phoneNumber'] ?? '',
          country: orderingBox.sender['country']  ?? '',
          city: orderingBox.sender['city']  ?? '',
          address: orderingBox.sender['addressLine'],
          postCode: orderingBox.sender['postcode'].toString(),
        ),
        recipient: RecipientAddressEntity(
          fullName: orderingBox.recipient['name'] ?? '',
          email: orderingBox.recipient['email'] ?? '',
          phoneNumber: orderingBox.recipient['phoneNumber'] ?? '',
          country: orderingBox.recipient['country'] ?? '',
          city: orderingBox.recipient['city'] ?? '',
          address: orderingBox.recipient['addressLine'],
          postCode: orderingBox.recipient['postcode'].toString(),
        ),
      ),
    );
  }

  nextStep() => emit(state.copyWith(step: state.step + 1));
}
