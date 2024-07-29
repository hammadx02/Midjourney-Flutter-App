import 'package:flutter/material.dart';

class CreatePromptScreen extends StatefulWidget {
  const CreatePromptScreen({super.key});

  @override
  State<CreatePromptScreen> createState() => _CreatePromptScreenState();
}

class _CreatePromptScreenState extends State<CreatePromptScreen> {
  TextEditingController controller = TextEditingController();

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
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                width: double.maxFinite,
                color: Colors.deepPurple,
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
                        borderSide: const BorderSide(color: Colors.deepPurple),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 48,
                    width: double.maxFinite,
                    child: ElevatedButton.icon(
                      style: ButtonStyle(
                        backgroundColor:
                            WidgetStateProperty.all(Colors.deepPurple),
                      ),
                      onPressed: () {},
                      icon: const Icon(Icons.generating_tokens),
                      label: const Text("Generate"),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
