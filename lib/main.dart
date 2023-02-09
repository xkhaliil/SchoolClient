import 'package:flutter/material.dart';
import 'package:schoolclient/data/notification-source.dart';
import 'package:schoolclient/routes.dart';
import 'package:schoolclient/screens/splash-screen/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationSource.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

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
