import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:myhome_access/View/emergency_alert.dart';
import 'package:myhome_access/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Controller/visitor_vehicle.dart';
import '../Model/visitor_vehicle.dart';
import 'fine_payment.dart';
import 'login_screen.dart';
import 'notification.dart';

class VisitorMenu extends StatefulWidget {
  @override
  _VisitorMenuState createState() => _VisitorMenuState();
}
class _VisitorMenuState extends State<VisitorMenu> {
  String? visitorEmail;
  String visitorName = 'Loading...'; // Initialize with a default value
  String? name;
  VisitorVehicle? visitorVehicle;

  @override
  void initState() {
    super.initState();
    fetchVisitorEmail();
    fetchVisitorDetails();
    fetchVisitorVehicleData();
  }
  void fetchVisitorEmail() async {
    String? savedVisitorEmail = await getSavedVisitorEmail();

    setState(() {
      visitorEmail = savedVisitorEmail ;
    });

    if (visitorEmail != null && visitorEmail!.isNotEmpty) {
      print('Visitor Email: $visitorEmail');
      // You can now use the visitorEmail in your logic or display it on the UI.
    } else {
      print('Visitor Email not found or is empty.');
      // Handle the case where the visitor email is not found or is empty.
    }

  }

  Future<String?> getSavedVisitorEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('visitorEmail');
  }

  void fetchVisitorDetails() async {
    String? savedVisitorEmail = await getSavedVisitorEmail();

    if (savedVisitorEmail != null && savedVisitorEmail.isNotEmpty) {
      try {
        // Perform a query to get the visitor details based on email
        var querySnapshot = await FirebaseFirestore.instance
            .collection('visitor') // Replace with your collection name
            .where('visitorEmail', isEqualTo: savedVisitorEmail)
            .limit(1)
            .get();

        if (querySnapshot.docs.isNotEmpty) {
          // Extract the name from the document
          var visitorName = querySnapshot.docs.first['visitorName'];

          setState(() {
            visitorEmail = savedVisitorEmail;
            name = visitorName;
          });

          print('Visitor Email: $visitorEmail');
          print('Visitor Name: $name');
          // You can now use the visitorEmail and name in your logic or display them on the UI.
        } else {
          print('Visitor details not found for email: $savedVisitorEmail');
        }
      } catch (e) {
        print('Error fetching visitor details: $e');
      }
    } else {
      print('Visitor Email not found or is empty.');
      // Handle the case where the visitor email is not found or is empty.
    }
  }

  /*Future<void> fetchVisitorVehicleData(String accessToken) async {
    try {
      VisitorVehicleController vehicleController = VisitorVehicleController();
      VisitorVehicle? fetchedVehicle = await vehicleController.getVehicleByAccessToken(accessToken);

      if (fetchedVehicle != null) {
        setState(() {
          visitorVehicle = fetchedVehicle;
        });
      } else {
        // Handle the case where no vehicle is found for the provided accessToken
      }
    } catch (e) {
      // Handle errors
      print('Error fetching data: $e');
    }
  }*/
  Future<String?> getSavedAccessToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('accessToken');
  }
  Future<void> fetchVisitorVehicleData() async {
    try {
      // Retrieve access token from SharedPreferences
      String? accessToken = await getSavedAccessToken();

      if (accessToken != null) {
        VisitorVehicleController vehicleController = VisitorVehicleController();
        VisitorVehicle? fetchedVehicle = await vehicleController.getVehicleByAccessToken(accessToken);

        if (fetchedVehicle != null) {
          setState(() {
            visitorVehicle = fetchedVehicle;
          });
        } else {
          // Handle the case where no vehicle is found for the provided accessToken
        }
      } else {
        // Handle the case where accessToken is null or not found in SharedPreferences
      }
    } catch (e) {
      // Handle errors
      print('Error fetching data: $e');
    }
  }




  Future<String?> getUserNameByEmail(String visitorEmail) async {
    String? visitorName;
    print('Attempting to fetch userName for email: $visitorEmail');  // Debugging
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('visitor')
          .where('visitorEmail', isEqualTo: visitorEmail)
          .get();

      print('Query snapshot size: ${querySnapshot.size}');  // Debugging

      if (querySnapshot.docs.isNotEmpty) {
        visitorName = (querySnapshot.docs.first.get('visitorName') as String?)!;
        print('Fetched userName from Firestore: $visitorName');  // Debugging
      } else {
        print('No documents found for email: $visitorEmail');  // Debugging
      }
    } catch (error) {
      print('Error fetching user name: $error');  // Debugging
    }
    return visitorName;
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 428;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      //width: double.infinity,
      body: SingleChildScrollView(
        child: Container(
          // visitordashboardr8U (472:2049)
          width: double.infinity,
          height: 926*fem,
          child: Stack(
            children: [
              Positioned(
                // signinpagePPJ (472:2050)
                left: 0*fem,
                top: 0*fem,
                child: Container(
                  padding: EdgeInsets.fromLTRB(16*fem, 54*fem, 20*fem, 47*fem),
                  width: 428*fem,
                  height: 926*fem,
                  decoration: BoxDecoration (
                    color: Color(0xffffffff),
                  ),
                  child: Container(
                    // framesZN (472:2051)
                    width: double.infinity,
                    height: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            // visitorlogoutbuttoncmr (510:2980)
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 314*fem, 379*fem),
                            child: TextButton(
                              onPressed: () {
                          
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('Log out'),
                                      content: Text('Are you sure want to log out? This will log you out from your account.'),
                                      actions: <Widget>[
                                        // Cancel button
                                        TextButton(
                                          child: Text('Cancel'),
                                          onPressed: () {
                                            Navigator.of(context).pop();  // Close the dialog
                                          },
                                        ),
                                        // Log out button
                                        TextButton(
                                          child: Text('Log out'),
                                          onPressed: () async {
                                            // Clear any existing user data or state here
                                            final prefs = await SharedPreferences.getInstance();
                                            await prefs.clear();  // Clear SharedPreferences or other stored data as needed
                          
                                            // Navigate to the login screen
                                            Navigator.pushAndRemoveUntil(
                                              context,
                                              MaterialPageRoute(builder: (context) => LoginScreen(userEmail: '',)),
                                                  (Route<dynamic> route) => false,  // This will clear all previous routes and start fresh with the LoginScreen
                                            );
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              style: TextButton.styleFrom (
                                padding: EdgeInsets.zero,
                              ),
                              child: Container(
                                child: Center(
                                  // logoutroundedjrU (I510:2980;510:2938)
                                  child: SizedBox(
                                    width: 50*fem,
                                    height: 50*fem,
                                    child: Image.asset(
                                      'assets/page-1/images/logout-rounded-FzU.png',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),



                        Container(
                          width: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Center(
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 100 * fem, 0 * fem),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Access Start Time:',
                                        textAlign: TextAlign.center,
                                        style: SafeGoogleFont(
                                          'Raleway',
                                          fontSize: 17 * ffem,
                                          fontWeight: FontWeight.w700,
                                          height: 1.175 * ffem / fem,
                                          color: Color(0xff323130),
                                        ),
                                      ),
                                      Text(
                                        //'Access Start Time: ${visitorVehicle?.accessStartTime ?? ''}',
                                        '${visitorVehicle?.accessStartTime != null ? _convertToKualaLumpurTime(visitorVehicle!.accessStartTime!) : ''}',
                                         // '${visitorVehicle?.accessStartTime != null ? _convertToKualaLumpurTime(visitorVehicle!.accessStartTime!) : ''}', // Convert DateTime to a formatted string if needed
                                        style: TextStyle(
                                          // Your style for displaying the access start time
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Center(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Access End Time:',
                                      textAlign: TextAlign.center,
                                      style: SafeGoogleFont(
                                        'Raleway',
                                        fontSize: 17 * ffem,
                                        fontWeight: FontWeight.w700,
                                        height: 1.175 * ffem / fem,
                                        color: Color(0xff323130),
                                      ),
                                    ),
                                    Text(
                                      //'Access End Time: ${visitorVehicle?.accessEndTime ?? ''}',
                                      ' ${visitorVehicle?.accessEndTime != null ? _convertToKualaLumpurTime(visitorVehicle!.accessEndTime!) : ''}',
                                      //'${visitorVehicle?.accessEndTime != null ? _convertToKualaLumpurTime(visitorVehicle!.accessEndTime!) : ''}',
                                      style: TextStyle(
                                        // Your style for displaying the access end time
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        Container(
                          // autogroup9kpp3Et (UnwCJbM7HHVDJfJBpy9Kpp)
                          padding: EdgeInsets.fromLTRB(21*fem, 103*fem, 38*fem, 0*fem),
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                // autogroupmtucxse (UnwC3GTK4rHc8hN9xrMtUc)
                                margin: EdgeInsets.fromLTRB(18*fem, 0*fem, 0*fem, 107*fem),
                                width: double.infinity,
                                height: 125*fem,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      // visitoreaHQ8 (473:2158)
                                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 35*fem, 0*fem),
                                      child: TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                           MaterialPageRoute(builder: (context) => EmergencyScreen(userEmail: visitorEmail!) /*SearchNumberPlateView()*/),
                                          );
                                        },
                                        style: TextButton.styleFrom (
                                          padding: EdgeInsets.zero,
                                        ),
                                        child: Container(
                                          padding: EdgeInsets.fromLTRB(21*fem, 10*fem, 28*fem, 14.5*fem),
                                          width: 140*fem,
                                          height: double.infinity,
                                          decoration: BoxDecoration (
                                            color: Color(0xffe4d7ba),
                                            borderRadius: BorderRadius.circular(20*fem),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Color(0x3f000000),
                                                offset: Offset(0*fem, 4*fem),
                                                blurRadius: 2*fem,
                                              ),
                                            ],
                                          ),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                // sirenugQ (I473:2158;473:2088)
                                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 66*fem, 10*fem),
                                                width: 25*fem,
                                                height: 25*fem,
                                                child: Image.asset(
                                                  'assets/page-1/images/siren-gUk.png',
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                              Container(
                                                // emergencyalertd6c (I473:2158;473:2126)
                                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 9.5*fem),
                                                constraints: BoxConstraints (
                                                  maxWidth: 91*fem,
                                                ),
                                                child: RichText(
                                                  text: TextSpan(
                                                    style: SafeGoogleFont (
                                                      'Raleway',
                                                      fontSize: 17*ffem,
                                                      fontWeight: FontWeight.w500,
                                                      height: 1.1740000108*ffem/fem,
                                                      color: Color(0xff000000),
                                                    ),
                                                    children: [
                                                      TextSpan(
                                                        text: 'Emergency\n',
                                                        style: SafeGoogleFont (
                                                          'Raleway',
                                                          fontSize: 17*ffem,
                                                          fontWeight: FontWeight.w500,
                                                          height: 1.175*ffem/fem,
                                                          color: Color(0xff000000),
                                                        ),
                                                      ),
                                                      TextSpan(
                                                        text: 'Alert',
                                                        style: SafeGoogleFont (
                                                          'Raleway',
                                                          fontSize: 17*ffem,
                                                          fontWeight: FontWeight.w700,
                                                          height: 1.175*ffem/fem,
                                                          color: Color(0xff000000),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                // makeanalertF1W (I473:2158;473:2127)
                                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 8*fem, 0*fem),
                                                child: Text(
                                                  'Make an alert',
                                                  style: SafeGoogleFont (
                                                    'Raleway',
                                                    fontSize: 13*ffem,
                                                    fontWeight: FontWeight.w500,
                                                    height: 1.175*ffem/fem,
                                                    color: Color(0xff000000),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    //visitor notification>>>>>>>>>>>>>>>>>>>>>>>>
                                    TextButton(
                                      // visitornotiAPN (473:2163)
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => NotificationPage()),
                                        );
                                      },
                                      style: TextButton.styleFrom (
                                        padding: EdgeInsets.zero,
                                      ),
                                      child: Container(
                                        width: 140*fem,
                                        height: double.infinity,
                                        decoration: BoxDecoration (
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color(0x3f000000),
                                              offset: Offset(0*fem, 4*fem),
                                              blurRadius: 10*fem,
                                            ),
                                          ],
                                        ),
                                        child: Container(
                                          // group334je (I473:2163;473:2140)
                                          padding: EdgeInsets.fromLTRB(21*fem, 20*fem, 16*fem, 13.5*fem),
                                          width: double.infinity,
                                          height: double.infinity,
                                          decoration: BoxDecoration (
                                            color: Color(0xffe4d7ba),
                                            borderRadius: BorderRadius.circular(20*fem),
                                          ),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                // bellAXn (I473:2163;473:2092)
                                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 78*fem, 8*fem),
                                                width: 25*fem,
                                                height: 25*fem,
                                                child: Image.asset(
                                                  'assets/page-1/images/bell.png',
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                              Container(
                                                // notificationssh6 (I473:2163;473:2129)
                                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 7.5*fem),
                                                child: Text(
                                                  'Notifications',
                                                  style: SafeGoogleFont (
                                                    'Raleway',
                                                    fontSize: 17*ffem,
                                                    fontWeight: FontWeight.w700,
                                                    height: 1.175*ffem/fem,
                                                    color: Color(0xff000000),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                // checknotificationzFv (I473:2163;473:2130)
                                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 33*fem, 0*fem),
                                                constraints: BoxConstraints (
                                                  maxWidth: 70*fem,
                                                ),
                                                child: Text(
                                                  'Check\nNotification',
                                                  style: SafeGoogleFont (
                                                    'Raleway',
                                                    fontSize: 13*ffem,
                                                    fontWeight: FontWeight.w500,
                                                    height: 1.175*ffem/fem,
                                                    color: Color(0xff000000),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              TextButton(
                                // visitorpayfinebuttonsqW (473:2122)
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => FutureBuilder<String?>(
                                        future: getSavedVisitorEmail(),
                                        builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
                                          if (snapshot.connectionState == ConnectionState.waiting) {
                                            // While waiting for the email to be fetched, you can show a loading indicator.
                                            return CircularProgressIndicator();
                                          } else if (snapshot.hasError) {
                                            // Handle any errors that may occur while fetching the email.
                                            return Text('Error: ${snapshot.error}');
                                          } else {
                                            // If email is successfully fetched, navigate to PaymentView with the retrieved email.
                                            return PaymentView(visitorEmail: snapshot.data!);
                                          }
                                        },
                                      ),
                                    ),
                                  );

                                },
                                style: TextButton.styleFrom (
                                  padding: EdgeInsets.zero,
                                ),
                                child: Container(
                                  width: 109*fem,
                                  height: 41*fem,
                                  decoration: BoxDecoration (
                                    border: Border.all(color: Color(0xffffffff)),
                                    color: Color(0xff000000),
                                    borderRadius: BorderRadius.circular(20*fem),
                                  ),
                                  child: Center(
                                    child: Center(
                                      child: Text(
                                        'Pay Fine',
                                        textAlign: TextAlign.center,
                                        style: SafeGoogleFont (
                                          'Raleway',
                                          fontSize: 17*ffem,
                                          fontWeight: FontWeight.w500,
                                          height: 1.175*ffem/fem,
                                          color: Color(0xffffffff),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                // smartsecurityVrt (472:2061)
                left: 0*fem,
                top: 147.5*fem,
                child: Center(
                  child: Align(
                    child: SizedBox(
                      width: 258*fem,
                      height: 57*fem,
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: SafeGoogleFont (
                            'Raleway',
                            fontSize: 24*ffem,
                            fontWeight: FontWeight.w600,
                            height: 1.1740000248*ffem/fem,
                            color: Color(0xff323130),
                          ),
                          children: [
                            TextSpan(
                              text: 'Welcome Visitor!\n',
                              style: SafeGoogleFont (
                                'Raleway',
                                fontSize: 24*ffem,
                                fontWeight: FontWeight.w600,
                                height: 1.175*ffem/fem,
                                color: Color(0xff323130),
                              ),
                            ),
                            TextSpan(
                              text: name,
                              style: SafeGoogleFont (
                                'Raleway',
                                fontSize: 24*ffem,
                                fontWeight: FontWeight.w800,
                                height: 1.175*ffem/fem,
                                color: Color(0xff323130),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                // ellipse9HRN (472:2063)
                left: 101*fem,
                top: 575*fem,
                child: Align(
                  child: SizedBox(
                    width: 16*fem,
                    height: 16*fem,
                    child: Container(
                      decoration: BoxDecoration (
                        borderRadius: BorderRadius.circular(8*fem),
                        color: Color(0x00e9c372),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                // mobilebankingappwithsecurepaym (473:2087)
                left: 113*fem,
                top: 104*fem,
                child: Align(
                  child: SizedBox(
                    width: 348*fem,
                    height: 339*fem,
                    child: Image.asset(
                      'assets/page-1/images/mobile-banking-app-with-secure-payment.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
          );
  }
  String _convertToKualaLumpurTime(DateTime dateTime) {
    final formatter = DateFormat('yyyy-MM-dd \'at\' HH:mm:ss');
    final kualaLumpurTime = dateTime.toUtc().add(Duration(hours: 16));
    final formattedTime = formatter.format(kualaLumpurTime);

    return formattedTime;
  }
}