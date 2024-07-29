part of 'prompt_bloc.dart';

@immutable
sealed class PromptState {}

final class PromptInitial extends PromptState {}

final class PromptGenerateImageLoadState extends PromptState {}

final class PromptGenerateImageErrorState extends PromptState {}

final class PromptGenerateImageSuccessState extends PromptState {
  final Uint8List uint8list;

  PromptGenerateImageSuccessState(this.uint8list);
}
