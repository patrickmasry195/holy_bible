part of 'gospels_cubit.dart';

abstract class GospelsState {}

final class GospelsInitialState extends GospelsState {}

final class GospelsLoadingState extends GospelsState {}

final class GospelsSuccessState extends GospelsState {
  final List<GospelsModel> gospels;

  GospelsSuccessState(this.gospels);
}

final class GospelsFailureState extends GospelsState {
  final String errorMessage;

  GospelsFailureState(this.errorMessage);
}
