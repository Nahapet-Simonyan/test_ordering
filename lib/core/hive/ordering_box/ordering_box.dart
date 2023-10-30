import 'package:hive/hive.dart';

part 'ordering_box.g.dart';

@HiveType(typeId: 1)
class OrderingBox {
  OrderingBox({required this.sender, required this.recipient});

  @HiveField(0)
  Map<String, dynamic> sender;

  @HiveField(1)
  Map<String, dynamic> recipient;

}