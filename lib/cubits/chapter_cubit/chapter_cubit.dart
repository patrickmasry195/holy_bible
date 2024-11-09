import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:holy_bible/models/chapter_model.dart';
import 'package:holy_bible/services/get_chapter.dart';

part 'chapter_state.dart';

class ChapterCubit extends Cubit<ChapterState> {
  final GetChapter getChapter;

  ChapterCubit(this.getChapter) : super(ChapterInitialState());

  Future<void> fetchChapter(String chapterId) async {
    emit(ChapterLoadingState());
    try {
      final chapter = await getChapter.getChapterById(chapterId);
      log('Fetched chapter: $chapter');
      emit(ChapterSuccessState(chapter));
    } catch (e) {
      emit(ChapterFailureState(e.toString()));
    }
  }
}
