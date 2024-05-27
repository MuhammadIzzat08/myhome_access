import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myhome_access/View/emergency_alert.dart';
import 'package:myhome_access/View/history_logs.dart';
import 'package:myhome_access/View/notification.dart';
import 'package:myhome_access/View/patrol_report.dart';
import 'package:myhome_access/View/patrol_schedule.dart';
import 'package:myhome_access/View/user_profile.dart';
import 'package:myhome_access/View/userdelete.dart';
import 'package:myhome_access/View/vehicle_view.dart';
import 'package:myhome_access/payment_transaction.dart';
import 'package:myhome_access/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'View/fine_payment.dart';
import 'View/login_screen.dart';
import 'View/user.dart';
import 'View/visitor_vehicle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';


    //class MainMenuAdmin extends StatelessWidget {

class MainMenuAdmin extends StatefulWidget {

  @override
  _MainMenuAdminState createState() => _MainMenuAdminState();
}


class _MainMenuAdminState extends State<MainMenuAdmin> {
  String? userEmail = FirebaseAuth.instance.currentUser?.email;
  String userName = 'Loading...'; // Initialize with a default value

  @override
  void initState() {
    super.initState();
    _fetchUserEmailAndUserName();
  }

  _fetchUserEmailAndUserName() async {
    if (userEmail != null) {
      final prefs = await SharedPreferences.getInstance();
      userEmail = prefs.getString("userEmail") ?? 'Not Available';

      // Fetch userName using the fetched userEmail
      String? fetchedUserName = await getUserNameByEmail(userEmail!);

      setState(() {
        userName = fetchedUserName ?? 'Not Available';
      });
    }
  }

