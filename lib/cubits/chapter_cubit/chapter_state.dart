part of 'chapter_cubit.dart';

class ChapterState {}

final class ChapterInitialState extends ChapterState {}

final class ChapterLoadingState extends ChapterState {}

final class ChapterSuccessState extends ChapterState {
  final ChapterModel chapter;

  ChapterSuccessState(this.chapter);
}

final class ChapterFailureState extends ChapterState {
  final String errorMessage;

  ChapterFailureState(this.errorMessage);
}
