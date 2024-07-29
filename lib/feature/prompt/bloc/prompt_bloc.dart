import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';
import 'package:midjourney_flutter_app/feature/prompt/repos/prompt_repo.dart';

part 'prompt_event.dart';
part 'prompt_state.dart';

class PromptBloc extends Bloc<PromptEvent, PromptState> {
  PromptBloc() : super(PromptInitial()) {
    on<PromptEnteredEvent>(promptEnteredEvent);
    on<PromptInitialEvent>(promptInitialEvent);
  }

  FutureOr<void> promptEnteredEvent(
      PromptEnteredEvent event, Emitter<PromptState> emit) async {
    emit(PromptGenerateImageLoadState());
    Uint8List? bytes = await PromptRepo.generateImage(event.prompt);
    if (bytes != null) {
      emit(PromptGenerateImageSuccessState(bytes));
    } else {
      emit(PromptGenerateImageErrorState());
    }
  }

  FutureOr<void> promptInitialEvent(
      PromptInitialEvent event, Emitter<PromptState> emit) async {
    try {
      ByteData data = await rootBundle.load('assets/file.png');
      Uint8List bytes = data.buffer.asUint8List();
      emit(PromptGenerateImageSuccessState(bytes));
    } catch (e) {
      emit(PromptGenerateImageErrorState());
    }
  }
}
