//Package imports:
import 'package:equatable/equatable.dart';

// Project imports:
import 'package:test_ordering/core/enum.dart';
import 'package:test_ordering/features/ordering/domain/entities/entities.dart';

class OrderingState extends Equatable {
  final int step;
  final DateTime? date;
  final DetailsType? senderDetailsType;
  final int senderAddressLine;
  final DetailsType? recipientDetailsType;
  final int recipientAddressLine;
  final SenderDetailsEntity sender;
  final RecipientAddressEntity recipient;

  const OrderingState({
    this.step = 1,
    this.date,
    this.senderDetailsType,
    this.senderAddressLine = 1,
    this.recipientDetailsType,
    this.recipientAddressLine = 1,
    this.sender = const SenderDetailsEntity(
      fullName: '',
      email: '',
      phoneNumber: '',
      country: '',
      city: '',
      address: [''],
      postCode: '',
    ),
    this.recipient = const RecipientAddressEntity(
      fullName: '',
      email: '',
      phoneNumber: '',
      country: '',
      city: '',
      address: [''],
      postCode: '',
    ),
  });

  OrderingState copyWith({
    int? step,
    DateTime? date,
    final DetailsType? senderDetailsType,
    final int? senderAddressLine,
    final DetailsType? recipientDetailsType,
    final int? recipientAddressLine,
    final SenderDetailsEntity? sender,
    final RecipientAddressEntity? recipient,
  }) {
    return OrderingState(
      step: step ?? this.step,
      date: date ?? this.date,
      senderDetailsType: senderDetailsType ?? this.senderDetailsType,
      senderAddressLine: senderAddressLine ?? this.senderAddressLine,
      recipientDetailsType: recipientDetailsType ?? this.recipientDetailsType,
      recipientAddressLine: recipientAddressLine ?? this.recipientAddressLine,
      sender: sender ?? this.sender,
      recipient: recipient ?? this.recipient,
    );
  }

  @override
  List<Object?> get props => [
        step,
        date,
        senderDetailsType,
        senderAddressLine,
        recipientDetailsType,
        recipientAddressLine,
        sender,
        recipient,
      ];
}
