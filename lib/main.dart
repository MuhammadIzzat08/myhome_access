/*
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:myhome_access/Controller/report_controller.dart';
import 'package:myhome_access/View/history_logs.dart';
import 'package:myhome_access/View/launch-screen-16.dart';
import 'package:myhome_access/View/launch-screen-4.dart';
import 'View/emergency_alert.dart';
import 'View/fine_visitor_vehicle.dart';
import 'package:myhome_access/View/emergency_alert.dart';
import 'package:myhome_access/View/notification.dart';
import 'package:myhome_access/View/visitor_vehicle.dart';
import 'package:myhome_access/View/login_screen.dart';
import 'package:myhome_access/signup_screen.dart';
import 'package:myhome_access/vehicle.dart';
import 'View/launch-screen-17.dart';
import 'View/launch-screen-5.dart';
import 'View/patrol_report.dart';
import 'View/patrol_schedule.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'View/report_view.dart';
import 'View/user.dart';
import 'View/vehicle_view.dart';
import 'firebase_options.dart';
import '../menu_Guard.dart';
import 'menu_admin.dart';
import 'View/visitorlogin.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      //home:EmergencyScreen(),

      //home:LoginScreen(),
      //home:SignUpScreen(),
      //home: PatrolScheduleScreen(),
      home: LoginScreen(userEmail: '',),
        //home: PatrolReportView() ,
     // home: PatrolReportScreen(userEmail: '',),
      //home: HistoryLogsView(),
      //home: PatrolScheduleViewAll(),
        //home: ReportController().getView(),
        //home: EmergencyAlertsListView(),
      //home: Scene(),
        //home: MainMenuAdmin(),
      //home: PatrolReportView(),
      //home: YearlyVisitorList(),
      //home: VisitorLoginView(),
      //home: ReportScreen(),
      //home: LaunchScreen4(),
    );
  }
}

*/

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:myhome_access/View/history_logs.dart';
import 'package:myhome_access/View/emergency_alert.dart';
import 'package:myhome_access/View/fine_visitor_vehicle.dart';
import 'package:myhome_access/View/notification.dart';
import 'package:myhome_access/View/visitor_vehicle.dart';
import 'package:myhome_access/View/login_screen.dart';
import 'package:myhome_access/signup_screen.dart';
import 'package:myhome_access/vehicle.dart';
import 'package:myhome_access/View/patrol_report.dart';
import 'package:myhome_access/View/patrol_schedule.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:myhome_access/View/user.dart';
import 'package:myhome_access/View/userdelete.dart';
import 'package:myhome_access/View/vehicle_view.dart';
import 'package:myhome_access/View/visitorlogin.dart';
import 'Model/notification.dart';
import 'View/notificationdetail.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = "pk_test_51OMrr6BsQX77pZnpJKbYQQBp8ALQYJ9Qqkj605CGRR9xC0D0fjl2PyTb3rwD1hIuIOam4yzv88fHbRbF16897utj002BtnSuQ0";
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  // Initialize Firebase Messaging
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  RemoteMessage? initialMessage = await FirebaseMessaging.instance.getInitialMessage();

  // Determine the initial route
  String initialRoute = '/login'; // Default login route
  NotificationModel initialAlert = NotificationModel(
    title: 'No Title',
    body: 'No Body',
    imageUrl: null,
    type: 'Unknown',
    timestamp: 'Unknown',
    userEmail: 'Unknown',
    userName: 'Unknown',
    userAddress: 'Unknown',
  );

  if (initialMessage != null) {
    initialRoute = '/notificationDetail'; // Navigate to NotificationDetailPage
    // Populate the alert with notification data
    initialAlert = NotificationModel(
      title: initialMessage.notification?.title ?? 'No Title',
      body: initialMessage.notification?.body ?? 'No Body',
      imageUrl: initialMessage.data['imageUrl'],
      type: initialMessage.data['type'] ?? 'Unknown',
      timestamp: initialMessage.data['timestamp'] ?? 'Unknown',
      userEmail: initialMessage.data['userEmail'] ?? 'Unknown',
      userName: initialMessage.data['userName'] ?? 'Unknown',
      userAddress: initialMessage.data['userAddress'] ?? 'Unknown',
    );
  }

  runApp(MyApp(initialRoute: initialRoute, initialAlert: initialAlert));
}

class MyApp extends StatelessWidget {
  final String initialRoute;
  final NotificationModel initialAlert;

  const MyApp({required this.initialRoute, required this.initialAlert, super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // Define your routes for navigation
      routes: {
        '/login': (context) => LoginScreen(userEmail: ''),
        '/notificationDetail': (context) => NotificationDetailPage(alert: initialAlert), // Pass initialAlert to NotificationDetailPage
      },

      // Set the initial route based on the condition
      initialRoute: initialRoute,

      // Other configurations...
    );
  }
}

// FirebaseMessaging background handler
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // Handle the initial message when the app is launched from a terminated state
  print("Handling a background message: ${message.messageId}");
  // You can add your custom logic here to handle the notification data
  // For example, you can navigate to a specific screen based on the notification data.
}
