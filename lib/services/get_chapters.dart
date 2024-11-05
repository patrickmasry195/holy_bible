import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:holy_bible/models/chapters_model.dart';
import 'package:http/http.dart' as http;

class GetChapters {
  final String apiKey = '124eac708179873fd6fbaa8d07e440b6';
  final String bibleId = 'b17e246951402e50-01';
  final String baseUrl = 'https://api.scripture.api.bible/v1/bibles';

  Future<List<ChaptersModel>> getChapters(String bookId) async {
    final url = Uri.parse('$baseUrl/$bibleId/books/$bookId/chapters');

    try {
      final response = await http.get(
        url,
        headers: {
          'accept': 'application/json',
          'api-key': apiKey,
        },
      ).timeout(const Duration(seconds: 20));

      if (response.statusCode == 200) {
        return parseChapters(response.body);
      } else {
        log('Failed to load chapters: ${response.statusCode}');
      }
    } on TimeoutException catch (e) {
      log('Request timed out: $e');
    } catch (e) {
      log('Error fetching chapters: $e');
    }

    return [];
  }

  List<ChaptersModel> parseChapters(String responseBody) {
    final parsed = json.decode(responseBody);
    return (parsed['data'] as List)
        .map((json) => ChaptersModel.fromJson(json))
        .toList();
  }
}
