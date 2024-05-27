/*
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import '../Model/notification.dart';

class NotificationManager with ChangeNotifier {
  List<NotificationModel> notifications = [];

  void addNotification(NotificationModel notification) {
    notifications.add(notification);
    notifyListeners();
  }
}

class NotificationController {
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  final NotificationManager manager;


  NotificationController(this.manager);

  Future<void> initNotifications() async {
    NotificationSettings settings = await _messaging.requestPermission();
    print('User granted permission: ${settings.authorizationStatus}');

    await _messaging.subscribeToTopic('emergency');

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      manager.addNotification(NotificationModel(
        title: message.notification?.title ?? 'No Title',
        body: message.notification?.body ?? 'No Body',
        imageUrl: message.notification?.android?.imageUrl,
      ));
    });

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print('Handling a background message: ${message.messageId}');
}
*/

/*
import 'package:firebase_messaging/firebase_messaging.dart';
import '../Model/notification.dart';
import 'notificationmanager.dart';

class NotificationController {
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  final NotificationManager manager;

  NotificationController(this.manager) {
    initNotifications();
  }

  Future<void> initNotifications() async {
    NotificationSettings settings = await _messaging.requestPermission();
    print('User granted permission: ${settings.authorizationStatus}');

    await _messaging.subscribeToTopic('emergency');

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      var data = message.data;
      manager.addNotification(NotificationModel(
        title: message.notification?.title ?? 'No Title',
        body: message.notification?.body ?? 'No Body',
        imageUrl: message.notification?.android?.imageUrl,
        type: data['type'] ?? '',
        timestamp: data['timestamp'] ?? '',
        userEmail: data['userEmail'] ?? '',
        userName: data['userName'] ?? '',
        userAddress: data['userAddress'] ?? '',
      ));
    });

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print('Handling a background message: ${message.messageId}');
}*/

/*
import 'package:firebase_messaging/firebase_messaging.dart';

import '../Model/notification.dart';
import 'notificationmanager.dart';

class NotificationController {
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  final NotificationManager manager;

  NotificationController(this.manager) {
    initNotifications();
  }

  Future<void> initNotifications() async {
    NotificationSettings settings = await _messaging.requestPermission();
    print('User granted permission: ${settings.authorizationStatus}');

    await _messaging.subscribeToTopic('emergency');

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      var data = message.data;
      manager.addNotification(NotificationModel(
        title: data['title'] ?? 'No Title',
        body: data['message'] ?? 'No Body',
        imageUrl: data['imageUrl'],
        type: data['type'] ?? '',
        timestamp: data['timestamp'] ?? '',
        userEmail: data['userEmail'] ?? '',
        userName: data['userName'] ?? '',
        userAddress: data['userAddress'] ?? '',
      ));
    });

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print('Handling a background message: ${message.messageId}');
}*/

import 'package:firebase_messaging/firebase_messaging.dart';
import '../Model/notification.dart';
import '../Controller/notificationmanager.dart';

class NotificationController {
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  final NotificationManager manager;

  NotificationController(this.manager) {
    initNotifications();
  }

  Future<void> initNotifications() async {
    // Request notification permissions
    NotificationSettings settings = await _messaging.requestPermission();
    print('User granted permission: ${settings.authorizationStatus}');

    // Subscribe to the 'emergency' topic
    await _messaging.subscribeToTopic('emergency');

    // Listen for incoming messages
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      var data = message.data;
      manager.addNotification(NotificationModel(
        title: data['title'] ?? message.notification?.title ?? 'Emergency Alert',
        body: data['message'] ?? message.notification?.body ?? 'No Details',
        imageUrl: data['imageUrl'],
        type: data['type'] ?? 'Unknown',
        timestamp: data['timestamp'] ?? 'Unknown',
        userEmail: data['userEmail'] ?? 'Unknown',
        userName: data['userName'] ?? 'Unknown',
        userAddress: data['userAddress'] ?? 'Unknown',
      ));
    });

    // Handle background messages
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print('Handling a background message: ${message.messageId}');
}