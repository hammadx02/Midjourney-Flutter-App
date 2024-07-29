import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

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
    List<int>? bytes = await PromptRepo.generateImage(event.prompt);
    if (bytes != null) {
      emit(
        PromptGenerateImageSuccessState(
          Uint8List.fromList(bytes),
        ),
      );
    } else {
      return emit(PromptGenerateImageErrorState());
    }
  }

  FutureOr<void> promptInitialEvent(
      PromptInitialEvent event, Emitter<PromptState> emit) async {
    Uint8List bytes = await File('assets/file.png').readAsBytes();
    emit(PromptGenerateImageSuccessState(bytes));
  }
}
