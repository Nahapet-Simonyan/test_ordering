import 'package:equatable/equatable.dart';

class SenderDetailsEntity extends Equatable {
  final String fullName;
  final String email;
  final String phoneNumber;
  final String country;
  final String city;
  final List address;
  final String postCode;

  const SenderDetailsEntity({
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.country,
    required this.city,
    required this.address,
    required this.postCode,
  });

  @override
  List<Object?> get props => [
        fullName,
        email,
        phoneNumber,
        country,
        city,
        address,
        postCode,
      ];
}
