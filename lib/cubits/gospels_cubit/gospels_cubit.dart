import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:holy_bible/models/gospels_model.dart';
import 'package:holy_bible/services/get_gospels.dart';

part 'gospels_state.dart';

class GospelsCubit extends Cubit<GospelsState> {
  final GetGospels getGospels;

  GospelsCubit(this.getGospels) : super(GospelsInitialState());

  Future<void> fetchGospels(String testamentType) async {
    emit(GospelsLoadingState());
    try {
      final gospels = await getGospels.getGospelsByTestament(testamentType);
      log('Fetched gospels: $gospels');
      emit(GospelsSuccessState(gospels));
    } catch (e) {
      emit(GospelsFailureState(e.toString()));
    }
  }
}
