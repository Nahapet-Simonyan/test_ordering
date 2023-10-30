// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ordering_box.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OrderingBoxAdapter extends TypeAdapter<OrderingBox> {
  @override
  final int typeId = 1;

  @override
  OrderingBox read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OrderingBox(
      sender: (fields[0] as Map).cast<String, dynamic>(),
      recipient: (fields[1] as Map).cast<String, dynamic>(),
    );
  }

  @override
  void write(BinaryWriter writer, OrderingBox obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.sender)
      ..writeByte(1)
      ..write(obj.recipient);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderingBoxAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
