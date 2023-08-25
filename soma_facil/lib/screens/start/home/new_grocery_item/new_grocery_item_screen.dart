import 'package:flutter/material.dart';

class NewGroceryItemScreen extends StatefulWidget {
  const NewGroceryItemScreen({super.key});

  @override
  State<NewGroceryItemScreen> createState() => _NewGroceryItemScreenState();
}

class _NewGroceryItemScreenState extends State<NewGroceryItemScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('teste'),
      ),
    );
  }
}
