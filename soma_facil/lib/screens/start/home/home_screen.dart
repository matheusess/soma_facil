import 'package:flutter/material.dart';
import 'package:soma_facil/screens/start/home/grocery_list/groceries_list_widget.dart';
import 'package:soma_facil/screens/start/home/home_header/home_header_widget.dart';

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
      appBar: AppBar(
        title: const HomeHeaderWidget(),
        automaticallyImplyLeading: false,
        toolbarHeight: 148,
      ),
      body: const GroceriesListWidget(),
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const NewGroceryScreen()),
        ),
        backgroundColor: color.darkOrange,
        child: const Icon(Icons.add),
      ),
    );
  }
}
