import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:soma_facil/global/global_colors.dart';
import 'package:soma_facil/global/global_styles.dart';
import 'package:soma_facil/stores/new_grocery/new_grocery_store.dart';

import 'new_grocery_checkout/new_grocery_checkout_screen.dart';

class NewGroceryBottomButtons extends StatefulWidget {
  const NewGroceryBottomButtons({super.key});

  @override
  State<NewGroceryBottomButtons> createState() =>
      _NewGroceryBottomButtonsState();
}

class _NewGroceryBottomButtonsState extends State<NewGroceryBottomButtons> {
  final GlobalColors color = GlobalColors();
  final GlobalSpaces spaces = GlobalSpaces();

  NewGroceryStore newGroceryStore = NewGroceryStore();
  User? user = FirebaseAuth.instance.currentUser;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    newGroceryStore = Provider.of<NewGroceryStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      /*decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 9,
            offset: const Offset(6, 0), // changes position of shadow
          ),
        ],
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: color.cardBackground,
            width: 1,
          ),
        ),
      ),*/
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: 42,
        top: 16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FloatingActionButton(
            heroTag: "backButton",
            onPressed: () => Navigator.pop(
              context,
            ),
            backgroundColor: color.darkOrange,
            child: const Icon(
              Icons.arrow_back,
            ),
          ),
          Observer(
            builder: (_) => FloatingActionButton.extended(
              elevation: newGroceryStore.isCheckoutValid ? 6 : 0,
              heroTag: "finishButton",
              onPressed: () =>
                  newGroceryStore.isCheckoutValid ? _modalRoute() : null,
              backgroundColor: newGroceryStore.isCheckoutValid
                  ? color.blueGreen
                  : color.lightGrey,
              icon: const Icon(Icons.checklist_rtl),
              label: Text(
                'Finalizar',
                style: GoogleFonts.nunito(
                  textStyle: TextStyle(
                    color: color.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _modalRoute() {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              color: color.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10, top: 10),
                      child: IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: Icon(
                          Icons.close,
                          color: color.black,
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  padding: const EdgeInsets.only(
                    left: 24,
                    right: 24,
                    top: 4,
                    bottom: 30,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Finalizar compra?',
                        style: GoogleFonts.nunito(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                      ),
                      spaces.vSpace2,
                      Text(
                        'Você deseja finalizar a compra ou conferir no caixa?',
                        overflow: TextOverflow.clip,
                        maxLines: 4,
                        softWrap: true,
                        style: GoogleFonts.nunito(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                      spaces.vSpace3,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          FloatingActionButton.extended(
                            backgroundColor: color.blue,
                            onPressed: () => {
                              Navigator.pop(context),
                              newGroceryStore.createNewGrocery(uId: user?.uid)
                            },
                            elevation: 0,
                            label: Text(
                              'Finalizar',
                              style: GoogleFonts.nunito(
                                color: color.white,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          spaces.hSpace3,
                          FloatingActionButton.extended(
                            backgroundColor: color.green,
                            onPressed: () => {
                              Navigator.of(context).pop(),
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const NewGroceryCheckoutScreen(),
                                ),
                              )
                            },
                            elevation: 0,
                            label: Text(
                              'Conferir',
                              style: GoogleFonts.nunito(
                                color: color.white,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
