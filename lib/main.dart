import 'package:flutter/material.dart';
import 'package:schoolclient/routes.dart';
import 'package:schoolclient/screens/splash-screen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: const Color(0xFFEEEEEE),
        primaryColor: const Color(0xFFEEEEEE),
      ),
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}
