import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:soma_facil/global/global_colors.dart';
import 'package:soma_facil/global/global_rounded_icon_button.dart';
import 'package:soma_facil/stores/new_grocery/new_grocery_store.dart';

class NewGroceryImageSelectSourceWidget extends StatefulWidget {
  const NewGroceryImageSelectSourceWidget({super.key});

  @override
  State<NewGroceryImageSelectSourceWidget> createState() =>
      _NewGroceryImageSelectSourceWidgetState();
}

class _NewGroceryImageSelectSourceWidgetState
    extends State<NewGroceryImageSelectSourceWidget> {
  final GlobalColors color = GlobalColors();
  final ImagePicker picker = ImagePicker();

  NewGroceryStore newGroceryStore = NewGroceryStore();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    newGroceryStore = Provider.of<NewGroceryStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 8, bottom: 42),
      color: color.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 24, right: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Foto do produto',
                  style: GoogleFonts.nunito(
                    textStyle: const TextStyle(
                      color: Color.fromARGB(221, 0, 0, 0),
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () =>
                      Navigator.of(context, rootNavigator: true).pop(),
                  icon: const Icon(
                    Icons.close_rounded,
                    color: Color.fromARGB(221, 77, 77, 77),
                    size: 20,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  children: [
                    GlobalRoundedIconButton(
                      backgroundColor: color.blueGreen,
                      icon: const Icon(
                        Icons.camera_alt_rounded,
                        size: 24,
                      ),
                      onPressed: () {
                        _getImage(ImageSource.camera);
                        Navigator.pop(context);
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Câmera',
                      style: GoogleFonts.nunito(
                        textStyle: const TextStyle(
                          color: Color.fromARGB(221, 0, 0, 0),
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  GlobalRoundedIconButton(
                    backgroundColor: color.blueGreen,
                    icon: const Icon(
                      Icons.image_rounded,
                      size: 24.0,
                    ),
                    onPressed: () {
                      _getImage(ImageSource.gallery);
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Galeria',
                    style: GoogleFonts.nunito(
                      textStyle: const TextStyle(
                        color: Color.fromARGB(221, 0, 0, 0),
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  _getImage(ImageSource source) async {
    final image = await picker.pickImage(source: source);

    if (image != null) {
      CroppedFile? cropped = (await ImageCropper().cropImage(
        sourcePath: image.path,
        aspectRatio: const CropAspectRatio(ratioX: 10, ratioY: 4),
        compressQuality: 20,
        cropStyle: CropStyle.rectangle,
        compressFormat: ImageCompressFormat.jpg,
      ));

      if (cropped != null) {
        newGroceryStore.setImageFile(File(cropped.path));
      }
    }
  }
}
