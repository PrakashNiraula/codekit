import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationHelper {
  static Future<void> init(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    //initialize android
    var androidinitialize = new AndroidInitializationSettings('ic_laucher');

    //init ios notif
    var iosinitialize = new DarwinInitializationSettings();

    //combine
    var initsettings = new InitializationSettings(
        android: androidinitialize, iOS: iosinitialize);

    //init
    flutterLocalNotificationsPlugin.initialize(initsettings);

    //listen

    FirebaseMessaging.onMessage.listen((RemoteMessage msg) {
      print("On Message " + msg.toString());
    });
  }

  static Future<void> showNotif(
      RemoteMessage remoteMessage,
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin,
      bool data) async {
    //check platform

    if (!GetPlatform.isIOS) {
      String title;
      String message;
      String orderid;
      String image;

      if (data) {
        print('message:  ' + remoteMessage.toString());
      }
    }
  }

  static Future<void> showTextNotif(String title, String message,
      String orderid, String image, FlutterLocalNotificationsPlugin fln) async {
    // fln.show("1", title, message, orderid)
  }
}
