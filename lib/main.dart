import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:lab2_flutter/firebase_options.dart';

import 'screens/joke_type_view.dart';
import 'package:provider/provider.dart';
import 'services/favourites_provider.dart';

void main() async {
  await dotenv.load();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
  final vapidKey = dotenv.env['VAPID_KEY'];
  final token = await messaging.getToken(vapidKey: vapidKey);
  //print(token);
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FavoritesProvider()),
      ],
      child: const JokesApp(),
    ),);
}

class JokesApp extends StatelessWidget {
  const JokesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random Jokes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
        fontFamily: 'Roboto',
        textTheme: TextTheme(
          displayLarge: const TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.blue),
          titleLarge: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),
          bodyLarge: TextStyle(fontSize: 14.0, color: Colors.grey[700]),
          bodyMedium: TextStyle(fontSize: 12.0, color: Colors.grey[600]),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
          elevation: 4,
          titleTextStyle: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        buttonTheme: const ButtonThemeData(
          buttonColor: Colors.blue,
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: JokeTypeView(),
    );
  }
}