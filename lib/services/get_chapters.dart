import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:holy_bible/services/get_gospels.dart';
import 'package:http/http.dart' as http;
import 'package:holy_bible/models/chapters_model.dart';

class GetChapters {
  final String apiKey = '124eac708179873fd6fbaa8d07e440b6';
  final String bibleId = 'b17e246951402e50-01';
  final String apiUrl = 'https://api.scripture.api.bible/v1/bibles';

  Future<List<ChaptersModel>> getAllChaptersByTestament(
      String testamentType) async {
    final getGospels = GetGospels();
    final books = await getGospels.getGospelsByTestament(testamentType);
    List<ChaptersModel> allChapters = [];

    for (var book in books) {
      final chapters = await getChaptersByBook(book.id);
      allChapters.addAll(chapters);
    }

    return allChapters;
  }

  Future<List<ChaptersModel>> getChaptersByBook(String bookId,
      {int retries = 3, int delay = 2}) async {
    final url = Uri.parse('$apiUrl/$bibleId/books/$bookId/chapters');
    final headers = {'api-key': apiKey};
    var box = await Hive.openBox<ChaptersModel>('chapters_$bookId');
    final storedData = box.values.toList();

    if (storedData.isNotEmpty) {
      return storedData;
    }

    int attempt = 0;
    while (attempt < retries) {
      try {
        final response = await http.get(url, headers: headers);
        if (response.statusCode == 200) {
          final List chaptersJson = jsonDecode(response.body)['data'];
          final chapters =
              chaptersJson.map((json) => ChaptersModel.fromJson(json)).toList();
          await box.addAll(chapters);
          return chapters;
        } else {
          throw Exception('Failed to load chapters');
        }
      } catch (e) {
        attempt++;
        if (attempt < retries) {
          await Future.delayed(Duration(seconds: delay));
        } else {
          throw Exception(
              'Failed to load chapters after $retries attempts: $e');
        }
      }
    }
    throw Exception('Failed to load chapters');
  }
}
