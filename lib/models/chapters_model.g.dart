// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapters_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ChaptersModelAdapter extends TypeAdapter<ChaptersModel> {
  @override
  final int typeId = 1;

  @override
  ChaptersModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ChaptersModel(
      id: fields[0] as String,
      bibleId: fields[1] as String,
      bookId: fields[2] as String,
      number: fields[3] as String,
      reference: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ChaptersModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.bibleId)
      ..writeByte(2)
      ..write(obj.bookId)
      ..writeByte(3)
      ..write(obj.number)
      ..writeByte(4)
      ..write(obj.reference);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChaptersModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
