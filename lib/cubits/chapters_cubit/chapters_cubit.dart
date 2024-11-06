import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:holy_bible/models/chapters_model.dart';
import 'package:holy_bible/services/get_chapters.dart';

part 'chapters_state.dart';

class ChaptersCubit extends Cubit<ChaptersState> {
  final GetChapters getChapters;

  ChaptersCubit(this.getChapters) : super(ChaptersInitialState());

  Future<void> fetchChapters(String bookId) async {
    emit(ChaptersLoadingState());
    try {
      final chapters = await getChapters.getChaptersByBook(bookId);
      log('Fetched chapters : $chapters');
      emit(ChaptersSuccessState(chapters));
    } catch (e) {
      emit(ChaptersFailureState(e.toString()));
    }
  }
}
