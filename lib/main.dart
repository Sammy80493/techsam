import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sammyajax/helper/firebase_auth_helper.dart';
import 'package:sammyajax/helper/firebase_options.dart';
import 'package:sammyajax/provider/shop_provider.dart';
import 'package:sammyajax/provider/validation_provider.dart';
import 'package:sammyajax/screen/home/home.dart';
import 'package:sammyajax/screen/home/welcome.dart';
import 'package:sammyajax/theme/light_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ShopProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => Validations(),
        )
      ],
      builder: (context, child) => const MyApp(),
    ),
  );
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: light_theme,
      darkTheme: light_theme,
      themeMode: ThemeMode.system,
      home: StreamBuilder(
        stream: FirebaseAuthOps.firebaseAuthOps.getAuthState,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const Home();
          }
          return const Welcome();
        },
      ),
    );
  }
}
