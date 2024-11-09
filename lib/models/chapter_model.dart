import 'package:hive/hive.dart';

part 'chapter_model.g.dart';

@HiveType(typeId: 2)
class ChapterModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String bibleId;
  @HiveField(2)
  final String number;
  @HiveField(3)
  final String bookId;
  @HiveField(4)
  final String reference;
  @HiveField(5)
  final int verseCount;
  @HiveField(6)
  final String content;
  @HiveField(7)
  ChapterModel? nextChapter;
  @HiveField(8)
  ChapterModel? previousChapter;

  ChapterModel({
    required this.id,
    required this.bibleId,
    required this.number,
    required this.bookId,
    required this.reference,
    required this.verseCount,
    required this.content,
    this.nextChapter,
    this.previousChapter,
  });

  factory ChapterModel.fromJson(Map<String, dynamic> json) {
    return ChapterModel(
      id: json['id'] ?? '',
      bibleId: json['bibleId'] ?? '',
      number: json['number'] ?? '',
      bookId: json['bookId'] ?? '',
      reference: json['reference'] ?? '',
      verseCount: json['verseCount'] ?? 0,
      content: json['content'] ?? '',
    );
  }
}
