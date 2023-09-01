import 'package:flutter/material.dart';

class NewGroceryTextRecognitionScreen extends StatefulWidget {
  const NewGroceryTextRecognitionScreen({super.key});

  @override
  State<NewGroceryTextRecognitionScreen> createState() =>
      _NewGroceryTextRecognitionScreenState();
}

class _NewGroceryTextRecognitionScreenState
    extends State<NewGroceryTextRecognitionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Selecione o texto'),
      ),
      body: const Center(),
    );
  }
}
