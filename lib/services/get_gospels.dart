import 'dart:convert';
import 'package:holy_bible/models/gospels_model.dart';
import 'package:http/http.dart' as http;

class GetGospels {
  final String apiKey = '124eac708179873fd6fbaa8d07e440b6';
  final String bibleId = 'b17e246951402e50-01';
  final String apiUrl = 'https://api.scripture.api.bible/v1/bibles';

  Future<List<GospelsModel>> getGospelsByTestament(String testamentType) async {
    final url = Uri.parse('$apiUrl/$bibleId/books');
    final headers = {'api-key': apiKey};

    try {
      final response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        final List booksJson = jsonDecode(response.body)['data'];

        final gospels =
            booksJson.map((json) => GospelsModel.fromJson(json)).toList();
        final filteredGospels = gospels.where((gospel) {
          return (testamentType == 'Old Testament' &&
                  _isOldTestament(gospel.id)) ||
              (testamentType == 'New Testament' && !_isOldTestament(gospel.id));
        }).toList();

        return filteredGospels;
      } else {
        throw Exception('Failed to load books');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  bool _isOldTestament(String bookId) {
    const oldTestamentIds = [
      'GEN',
      'EXO',
      'LEV',
      'NUM',
      'DEU',
      'JOS',
      'JDG',
      'RUT',
      '1SA',
      '2SA',
      '1KI',
      '2KI',
      '1CH',
      '2CH',
      'EZR',
      'NEH',
      'EST',
      'JOB',
      'PSA',
      'PRO',
      'ECC',
      'SNG',
      'ISA',
      'JER',
      'LAM',
      'EZK',
      'DAN',
      'HOS',
      'JOL',
      'AMO',
      'OBA',
      'JON',
      'MIC',
      'NAM',
      'HAB',
      'ZEP',
      'HAG',
      'ZEC',
      'MAL',
    ];
    return oldTestamentIds.contains(bookId);
  }
}
