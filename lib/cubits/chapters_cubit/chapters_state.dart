part of 'chapters_cubit.dart';

abstract class ChaptersState {}

final class ChaptersInitialState extends ChaptersState {}

final class ChaptersLoadingState extends ChaptersState {}

final class ChaptersSuccessState extends ChaptersState {
  final List<ChaptersModel> chapters;

  ChaptersSuccessState(this.chapters);
}

final class ChaptersFailureState extends ChaptersState {
  final String errorMessage;

  ChaptersFailureState(this.errorMessage);
}
