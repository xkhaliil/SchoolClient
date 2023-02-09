import 'dart:async';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:schoolclient/firebase_options.dart';

class NotificationSource {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String? token;

  // Cuando la app esta en segundo plano
  static Future _onBackgroundHandler(RemoteMessage message) async {
    print('onBackground Handler: ${message.messageId}');
    print(message.data);
  }

  // Cuando la app ya esta abierta
  static Future _onMessageHandler(RemoteMessage message) async {
    print('onMessage Handler: ${message.messageId}');
    print(message.data);
  }

  // Cuando abres la app desde la notificacion
  static Future _onMessageOpenApp(RemoteMessage message) async {
    print('onMessageOpenApp Handler: ${message.messageId}');
    print(message.data);
  }

  static Future initializeApp() async {
    // // Push notifications
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    try {
      if (Platform.isAndroid || Platform.isIOS) {
        await requestPermision();
        token = await FirebaseMessaging.instance.getToken();
        print('Token: $token');

        // Handlers
        FirebaseMessaging.onBackgroundMessage(_onBackgroundHandler);
        FirebaseMessaging.onMessage.listen(_onMessageHandler);
        FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenApp);
      }
    } catch (e) {}
    // Local notifications
  }

  // Apple / Web
  static requestPermision() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    print('User push notification status ${settings.authorizationStatus}');
  }
}
