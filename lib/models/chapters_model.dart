import 'dart:convert';
import 'package:hive/hive.dart';

part 'chapters_model.g.dart';

@HiveType(typeId: 1)
class ChaptersModel {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String bibleId;

  @HiveField(2)
  final String bookId;

  @HiveField(3)
  final String number;

  @HiveField(4)
  final String reference;

  ChaptersModel({
    required this.id,
    required this.bibleId,
    required this.bookId,
    required this.number,
    required this.reference,
  });

  factory ChaptersModel.fromJson(Map<String, dynamic> json) {
    return ChaptersModel(
      id: json['id'] as String,
      bibleId: json['bibleId'] as String,
      bookId: json['bookId'] as String,
      number: json['number'] as String,
      reference: json['reference'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'bibleId': bibleId,
      'bookId': bookId,
      'number': number,
      'reference': reference,
    };
  }
}

List<ChaptersModel> parseChapters(String responseBody) {
  final parsed = json.decode(responseBody);
  return (parsed['data'] as List)
      .map((json) => ChaptersModel.fromJson(json))
      .toList();
}
