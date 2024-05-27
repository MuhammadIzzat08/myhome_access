import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Model/notification.dart';

class NotificationDetailPage extends StatelessWidget {
  final NotificationModel alert;

  NotificationDetailPage({Key? key, required this.alert}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(alert.title),
          backgroundColor: Color(0xffe4d7ba),
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 22.0, fontWeight: FontWeight.bold),
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
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
                    'Message: ${alert.body}\n'
                        'Type: ${alert.type}\n'
                        'Timestamp: ${alert.timestamp}\n'
                        'User Email: ${alert.userEmail}\n'
                        'User Name: ${alert.userName}\n'
                        'User Address: ${alert.userAddress}',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
            ),
        );
    }
}