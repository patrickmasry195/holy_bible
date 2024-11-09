// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapter_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ChapterModelAdapter extends TypeAdapter<ChapterModel> {
  @override
  final int typeId = 2;

  @override
  ChapterModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ChapterModel(
      id: fields[0] as String,
      bibleId: fields[1] as String,
      number: fields[2] as String,
      bookId: fields[3] as String,
      reference: fields[4] as String,
      verseCount: fields[5] as int,
      content: fields[6] as String,
      nextChapter: fields[7] as ChapterModel?,
      previousChapter: fields[8] as ChapterModel?,
    );
  }

  @override
  void write(BinaryWriter writer, ChapterModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.bibleId)
      ..writeByte(2)
      ..write(obj.number)
      ..writeByte(3)
      ..write(obj.bookId)
      ..writeByte(4)
      ..write(obj.reference)
      ..writeByte(5)
      ..write(obj.verseCount)
      ..writeByte(6)
      ..write(obj.content)
      ..writeByte(7)
      ..write(obj.nextChapter)
      ..writeByte(8)
      ..write(obj.previousChapter);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChapterModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
