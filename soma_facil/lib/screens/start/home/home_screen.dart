import 'package:flutter/material.dart';

import '../../../global/global_colors.dart';
import 'new_grocery/new_grocery_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalColors color = GlobalColors();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Text(
              'TESTE',
              style: TextStyle(color: color.black),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const NewGroceryScreen()),
        ),
        backgroundColor: color.blueGreen,
        child: const Icon(Icons.add),
      ),
    );
  }
}
