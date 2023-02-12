import 'package:flutter/material.dart';
import 'package:schoolclient/data/notification_source.dart';
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
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final GlobalKey<ScaffoldMessengerState> messengerKey =
      GlobalKey<ScaffoldMessengerState>();

  @override
  void initState() {
    super.initState();
    listenToMessages();
  }

  void listenToMessages() {
    NotificationSource.controller.stream.listen((message) {
      print("new message");
      messengerKey.currentState?.showSnackBar(SnackBar(
        content: Text(message),
        elevation: 6.0,
        duration: const Duration(seconds: 5),
        margin: const EdgeInsets.all(20),
        behavior: SnackBarBehavior.floating,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: const Color(0xFFEEEEEE),
        primaryColor: const Color(0xFFEEEEEE),
      ),
      scaffoldMessengerKey: messengerKey,
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }

  @override
  void dispose() {
    super.dispose();
    NotificationSource.closeStreams();
  }
}
