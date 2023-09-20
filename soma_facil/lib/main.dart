import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'global/global_colors.dart';
import 'screens/login/login_screen.dart';
import 'stores/login/login_store.dart';
import 'stores/new_grocery/new_grocery_store.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: 'soma_facil',
    options: DefaultFirebaseOptions.currentPlatform,
  );
  var initialRoute = 'login';

  runApp(MyApp(
    initialRoute: initialRoute,
  ));
}

class MyApp extends StatelessWidget {
  final String initialRoute;
  const MyApp({super.key, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    GlobalColors color = GlobalColors();

    return MultiProvider(
      providers: [
        Provider<LoginStore>(create: (_) => LoginStore()),
        Provider<NewGroceryStore>(create: (_) => NewGroceryStore()),
      ],
      child: MaterialApp(
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          //DefaultCupertinoLocalizations.delegate, //remove with got error
          GlobalCupertinoLocalizations.delegate,
          DefaultWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('pt', 'BR'),
        ],
        theme: ThemeData(
          useMaterial3: true,
          primaryColor: color.orange,
          colorScheme: ColorScheme.fromSwatch().copyWith(
            secondary: color.orange,
          ),
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: color.orange, //<-- SEE HERE
          ),
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: initialRoute,
        routes: {
          'login': (context) => const LoginScreen(),
        },
      ),
    );
  }
}
