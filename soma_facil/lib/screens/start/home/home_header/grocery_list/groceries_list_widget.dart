import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:soma_facil/global/global_colors.dart';

import 'package:soma_facil/stores/grocery/grocery_store.dart';

class GroceriesListWidget extends StatefulWidget {
  const GroceriesListWidget({super.key});

  @override
  State<GroceriesListWidget> createState() => _GroceriesListWidgetState();
}

class _GroceriesListWidgetState extends State<GroceriesListWidget> {
  final GlobalColors color = GlobalColors();

  GroceryStore groceryStore = GroceryStore();
  User? user = FirebaseAuth.instance.currentUser;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    groceryStore = Provider.of<GroceryStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Observer(builder: (_) {
        if (groceryStore.isLoading == true) {
          return _isLoading();
        }
        if (groceryStore.isLoading == false &&
            groceryStore.groceriesLis.isEmpty) {
          return _hasNoData();
        }
        if (groceryStore.isLoading == false &&
            groceryStore.groceriesLis.isNotEmpty) {
          return _hasData();
        } else {
          return const Text('Error');
        }
      });
    });
  }

  Widget _isLoading() {
    return Center(
      child: CircularProgressIndicator(
        color: color.darkOrange,
      ),
    );
  }

  Widget _hasNoData() {
    return const Center(child: Text('Parece que não tem compras'));
  }

  Widget _hasData() {
    return const Center(child: Text('Tem dados sim!'));
  }
}