  Future<String?> getUserNameByEmail(String userEmail) async {
    String? userName;
    print('Attempting to fetch userName for email: $userEmail'); // Debugging
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('email', isEqualTo: userEmail)
          .get();

      print('Query snapshot size: ${querySnapshot.size}'); // Debugging

      if (querySnapshot.docs.isNotEmpty) {
        userName = querySnapshot.docs.first.get('name') as String?;
        print('Fetched userName from Firestore: $userName'); // Debugging
      } else {
        print('No documents found for email: $userEmail'); // Debugging
      }
    } catch (error) {
      print('Error fetching user name: $error'); // Debugging
    }
    return userName;
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
          // homepageadmin1kp (300:3726)
          width: double.infinity,
          height: 926*fem,
          child: Stack(
            children: [
              Positioned(
                // signinpagekiQ (300:3727)
                left: 0*fem,
                top: 0*fem,
                child: Container(
                  padding: EdgeInsets.fromLTRB(15*fem, 54*fem, 15*fem, 36*fem),
                  width: 428*fem,
                  height: 926*fem,
                  decoration: BoxDecoration (
                    color: Color(0xffffffff),
                  ),
                  child: Container(
                    // framermS (300:3729)
                    width: 378*fem,
                    height: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          // autogroupfikc1PS (SGJ4DHsC77X8DaPbFyFikC)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 250.5*fem),
                          width: double.infinity,
                          height: 50*fem,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // adminlogoutuji (421:2130)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 278*fem, 0*fem),
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
                                    height: double.infinity,
                                    child: Center(
                                      // logoutroundedRxx (I421:2130;405:1935)
                                      child: SizedBox(
                                        width: 50*fem,
                                        height: 50*fem,
                                        child: Image.asset(
                                          'assets/page-1/images/logout-rounded.png',
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              //edit profile>>>>>>>>>
                              Expanded(
                                child: TextButton(
                                  // adminuserbuttonZpG (421:2128)
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => UserProfileView(userEmail: userEmail!))
                                    );
                                  },
                                  style: TextButton.styleFrom (
                                    padding: EdgeInsets.zero,
                                  ),
                                  child: Container(
                                    height: double.infinity,
                                    child: Center(
                                      // maleuservPv (I421:2128;405:1928)
                                      child: SizedBox(
                                        width: 50*fem,
                                        height: 50*fem,
                                        child: Image.asset(
                                          'assets/page-1/images/male-user-rMA.png',
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Center(
                          // mainmenuFh6 (630:493)
                          child: Container(
                            width: double.infinity,
                            child: Text(
                              'Main Menu',
                              textAlign: TextAlign.center,
                              style: SafeGoogleFont (
                                'Raleway',
                                fontSize: 24*ffem,
                                fontWeight: FontWeight.w700,
                                height: 1.175*ffem/fem,
                                color: Color(0xff323130),
                              ),
                            ),
                          ),
                        ),

                        //delete information>>>>>>>>
                        Container(
                          // autogroupd4diAZA (SGJ5Hm56wGw7DDMHe4D4Di)
                          padding: EdgeInsets.fromLTRB(57*fem, 25.5*fem, 0*fem, 0*fem),
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // autogroupxe84J9a (SGJ4LneheQtZcjTxLwXe84)
                                width: double.infinity,
                                height: 112*fem,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      // deleteinformationbuttonF4p (304:3862)
                                      left: 0*fem,
                                      top: 0*fem,
                                      child: TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => AdminScreen()),
                                          );
                                        },
                                        style: TextButton.styleFrom (
                                          padding: EdgeInsets.zero,
                                        ),
                                        child: Container(
                                          width: 176*fem,
                                          height: 112*fem,
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                // rectangle18kGU (I304:3862;203:503)
                                                left: 0*fem,
                                                top: 0*fem,
                                                child: Align(
                                                  child: SizedBox(
                                                    width: 128.59*fem,
                                                    height: 112*fem,
                                                    child: TextButton(
                                                      onPressed: () {},
                                                      style: TextButton.styleFrom (
                                                        padding: EdgeInsets.zero,
                                                      ),
                                                      child: Container(
                                                        decoration: BoxDecoration (
                                                          borderRadius: BorderRadius.circular(20*fem),
                                                          color: Color(0xffe4d7ba),
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color: Color(0x59000000),
                                                              offset: Offset(0*fem, 4*fem),
                                                              blurRadius: 2*fem,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                // smartsecurityPqE (I304:3862;203:508)
                                                left: 17*fem,
                                                top: 82.75*fem,
                                                child: Align(
                                                  child: SizedBox(
                                                    width: 103*fem,
                                                    height: 13*fem,
                                                    child: Text(
                                                      'Remove information',
                                                      style: SafeGoogleFont (
                                                        'Raleway',
                                                        fontSize: 11*ffem,
                                                        fontWeight: FontWeight.w400,
                                                        height: 1.175*ffem/fem,
                                                        color: Color(0xff000000),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                // deleteinformationGe8 (I304:3862;203:525)
                                                left: 17*fem,
                                                top: 43*fem,
                                                child: Align(
                                                  child: SizedBox(
                                                    width: 84*fem,
                                                    height: 36*fem,
                                                    child: RichText(
                                                      text: TextSpan(
                                                        style: SafeGoogleFont (
                                                          'Raleway',
                                                          fontSize: 15*ffem,
                                                          fontWeight: FontWeight.w400,
                                                          height: 1.1740000407*ffem/fem,
                                                          color: Color(0xff000000),
                                                        ),
                                                        children: [
                                                          TextSpan(
                                                            text: 'Delete\n',
                                                            style: SafeGoogleFont (
                                                              'Raleway',
                                                              fontSize: 15*ffem,
                                                              fontWeight: FontWeight.w400,
                                                              height: 1.175*ffem/fem,
                                                              color: Color(0xff000000),
                                                            ),
                                                          ),
                                                          TextSpan(
                                                            text: 'Information',
                                                            style: SafeGoogleFont (
                                                              'Raleway',
                                                              fontSize: 15*ffem,
                                                              fontWeight: FontWeight.w700,
                                                              height: 1.175*ffem/fem,
                                                              color: Color(0xff000000),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                // fulltrashDLQ (I304:3862;300:3749)
                                                left: 17*fem,
                                                top: 13*fem,
                                                child: Align(
                                                  child: SizedBox(
                                                    width: 20*fem,
                                                    height: 20*fem,
                                                    child: Image.asset(
                                                      'assets/page-1/images/full-trash.png',
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),

                                    //edit patrol schedule
                                    Positioned(
                                      // editpatrolschedulebutton8yA (304:3868)
                                      left: 145*fem,
                                      top: 0*fem,
                                      child: TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => PatrolScheduleScreen()),
                                          );
                                        },
                                        style: TextButton.styleFrom (
                                          padding: EdgeInsets.zero,
                                        ),
                                        child: Container(
                                          width: 176*fem,
                                          height: 112*fem,
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                // rectangle19FH6 (I304:3868;203:505)
                                                left: 0*fem,
                                                top: 0*fem,
                                                child: Align(
                                                  child: SizedBox(
                                                    width: 128.59*fem,
                                                    height: 112*fem,
                                                    child: TextButton(
                                                      onPressed: () {},
                                                      style: TextButton.styleFrom (
                                                        padding: EdgeInsets.zero,
                                                      ),
                                                      child: Container(
                                                        decoration: BoxDecoration (
                                                          borderRadius: BorderRadius.circular(20*fem),
                                                          color: Color(0xffe4d7ba),
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color: Color(0x59000000),
                                                              offset: Offset(0*fem, 4*fem),
                                                              blurRadius: 2*fem,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                // smartsecurity85z (I304:3868;203:510)
                                                left: 8.0815429688*fem,
                                                top: 83.1281251907*fem,
                                                child: Align(
                                                  child: SizedBox(
                                                    width: 70*fem,
                                                    height: 13*fem,
                                                    child: Text(
                                                      'Edit schedule',
                                                      style: SafeGoogleFont (
                                                        'Raleway',
                                                        fontSize: 11*ffem,
                                                        fontWeight: FontWeight.w400,
                                                        height: 1.175*ffem/fem,
                                                        color: Color(0xff000000),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                // editpatrolschedulepzQ (I304:3868;207:528)
                                                left: 8.0815429688*fem,
                                                top: 39.900390625*fem,
                                                child: Align(
                                                  child: SizedBox(
                                                    width: 116*fem,
                                                    height: 36*fem,
                                                    child: RichText(
                                                      text: TextSpan(
                                                        style: SafeGoogleFont (
                                                          'Raleway',
                                                          fontSize: 15*ffem,
                                                          fontWeight: FontWeight.w400,
                                                          height: 1.1740000407*ffem/fem,
                                                          color: Color(0xff000000),
                                                        ),
                                                        children: [
                                                          TextSpan(
                                                            text: 'Edit \n',
                                                            style: SafeGoogleFont (
                                                              'Raleway',
                                                              fontSize: 15*ffem,
                                                              fontWeight: FontWeight.w400,
                                                              height: 1.175*ffem/fem,
                                                              color: Color(0xff000000),
                                                            ),
                                                          ),
                                                          TextSpan(
                                                            text: 'Patrol Schedule',
                                                            style: SafeGoogleFont (
                                                              'Raleway',
                                                              fontSize: 15*ffem,
                                                              fontWeight: FontWeight.w700,
                                                              height: 1.175*ffem/fem,
                                                              color: Color(0xff000000),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                // edit8di (I304:3868;207:526)
                                                left: 8.0815429688*fem,
                                                top: 13.4404296875*fem,
                                                child: Align(
                                                  child: SizedBox(
                                                    width: 20*fem,
                                                    height: 20*fem,
                                                    child: Image.asset(
                                                      'assets/page-1/images/edit-GkC.png',
                                                      fit: BoxFit.contain,
                                                    ),
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
                              SizedBox(
                                height: 11*fem,
                              ),

                              //view history logs>>>>>>
                              Container(
                                // autogroupxwg43kg (SGJ4Ys8unx6YebXmCqXWg4)
                                width: double.infinity,
                                height: 112*fem,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      // viewhistorylogsbuttonc36 (304:3873)
                                      left: 0*fem,
                                      top: 0*fem,
                                      child: TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => EmergencyAlertsListView()),
                                          );
                                        },
                                        style: TextButton.styleFrom (
                                          padding: EdgeInsets.zero,
                                        ),
                                        child: Container(
                                          width: 176*fem,
                                          height: 112*fem,
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                // rectangle207kY (I304:3873;203:504)
                                                left: 0*fem,
                                                top: 0*fem,
                                                child: Align(
                                                  child: SizedBox(
                                                    width: 130.18*fem,
                                                    height: 112*fem,
                                                    child: TextButton(
                                                      onPressed: () {},
                                                      style: TextButton.styleFrom (
                                                        padding: EdgeInsets.zero,
                                                      ),
                                                      child: Container(
                                                        decoration: BoxDecoration (
                                                          borderRadius: BorderRadius.circular(20*fem),
                                                          color: Color(0xffe4d7ba),
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color: Color(0x59000000),
                                                              offset: Offset(0*fem, 4*fem),
                                                              blurRadius: 2*fem,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                // smartsecuritybfi (I304:3873;203:509)
                                                left: 14.5454101562*fem,
                                                top: 87.3000001907*fem,
                                                child: Align(
                                                  child: SizedBox(
                                                    width: 87*fem,
                                                    height: 13*fem,
                                                    child: Text(
                                                      'View emergency',
                                                      style: SafeGoogleFont (
                                                        'Raleway',
                                                        fontSize: 11*ffem,
                                                        fontWeight: FontWeight.w400,
                                                        height: 1.175*ffem/fem,
                                                        color: Color(0xff000000),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                // viewemergencylogsugQ (I304:3873;207:531)
                                                left: 15.2651367188*fem,
                                                top: 44.7998046875*fem,
                                                child: Align(
                                                  child: SizedBox(
                                                    width: 105*fem,
                                                    height: 33*fem,
                                                    child: RichText(
                                                      text: TextSpan(
                                                        style: SafeGoogleFont (
                                                          'Raleway',
                                                          fontSize: 15*ffem,
                                                          fontWeight: FontWeight.w400,
                                                          height: 1.175*ffem/fem,
                                                          color: Color(0xff000000),
                                                        ),
                                                        children: [
                                                          TextSpan(
                                                            text: 'View\n',
                                                          ),
                                                          TextSpan(
                                                            text: 'Emergency Logs',
                                                            style: SafeGoogleFont (
                                                              'Raleway',
                                                              fontSize: 13*ffem,
                                                              fontWeight: FontWeight.w700,
                                                              height: 1.175*ffem/fem,
                                                              color: Color(0xff000000),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                // view4Bv (I304:3873;207:529)
                                                left: 14.5454101562*fem,
                                                top: 14.7001953125*fem,
                                                child: Align(
                                                  child: SizedBox(
                                                    width: 20*fem,
                                                    height: 20*fem,
                                                    child: Image.asset(
                                                      'assets/page-1/images/view-K2C.png',
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),

                                    //patrol report view>>>>>>>>
                                    Positioned(
                                      // viewpatrolreportbuttonmc8 (405:1428)
                                      left: 145*fem,
                                      top: 0*fem,
                                      child: TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => PatrolReportView()),
                                          );
                                        },
                                        style: TextButton.styleFrom (
                                          padding: EdgeInsets.zero,
                                        ),
                                        child: Container(
                                          width: 176*fem,
                                          height: 112*fem,
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                // rectangle20gj6 (I405:1428;405:1414)
                                                left: 0*fem,
                                                top: 0*fem,
                                                child: Align(
                                                  child: SizedBox(
                                                    width: 130.18*fem,
                                                    height: 112*fem,
                                                    child: TextButton(
                                                      onPressed: () {},
                                                      style: TextButton.styleFrom (
                                                        padding: EdgeInsets.zero,
                                                      ),
                                                      child: Container(
                                                        decoration: BoxDecoration (
                                                          borderRadius: BorderRadius.circular(20*fem),
                                                          color: Color(0xffe4d7ba),
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color: Color(0x59000000),
                                                              offset: Offset(0*fem, 4*fem),
                                                              blurRadius: 2*fem,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                // smartsecurityNbv (I405:1428;405:1415)
                                                left: 14.5454101562*fem,
                                                top: 87.3000001907*fem,
                                                child: Align(
                                                  child: SizedBox(
                                                    width: 59*fem,
                                                    height: 13*fem,
                                                    child: Text(
                                                      'View report',
                                                      style: SafeGoogleFont (
                                                        'Raleway',
                                                        fontSize: 11*ffem,
                                                        fontWeight: FontWeight.w400,
                                                        height: 1.175*ffem/fem,
                                                        color: Color(0xff000000),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                // viewpatrolreport5FS (I405:1428;405:1416)
                                                left: 15.2651367188*fem,
                                                top: 44.7998046875*fem,
                                                child: Align(
                                                  child: SizedBox(
                                                    width: 96*fem,
                                                    height: 36*fem,
                                                    child: RichText(
                                                      text: TextSpan(
                                                        style: SafeGoogleFont (
                                                          'Raleway',
                                                          fontSize: 15*ffem,
                                                          fontWeight: FontWeight.w400,
                                                          height: 1.1740000407*ffem/fem,
                                                          color: Color(0xff000000),
                                                        ),
                                                        children: [
                                                          TextSpan(
                                                            text: 'View\n',
                                                            style: SafeGoogleFont (
                                                              'Raleway',
                                                              fontSize: 15*ffem,
                                                              fontWeight: FontWeight.w400,
                                                              height: 1.175*ffem/fem,
                                                              color: Color(0xff000000),
                                                            ),
                                                          ),
                                                          TextSpan(
                                                            text: 'Patrol Report',
                                                            style: SafeGoogleFont (
                                                              'Raleway',
                                                              fontSize: 15*ffem,
                                                              fontWeight: FontWeight.w700,
                                                              height: 1.175*ffem/fem,
                                                              color: Color(0xff000000),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                // viewfcx (I405:1428;405:1426)
                                                left: 14.5454101562*fem,
                                                top: 14.7001953125*fem,
                                                child: Align(
                                                  child: SizedBox(
                                                    width: 20*fem,
                                                    height: 20*fem,
                                                    child: Image.asset(
                                                      'assets/page-1/images/view-iDJ.png',
                                                      fit: BoxFit.contain,
                                                    ),
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

                              //view analysis>>>>>>>>>>>>>>>>
                              SizedBox(
                                height: 11*fem,
                              ),
                              Container(
                                // autogroupgchzNGU (SGJ4jrpbFXJey6Jq4fGCHz)
                                margin: EdgeInsets.fromLTRB(4*fem, 0*fem, 46*fem, 0*fem),
                                width: double.infinity,
                                height: 112*fem,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      // adminviewanalysishZe (461:1668)
                                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 11*fem, 0*fem),
                                      child: TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => YearlyVisitorList()),
                                          );
                                        },
                                        style: TextButton.styleFrom (
                                          padding: EdgeInsets.zero,
                                        ),
                                        child: Container(
                                          padding: EdgeInsets.fromLTRB(13.93*fem, 16.13*fem, 13.93*fem, 9.06*fem),
                                          width: 130*fem,
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
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                // analyzeM8Q (I461:1668;461:1544)
                                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 7.78*fem),
                                                width: 20*fem,
                                                height: 20*fem,
                                                child: Image.asset(
                                                  'assets/page-1/images/analyze-qMn.png',
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                              Container(
                                                // viewanalysis54Q (I461:1668;461:1542)
                                                margin: EdgeInsets.fromLTRB(3.71*fem, 0*fem, 0*fem, 9.04*fem),
                                                constraints: BoxConstraints (
                                                  maxWidth: 64*fem,
                                                ),
                                                child: RichText(
                                                  text: TextSpan(
                                                    style: SafeGoogleFont (
                                                      'Inter',
                                                      fontSize: 15*ffem,
                                                      fontWeight: FontWeight.w400,
                                                      height: 1.2102272034*ffem/fem,
                                                      color: Color(0xff000000),
                                                    ),
                                                    children: [
                                                      TextSpan(
                                                        text: 'View\n',
                                                        style: SafeGoogleFont (
                                                          'Inter',
                                                          fontSize: 15*ffem,
                                                          fontWeight: FontWeight.w400,
                                                          height: 1.2125*ffem/fem,
                                                          color: Color(0xff000000),
                                                        ),
                                                      ),
                                                      TextSpan(
                                                        text: 'Analysis',
                                                        style: SafeGoogleFont (
                                                          'Inter',
                                                          fontSize: 15*ffem,
                                                          fontWeight: FontWeight.w700,
                                                          height: 1.2125*ffem/fem,
                                                          color: Color(0xff000000),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                // analysisdetailo8p (I461:1668;461:1543)
                                                margin: EdgeInsets.fromLTRB(4.07*fem, 0*fem, 0*fem, 0*fem),
                                                child: Text(
                                                  'Analysis Detail',
                                                  style: SafeGoogleFont (
                                                    'Raleway',
                                                    fontSize: 11*ffem,
                                                    fontWeight: FontWeight.w400,
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

                                    //view transaction
                                    TextButton(
                                      // adminviewtransactionima (461:1673)
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => PaymentTransactionsView()),
                                        );
                                      },
                                      style: TextButton.styleFrom (
                                        padding: EdgeInsets.zero,
                                      ),
                                      child: Container(
                                        padding: EdgeInsets.fromLTRB(15.79*fem, 15.23*fem, 23.21*fem, 7.84*fem),
                                        width: 130*fem,
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
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              // transactionQ8c (I461:1673;461:1558)
                                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 7.78*fem),
                                              width: 20*fem,
                                              height: 20*fem,
                                              child: Image.asset(
                                                'assets/page-1/images/transaction.png',
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                            Container(
                                              // viewtransaction8qJ (I461:1673;461:1556)
                                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 12.16*fem),
                                              constraints: BoxConstraints (
                                                maxWidth: 85*fem,
                                              ),
                                              child: RichText(
                                                text: TextSpan(
                                                  style: SafeGoogleFont (
                                                    'Raleway',
                                                    fontSize: 15*ffem,
                                                    fontWeight: FontWeight.w400,
                                                    height: 1.1740000407*ffem/fem,
                                                    color: Color(0xff000000),
                                                  ),
                                                  children: [
                                                    TextSpan(
                                                      text: 'View\n',
                                                      style: SafeGoogleFont (
                                                        'Raleway',
                                                        fontSize: 15*ffem,
                                                        fontWeight: FontWeight.w400,
                                                        height: 1.175*ffem/fem,
                                                        color: Color(0xff000000),
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text: 'Transaction',
                                                      style: SafeGoogleFont (
                                                        'Raleway',
                                                        fontSize: 15*ffem,
                                                        fontWeight: FontWeight.w700,
                                                        height: 1.175*ffem/fem,
                                                        color: Color(0xff000000),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Text(
                                              // transactiondetailG4L (I461:1673;461:1557)
                                              'Transaction Detail',
                                              style: SafeGoogleFont (
                                                'Raleway',
                                                fontSize: 11*ffem,
                                                fontWeight: FontWeight.w400,
                                                height: 1.175*ffem/fem,
                                                color: Color(0xff000000),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 11*fem,
                              ),
                              Container(
                                // autogroupe3zwzFE (SGJ4z25fVXthqH1J1AE3ZW)
                                margin: EdgeInsets.fromLTRB(4*fem, 0*fem, 46*fem, 0*fem),
                                width: double.infinity,
                                height: 112*fem,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [

                                    //add user >>>>>>>>>>>>
                                    Container(
                                      // adminadduserKYQ (629:483)
                                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 11*fem, 0*fem),
                                      child: TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => SignUpScreen()),
                                          );
                                        },
                                        style: TextButton.styleFrom (
                                          padding: EdgeInsets.zero,
                                        ),
                                        child: Container(
                                          padding: EdgeInsets.fromLTRB(15.79*fem, 15.23*fem, 15.79*fem, 16.57*fem),
                                          width: 130*fem,
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
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                // addusermalekdi (I629:483;626:399)
                                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 6.88*fem),
                                                width: 20*fem,
                                                height: 20*fem,
                                                child: Image.asset(
                                                  'assets/page-1/images/add-user-male.png',
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                              Container(
                                                // adduserUpc (I629:483;626:396)
                                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 4.32*fem),
                                                constraints: BoxConstraints (
                                                  maxWidth: 34*fem,
                                                ),
                                                child: RichText(
                                                  text: TextSpan(
                                                    style: SafeGoogleFont (
                                                      'Raleway',
                                                      fontSize: 15*ffem,
                                                      fontWeight: FontWeight.w400,
                                                      height: 1.1740000407*ffem/fem,
                                                      color: Color(0xff000000),
                                                    ),
                                                    children: [
                                                      TextSpan(
                                                        text: 'Add\n',
                                                        style: SafeGoogleFont (
                                                          'Raleway',
                                                          fontSize: 15*ffem,
                                                          fontWeight: FontWeight.w400,
                                                          height: 1.175*ffem/fem,
                                                          color: Color(0xff000000),
                                                        ),
                                                      ),
                                                      TextSpan(
                                                        text: 'User',
                                                        style: SafeGoogleFont (
                                                          'Raleway',
                                                          fontSize: 15*ffem,
                                                          fontWeight: FontWeight.w700,
                                                          height: 1.175*ffem/fem,
                                                          color: Color(0xff000000),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                // addonuserp1J (I629:483;626:397)
                                                'Add On User',
                                                style: SafeGoogleFont (
                                                  'Raleway',
                                                  fontSize: 11*ffem,
                                                  fontWeight: FontWeight.w400,
                                                  height: 1.175*ffem/fem,
                                                  color: Color(0xff000000),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),

                                    //view visitor history>>>>>>>>>
                                    TextButton(
                                      // adminviewvisitorAL4 (629:488)
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => VisitorVehicleListView()),
                                        );
                                      },
                                      style: TextButton.styleFrom (
                                        padding: EdgeInsets.zero,
                                      ),
                                      child: Container(
                                        padding: EdgeInsets.fromLTRB(16.71*fem, 15.23*fem, 31.29*fem, 16.57*fem),
                                        width: 130*fem,
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
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              // viewEqi (I629:488;626:413)
                                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 6.88*fem),
                                              width: 20*fem,
                                              height: 20*fem,
                                              child: Image.asset(
                                                'assets/page-1/images/view-gjv.png',
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                            Container(
                                              // viewvisitorNBE (I629:488;626:402)
                                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 4.32*fem),
                                              constraints: BoxConstraints (
                                                maxWidth: 46*fem,
                                              ),
                                              child: RichText(
                                                text: TextSpan(
                                                  style: SafeGoogleFont (
                                                    'Raleway',
                                                    fontSize: 15*ffem,
                                                    fontWeight: FontWeight.w400,
                                                    height: 1.1740000407*ffem/fem,
                                                    color: Color(0xff000000),
                                                  ),
                                                  children: [
                                                    TextSpan(
                                                      text: 'View\n',
                                                      style: SafeGoogleFont (
                                                        'Raleway',
                                                        fontSize: 15*ffem,
                                                        fontWeight: FontWeight.w400,
                                                        height: 1.175*ffem/fem,
                                                        color: Color(0xff000000),
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text: 'Visitor',
                                                      style: SafeGoogleFont (
                                                        'Raleway',
                                                        fontSize: 15*ffem,
                                                        fontWeight: FontWeight.w700,
                                                        height: 1.175*ffem/fem,
                                                        color: Color(0xff000000),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Text(
                                              // seeovervisitorHSc (I629:488;626:403)
                                              'See Over Visitor',
                                              style: SafeGoogleFont (
                                                'Raleway',
                                                fontSize: 11*ffem,
                                                fontWeight: FontWeight.w400,
                                                height: 1.175*ffem/fem,
                                                color: Color(0xff000000),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
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
                // smartsecurityRYp (300:3741)
                left: -10*fem,
                top: 199*fem,
                child: Center(
                  child: Align(
                    child: SizedBox(
                      width: 258*fem,
                      height: 50*fem,
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: SafeGoogleFont (
                            'Raleway',
                            fontSize: 21*ffem,
                            fontWeight: FontWeight.w600,
                            height: 1.1740000589*ffem/fem,
                            color: Color(0xff323130),
                          ),
                          children: [
                            TextSpan(
                              text: 'Welcome Admin!\n',
                              style: SafeGoogleFont (
                                'Raleway',
                                fontSize: 21*ffem,
                                fontWeight: FontWeight.w600,
                                height: 1.175*ffem/fem,
                                color: Color(0xff323130),
                              ),
                            ),
                            TextSpan(
                              text: userName,
                              style: SafeGoogleFont (
                                'Raleway',
                                fontSize: 21*ffem,
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
                // smarthomesystemonphonescreenXk (300:3745)
                left: 107*fem,
                top: 59*fem,
                child: Align(
                  child: SizedBox(
                    width: 343*fem,
                    height: 343*fem,
                    child: Image.asset(
                      'assets/page-1/images/smart-home-system-on-phone-screen.png',
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
}
