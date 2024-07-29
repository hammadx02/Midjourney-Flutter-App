import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
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
    File? file = await PromptRepo.generateImage(event.prompt);
    if (file != null) {
      emit(PromptGenerateImageSuccessState(file));
    } else {
      return emit(PromptGenerateImageErrorState());
    }
  }

  FutureOr<void> promptInitialEvent(
      PromptInitialEvent event, Emitter<PromptState> emit) {
    emit(PromptGenerateImageSuccessState(File('assets/file.png')));
  }
}
