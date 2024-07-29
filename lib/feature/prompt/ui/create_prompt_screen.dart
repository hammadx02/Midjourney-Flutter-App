import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:midjourney_flutter_app/feature/prompt/bloc/prompt_bloc.dart';

class CreatePromptScreen extends StatefulWidget {
  const CreatePromptScreen({super.key});

  @override
  State<CreatePromptScreen> createState() => _CreatePromptScreenState();
}

class _CreatePromptScreenState extends State<CreatePromptScreen> {
  TextEditingController controller = TextEditingController();
  final PromptBloc promptBloc = PromptBloc();

  @override
  void initState() {
    promptBloc.add(PromptInitialEvent());
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Image Generator AI 🤖🔥",
        ),
      ),
      body: BlocConsumer<PromptBloc, PromptState>(
        bloc: promptBloc,
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case const (PromptGenerateImageLoadState):
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.deepPurple,
                ),
              );

            case const (PromptGenerateImageErrorState):
              return const Center(
                child: Text(
                  "😢🔧 Oops! Something went wrong",
                ),
              );

            case PromptGenerateImageSuccessState:
              final successState = state as PromptGenerateImageSuccessState;
              return Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: MemoryImage(successState.uint8list),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 240,
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Enter your prompt",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 20),
                          TextField(
                            controller: controller,
                            cursorColor: Colors.deepPurple,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.deepPurple),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            height: 56,
                            width: double.maxFinite,
                            child: ElevatedButton.icon(
                              style: ButtonStyle(
                                shape: WidgetStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                      12.0,
                                    ),
                                  ),
                                ),
                                backgroundColor:
                                    WidgetStateProperty.all(Colors.deepPurple),
                              ),
                              onPressed: () {
                                if (controller.text.isNotEmpty) {
                                  promptBloc.add(
                                    PromptEnteredEvent(prompt: controller.text),
                                  );
                                }
                              },
                              icon: const Icon(Icons.generating_tokens),
                              label: const Text("Generate"),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
