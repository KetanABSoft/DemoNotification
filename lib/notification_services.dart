import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> backgroundhandler( RemoteMessage message) async {
  print("Messege Recieved! ${message.notification!.title}");
}

class NotificationService {
  static Future<void> initialize() async {
    NotificationSettings settings =
    await FirebaseMessaging.instance.requestPermission();
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      FirebaseMessaging.onBackgroundMessage(backgroundhandler);
      print("Notification Intialized");
    }
  }
}
