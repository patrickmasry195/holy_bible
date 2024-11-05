import 'dart:convert';

class ChaptersModel {
  final String id;
  final String bibleId;
  final String bookId;
  final String number;
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
