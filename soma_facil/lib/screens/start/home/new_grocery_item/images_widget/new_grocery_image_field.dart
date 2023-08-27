import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soma_facil/screens/start/home/new_grocery_item/images_widget/new_grocery_image_select_source_widget.dart';
import 'package:soma_facil/stores/new_grocery/new_grocery_store.dart';

import '../../../../../global/global_colors.dart';

class NewGroceryImageField extends StatefulWidget {
  const NewGroceryImageField({super.key});

  @override
  State<NewGroceryImageField> createState() => _NewGroceryImageFieldState();
}

class _NewGroceryImageFieldState extends State<NewGroceryImageField> {
  final GlobalColors color = GlobalColors();
  NewGroceryStore newGroceryStore = NewGroceryStore();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    newGroceryStore = Provider.of<NewGroceryStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
        showModalBottomSheet(
          backgroundColor: Colors.white,
          context: context,
          clipBehavior: Clip.antiAlias,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          builder: (context) {
            return const NewGroceryImageSelectSourceWidget();
          },
        ),
      },
      child: Container(
        height: 96,
        width: double.infinity,
        decoration: BoxDecoration(
          color: color.cardBackground,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Icon(
            Icons.add_a_photo,
            size: 38,
            color: color.darkGrey,
          ),
        ),
      ),
    );
  }
}
