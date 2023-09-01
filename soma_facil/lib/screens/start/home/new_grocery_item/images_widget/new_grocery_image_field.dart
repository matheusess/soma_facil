import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:soma_facil/global/global_styles.dart';
import 'package:soma_facil/screens/start/home/new_grocery_item/images_widget/new_grocery_image_select_source_widget.dart';
import 'package:soma_facil/screens/start/home/new_grocery_item/text_recognition/new_grocery_text_recognition_screen.dart';
import 'package:soma_facil/stores/new_grocery/new_grocery_store.dart';

import '../../../../../global/global_colors.dart';

class NewGroceryImageField extends StatefulWidget {
  const NewGroceryImageField({super.key});

  @override
  State<NewGroceryImageField> createState() => _NewGroceryImageFieldState();
}

class _NewGroceryImageFieldState extends State<NewGroceryImageField> {
  final GlobalColors color = GlobalColors();
  final GlobalSpaces spaces = GlobalSpaces();

  NewGroceryStore newGroceryStore = NewGroceryStore();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    newGroceryStore = Provider.of<NewGroceryStore>(context);

    /*autorun((_) {
      if (newGroceryStore.itemImage != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const NewGroceryTextRecognitionScreen(),
          ),
        );
      }
    });*/
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        spaces.vSpace,
        InkWell(
          onTap: () => {
            showModalBottomSheet(
              backgroundColor: Colors.white,
              context: context,
              clipBehavior: Clip.antiAlias,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
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
              padding: const EdgeInsets.all(8),
              child: Observer(
                builder: (_) => newGroceryStore.itemImage == null
                    ? _noPhoto()
                    : _hasPhoto(),
              ),
            ),
          ),
        ),
        Observer(builder: (_) {
          return TextButton(
            onPressed: newGroceryStore.imageClear,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.delete_forever,
                  color: color.red,
                ),
                Text(
                  'Excluir imagem',
                  style: GoogleFonts.nunito(
                    textStyle: TextStyle(
                      color: color.darkGrey,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }

  Widget _noPhoto() {
    return Icon(
      Icons.add_a_photo,
      size: 38,
      color: color.darkGrey,
    );
  }

  Widget _hasPhoto() {
    return Image.file(
      newGroceryStore.itemImage!,
      scale: .5,
    );
  }
}
