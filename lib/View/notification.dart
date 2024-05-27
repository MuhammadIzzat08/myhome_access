/*
import 'package:flutter/material.dart';
import '../Controller/notification.dart';
import '../Model/notification.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  final NotificationManager _manager = NotificationManager();
  late final NotificationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = NotificationController(_manager);
    _controller.initNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notifications')),
      body: AnimatedBuilder(
        animation: _manager,
        builder: (context, _) {
          return ListView.builder(
            itemCount: _manager.notifications.length,
            itemBuilder: (context, index) {
              var notification = _manager.notifications[index];
              return ListTile(
                title: Text(notification.title),
                subtitle: Text(notification.body),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => NotificationDetailPage(alert: notification),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

class NotificationDetailPage extends StatelessWidget {
  final NotificationModel alert;

  NotificationDetailPage({Key? key, required this.alert}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(alert.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            if (alert.imageUrl != null)
              Image.network(alert.imageUrl!),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                alert.body,
                style: TextStyle(fontSize: 16),
              ),
            ),
            // Additional details can be added here
          ],
        ),
      ),
    );
  }
}
*/

import 'package:flutter/material.dart';
import '../Controller/notification.dart';
import '../Controller/notificationmanager.dart';
import '../Model/notification.dart';
import 'notificationdetail.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  final NotificationManager _manager = NotificationManager();
  late final NotificationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = NotificationController(_manager);
    _controller.initNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Notifications'),
            backgroundColor: Color(0xffe4d7ba),
            titleTextStyle: TextStyle(color: Colors.black, fontSize: 22.0, fontWeight: FontWeight.bold),
            iconTheme: IconThemeData(
            color: Colors.black,
      ),
    ),
        body: AnimatedBuilder(
            animation: _manager,
            builder: (context, _) {
              return ListView.builder(
                itemCount: _manager.notifications.length,
                itemBuilder: (context, index) {
                  var notification = _manager.notifications[index];
                  return Card(
                    child: ListTile(
                      title: Text(notification.title),
                      subtitle: Text(notification.body),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => NotificationDetailPage(alert: notification),
                          ),
                        );
                      },
                    ),
                  );
                },
              );
            },
            ),
        );
    }
}