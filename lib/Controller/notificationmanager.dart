import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../Model/notification.dart';

class NotificationManager with ChangeNotifier {
  List<NotificationModel> notifications = [];

  void addNotification(NotificationModel notification) {
    notifications.add(notification);
    notifyListeners();
    }
}