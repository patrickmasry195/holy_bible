import 'dart:developer';
import 'package:hive/hive.dart';
import 'package:holy_bible/models/chapter_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GetChapter {
  final String apiKey = '124eac708179873fd6fbaa8d07e440b6';
  final String bibleId = 'b17e246951402e50-01';
  final String apiUrl = 'https://api.scripture.api.bible/v1/bibles';

  Future<ChapterModel> getChapterById(String chapterId) async {
    final box = await Hive.openBox<ChapterModel>('chapters');

    if (box.containsKey(chapterId)) {
      log('Returning chapter from local storage');
      return box.get(chapterId)!;
    }

    final url = Uri.parse('$apiUrl/$bibleId/chapters/$chapterId');
    final headers = {
      'api-key': apiKey,
      'Accept': 'application/json',
    };

    try {
      final response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        final Map<String, dynamic> chapterJson = jsonDecode(response.body);

        if (chapterJson['data'] != null) {
          log("Received JSON data: ${chapterJson['data']}");

          var nextChapter = chapterJson['data']['next'];
          var previousChapter = chapterJson['data']['previous'];

          if (nextChapter != null) {
            log('Next Chapter: $nextChapter');
          } else {
            log('Next Chapter: Not available');
          }

          if (previousChapter != null) {
            log('Previous Chapter: $previousChapter');
          } else {
            log('Previous Chapter: Not available');
          }

          final chapterModel = ChapterModel.fromJson(chapterJson['data']);

          chapterModel.nextChapter =
              nextChapter != null ? ChapterModel.fromJson(nextChapter) : null;
          chapterModel.previousChapter = previousChapter != null
              ? ChapterModel.fromJson(previousChapter)
              : null;

          await box.put(chapterId, chapterModel);

          return chapterModel;
        } else {
          log('Error: "data" key not found or null in the response');
          throw Exception('Invalid response format');
        }
      } else {
        log('Failed to load chapter. Status code: ${response.statusCode}');
        log('Response body: ${response.body}');
        throw Exception('Failed to load chapter');
      }
    } catch (e) {
      log('Error: $e');
      throw Exception('Error: $e');
    }
  }
}
