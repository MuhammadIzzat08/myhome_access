import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myhome_access/View/fine_payment.dart';
import 'package:myhome_access/View/patrol_report.dart';
import 'package:myhome_access/View/patrol_schedule.dart';
import 'package:myhome_access/View/visitor_vehicle.dart';
import 'package:myhome_access/payment_transaction.dart';
import 'package:myhome_access/utils.dart';
import 'package:myhome_access/View/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Controller/visitor_vehicle.dart';

import 'View/emergency_alert.dart';
import 'View/fine_visitor_vehicle.dart';
import 'View/notification.dart';
import 'View/user_profile.dart';

class MainMenuGuard extends StatefulWidget {
  @override
  _MainMenuGuardState createState() => _MainMenuGuardState();
}




/*SearchNumberPlateView()*//*
),
                    );
                  },
                ),
                ListTile(
                  title: Text('check plate'),
                  onTap: () {
                    Navigator.of(context).pop(); // Close the dialog
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PatrolScreen() */
/*SearchNumberPlateView()*//*
),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}*/

class _MainMenuGuardState extends State<MainMenuGuard> {
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
    print('Attempting to fetch userName for email: $userEmail');  // Debugging
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('email', isEqualTo: userEmail)
          .get();

      print('Query snapshot size: ${querySnapshot.size}');  // Debugging

      if (querySnapshot.docs.isNotEmpty) {
        userName = querySnapshot.docs.first.get('name') as String?;
        print('Fetched userName from Firestore: $userName');  // Debugging
      } else {
        print('No documents found for email: $userEmail');  // Debugging
      }
    } catch (error) {
      print('Error fetching user name: $error');  // Debugging
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
          // homepageguardpatrolreportjjJ (300:3719)
          width: double.infinity,
          height: 926*fem,
          child: Stack(
            children: [
              Positioned(
                // signinpagefcx (300:3720)
                left: 0*fem,
                top: 1*fem,
                child: Container(
                  padding: EdgeInsets.fromLTRB(15*fem, 54*fem, 9*fem, 38*fem),
                  width: 428*fem,
                  height: 926*fem,
                  decoration: BoxDecoration (
                    color: Color(0xffffffff),
                  ),
                  child: Container(
                    // frameyNk (300:3722)
                    width: double.infinity,
                    height: double.infinity,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // autogrouppk76Jvp (SGJAfGniFVrCFGhWK3Pk76)
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 26*fem, 331.5*fem),
                              width: double.infinity,
                              height: 50*fem,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    // guardlogoutdiC (405:1922)
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
                                          // logoutroundedmJc (I405:1922;405:1883)
                                          child: SizedBox(
                                            width: 50*fem,
                                            height: 50*fem,
                                            child: Image.asset(
                                              'assets/page-1/images/logout-rounded-ckU.png',
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                        
                                  //edit profile>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                                  Expanded(
                                    child: TextButton(
                                      // guardprofilebuttonJJY (405:1721)
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
                                          // maleuserFUg (I405:1721;405:1701)
                                          child: SizedBox(
                                            width: 50*fem,
                                            height: 50*fem,
                                            child: Image.asset(
                                              'assets/page-1/images/male-user.png',
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
                              // mainmenuPat (630:494)
                              child: Container(
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 178*fem, 24.5*fem),
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
                            Container(
                              // autogroupn2qjV88 (SGJAqmVE1KND1Hocdbn2qJ)
                              margin: EdgeInsets.fromLTRB(47*fem, 0*fem, 0*fem, 12*fem),
                              width: 357*fem,
                              height: 125*fem,
                              child: Stack(
                        
                                //patrol report>>>>>>>>>>>>>>>>>>>>>>>>>>
                                children: [
                                  Positioned(
                                    // patrolreportbuttonDK2 (300:3803)
                                    left: 0*fem,
                                    top: 0*fem,
                                    child: TextButton(
                                      onPressed: ()async {
                        
                                        final prefs = await SharedPreferences.getInstance();
                                        String? userEmail = prefs.getString('userEmail');
                        
                                        // Adding a delay
                                        await Future.delayed(Duration(milliseconds: 500));
                        
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => PatrolReportScreen(userEmail: userEmail!)),
                                        );
                        
                                      },
                                      style: TextButton.styleFrom (
                                        padding: EdgeInsets.zero,
                                      ),
                                      child: Container(
                                        width: 196*fem,
                                        height: 125*fem,
                                        child: Stack(
                                          children: [
                                            Positioned(
                                              // rectangle188B6 (I300:3803;203:465)
                                              left: 0*fem,
                                              top: 0*fem,
                                              child: Align(
                                                child: SizedBox(
                                                  width: 142.62*fem,
                                                  height: 125*fem,
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
                                              // smartsecurityCgk (I300:3803;203:470)
                                              left: 19.1220703125*fem,
                                              top: 96.375*fem,
                                              child: Align(
                                                child: SizedBox(
                                                  width: 83*fem,
                                                  height: 16*fem,
                                                  child: Text(
                                                    'Make a report',
                                                    style: SafeGoogleFont (
                                                      'Raleway',
                                                      fontSize: 13*ffem,
                                                      fontWeight: FontWeight.w400,
                                                      height: 1.175*ffem/fem,
                                                      color: Color(0xff000000),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              // patrolreporth7i (I300:3803;203:474)
                                              left: 18.3251953125*fem,
                                              top: 53.90625*fem,
                                              child: Align(
                                                child: SizedBox(
                                                  width: 106*fem,
                                                  height: 20*fem,
                                                  child: RichText(
                                                    text: TextSpan(
                                                      style: SafeGoogleFont (
                                                        'Raleway',
                                                        fontSize: 17*ffem,
                                                        fontWeight: FontWeight.w400,
                                                        height: 1.1740000108*ffem/fem,
                                                        color: Color(0xff000000),
                                                      ),
                                                      children: [
                                                        TextSpan(
                                                          text: 'Patrol ',
                                                          style: SafeGoogleFont (
                                                            'Raleway',
                                                            fontSize: 17*ffem,
                                                            fontWeight: FontWeight.w400,
                                                            height: 1.175*ffem/fem,
                                                            color: Color(0xff000000),
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text: 'Report',
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
                                              ),
                                            ),
                                            Positioned(
                                              // customsNdA (I300:3803;300:3754)
                                              left: 18.3251953125*fem,
                                              top: 22.65625*fem,
                                              child: Align(
                                                child: SizedBox(
                                                  width: 23.9*fem,
                                                  height: 23.44*fem,
                                                  child: Image.asset(
                                                    'assets/page-1/images/customs-MMn.png',
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
                        
                                  //emergency alert view button>>>>>>>>>>>>>>
                                  Positioned(
                                    // emergencyalertviewbutton63N (461:1639)
                                    left: 161*fem,
                                    top: 0*fem,
                                    child: TextButton(
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
                                        width: 196*fem,
                                        height: 125*fem,
                                        child: Stack(
                                          children: [
                                            Positioned(
                                              // rectangle19CMJ (I461:1639;203:467)
                                              left: 0*fem,
                                              top: 0*fem,
                                              child: Align(
                                                child: SizedBox(
                                                  width: 140.34*fem,
                                                  height: 125*fem,
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
                                              // emergencyalertviewgnG (I461:1639;203:469)
                                              left: 23*fem,
                                              top: 47*fem,
                                              child: Align(
                                                child: SizedBox(
                                                  width: 95*fem,
                                                  height: 40*fem,
                                                  child: RichText(
                                                    text: TextSpan(
                                                      style: SafeGoogleFont (
                                                        'Raleway',
                                                        fontSize: 17*ffem,
                                                        fontWeight: FontWeight.w400,
                                                        height: 1.1740000108*ffem/fem,
                                                        color: Color(0xff000000),
                                                      ),
                                                      children: [
                                                        TextSpan(
                                                          text: 'Emergency \n',
                                                          style: SafeGoogleFont (
                                                            'Raleway',
                                                            fontSize: 17*ffem,
                                                            fontWeight: FontWeight.w400,
                                                            height: 1.175*ffem/fem,
                                                            color: Color(0xff000000),
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text: 'Alert View',
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
                                              ),
                                            ),
                                            Positioned(
                                              // smartsecurityyPz (I461:1639;203:472)
                                              left: 21*fem,
                                              top: 96.03125*fem,
                                              child: Align(
                                                child: SizedBox(
                                                  width: 106*fem,
                                                  height: 16*fem,
                                                  child: Text(
                                                    'View list of report',
                                                    style: SafeGoogleFont (
                                                      'Raleway',
                                                      fontSize: 13*ffem,
                                                      fontWeight: FontWeight.w400,
                                                      height: 1.175*ffem/fem,
                                                      color: Color(0xff000000),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              // viewfnc (I461:1639;203:477)
                                              left: 21*fem,
                                              top: 18*fem,
                                              child: Align(
                                                child: SizedBox(
                                                  width: 25*fem,
                                                  height: 25*fem,
                                                  child: Image.asset(
                                                    'assets/page-1/images/view-txL.png',
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
                        
                        
                        
                            //guard fine >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                            Container(
                              // guardfinevisitorCnY (638:521)
                              margin: EdgeInsets.fromLTRB(124*fem, 0*fem, 137*fem, 12*fem),
                              child: TextButton(
                                onPressed: () {
                                  _showChoiceDialog2(context);
                                 /* Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => PatrolScreen()),
                                  );*/
                                },
                                style: TextButton.styleFrom (
                                  padding: EdgeInsets.zero,
                                ),
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(22*fem, 21*fem, 30*fem, 18.5*fem),
                                  width: double.infinity,
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
                                        // policefineFF2 (I638:521;638:500)
                                        margin: EdgeInsets.fromLTRB(4*fem, 0*fem, 0*fem, 8*fem),
                                        width: 35*fem,
                                        height: 35*fem,
                                        child: Image.asset(
                                          'assets/page-1/images/police-fine.png',
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                      Container(
                                        // finevisitorNaY (I638:521;638:497)
                                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 7.5*fem),
                                        child: RichText(
                                          text: TextSpan(
                                            style: SafeGoogleFont (
                                              'Raleway',
                                              fontSize: 17*ffem,
                                              fontWeight: FontWeight.w700,
                                              height: 1.1740000108*ffem/fem,
                                              color: Color(0xff000000),
                                            ),
                                            children: [
                                              TextSpan(
                                                text: 'Fine ',
                                                style: SafeGoogleFont (
                                                  'Raleway',
                                                  fontSize: 17*ffem,
                                                  fontWeight: FontWeight.w400,
                                                  height: 1.175*ffem/fem,
                                                  color: Color(0xff000000),
                                                ),
                                              ),
                                              TextSpan(
                                                text: 'Visitor',
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
                                        // finevisitor69A (I638:521;638:498)
                                        margin: EdgeInsets.fromLTRB(4*fem, 0*fem, 0*fem, 0*fem),
                                        child: RichText(
                                          text: TextSpan(
                                            style: SafeGoogleFont (
                                              'Raleway',
                                              fontSize: 13*ffem,
                                              fontWeight: FontWeight.w700,
                                              height: 1.1740000065*ffem/fem,
                                              color: Color(0xff000000),
                                            ),
                                            children: [
                                              TextSpan(
                                                text: 'Fine ',
                                                style: SafeGoogleFont (
                                                  'Raleway',
                                                  fontSize: 13*ffem,
                                                  fontWeight: FontWeight.w400,
                                                  height: 1.175*ffem/fem,
                                                  color: Color(0xff000000),
                                                ),
                                              ),
                                              TextSpan(
                                                text: 'Visitor',
                                                style: SafeGoogleFont (
                                                  'Raleway',
                                                  fontSize: 13*ffem,
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
                              ),
                            ),
                            Container(
                              // autogroupqpwgEeg (SGJBBkuv7T23QNfvCBqpWG)
                              margin: EdgeInsets.fromLTRB(45*fem, 0*fem, 0*fem, 0*fem),
                              width: 357*fem,
                              height: 125*fem,
                              child: Stack(
                                children: [
                        
                                  //patrol schedule>>>>>>>>>>>>>>>
                                  Positioned(
                                    // patrolschedulebuttonAYL (300:3814)
                                    left: 0*fem,
                                    top: 0*fem,
                                    child: TextButton(
                                      onPressed: () {
                                        _showChoiceDialog(context);
                                      },
                                      style: TextButton.styleFrom (
                                        padding: EdgeInsets.zero,
                                      ),
                                      child: Container(
                                        width: 196*fem,
                                        height: 125*fem,
                                        child: Stack(
                                          children: [
                                            Positioned(
                                              // rectangle20rRA (I300:3814;203:466)
                                              left: 0*fem,
                                              top: 0*fem,
                                              child: Align(
                                                child: SizedBox(
                                                  width: 142.62*fem,
                                                  height: 125*fem,
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
                                              // smartsecurityuuE (I300:3814;203:471)
                                              left: 19.1220703125*fem,
                                              top: 93.5625*fem,
                                              child: Align(
                                                child: SizedBox(
                                                  width: 89*fem,
                                                  height: 16*fem,
                                                  child: Text(
                                                    'View schedule',
                                                    style: SafeGoogleFont (
                                                      'Raleway',
                                                      fontSize: 13*ffem,
                                                      fontWeight: FontWeight.w400,
                                                      height: 1.175*ffem/fem,
                                                      color: Color(0xff000000),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              // patrolschedulecYk (I300:3814;203:479)
                                              left: 17.5283203125*fem,
                                              top: 49*fem,
                                              child: Align(
                                                child: SizedBox(
                                                  width: 78*fem,
                                                  height: 40*fem,
                                                  child: RichText(
                                                    text: TextSpan(
                                                      style: SafeGoogleFont (
                                                        'Raleway',
                                                        fontSize: 17*ffem,
                                                        fontWeight: FontWeight.w400,
                                                        height: 1.1740000108*ffem/fem,
                                                        color: Color(0xff000000),
                                                      ),
                                                      children: [
                                                        TextSpan(
                                                          text: 'Patrol ',
                                                          style: SafeGoogleFont (
                                                            'Raleway',
                                                            fontSize: 17*ffem,
                                                            fontWeight: FontWeight.w400,
                                                            height: 1.175*ffem/fem,
                                                            color: Color(0xff000000),
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text: 'Schedule',
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
                                              ),
                                            ),
                                            Positioned(
                                              // schedulekHa (I300:3814;203:483)
                                              left: 21*fem,
                                              top: 18*fem,
                                              child: Align(
                                                child: SizedBox(
                                                  width: 25*fem,
                                                  height: 25*fem,
                                                  child: Image.asset(
                                                    'assets/page-1/images/schedule-8nY.png',
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
                        
                                  //make emergency alert>>>>>>>>>>>>
                                  Positioned(
                                    // emergencyalertbuttonssz (461:1657)
                                    left: 161*fem,
                                    top: 0*fem,
                                    child: TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => EmergencyScreen(userEmail: userEmail!,)),
                                        );
                                      },
                                      style: TextButton.styleFrom (
                                        padding: EdgeInsets.zero,
                                      ),
                                      child: Container(
                                        width: 196*fem,
                                        height: 125*fem,
                                        child: Container(
                                          // group6p2Y (I461:1657;300:3791)
                                          width: double.infinity,
                                          height: double.infinity,
                                          decoration: BoxDecoration (
                                            borderRadius: BorderRadius.circular(20*fem),

                                          ),
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                // rectangle21x8k (I461:1657;203:475)
                                                left: 0*fem,
                                                top: 0*fem,
                                                child: Align(
                                                  child: SizedBox(
                                                    width: 143.2*fem,
                                                    height: 125*fem,
                                                    child: TextButton(
                                                      onPressed: () {
                        
                                                      },
                                                      style: TextButton.styleFrom (
                                                        padding: EdgeInsets.zero,
                                                      ),
                                                      child: Image.asset(
                                                        'assets/page-1/images/rectangle-21-Udi.png',
                                                        width: 143.2*fem,
                                                        height: 125*fem,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                // smartsecurityT5W (I461:1657;203:476)
                                                left: 18.3999023438*fem,
                                                top: 93.5625*fem,
                                                child: Align(
                                                  child: SizedBox(
                                                    width: 82*fem,
                                                    height: 16*fem,
                                                    child: Text(
                                                      'Make an alert',
                                                      style: SafeGoogleFont (
                                                        'Raleway',
                                                        fontSize: 13*ffem,
                                                        fontWeight: FontWeight.w400,
                                                        height: 1.175*ffem/fem,
                                                        color: Color(0xff000000),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                // emergencyalertMAt (I461:1657;203:480)
                                                left: 19*fem,
                                                top: 47*fem,
                                                child: Align(
                                                  child: SizedBox(
                                                    width: 91*fem,
                                                    height: 40*fem,
                                                    child: RichText(
                                                      text: TextSpan(
                                                        style: SafeGoogleFont (
                                                          'Raleway',
                                                          fontSize: 17*ffem,
                                                          fontWeight: FontWeight.w400,
                                                          height: 1.1740000108*ffem/fem,
                                                          color: Color(0xff000000),
                                                        ),
                                                        children: [
                                                          TextSpan(
                                                            text: 'Emergency\n',
                                                            style: SafeGoogleFont (
                                                              'Raleway',
                                                              fontSize: 17*ffem,
                                                              fontWeight: FontWeight.w400,
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
                                                ),
                                              ),
                                              Positioned(
                                                // alarmFvU (I461:1657;203:482)
                                                left: 21*fem,
                                                top: 18*fem,
                                                child: Align(
                                                  child: SizedBox(
                                                    width: 25*fem,
                                                    height: 25*fem,
                                                    child: Image.asset(
                                                      'assets/page-1/images/alarm.png',
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
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                  ),
                ),
              ),
              Positioned(
                // smartsecurityBp8 (300:3735)
                left: 3*fem,
                top: 147.5*fem,
                child: Center(
                  child: Align(
                    child: SizedBox(
                      width: 280*fem,
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
                              text: 'Welcome Guard!\n',
                              style: SafeGoogleFont (
                                'Raleway',
                                fontSize: 24*ffem,
                                fontWeight: FontWeight.w600,
                                height: 1.175*ffem/fem,
                                color: Color(0xff323130),
                              ),
                            ),
                            TextSpan(
                              text: userName,
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
                // driverlesstaxitoanypointofthec (300:3738)
                left: 135*fem,
                top: 164*fem,
                child: Align(
                  child: SizedBox(
                    width: 293*fem,
                    height: 293*fem,
                    child: Image.asset(
                      'assets/page-1/images/driverless-taxi-to-any-point-of-the-city.png',
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
  Future<void> _showChoiceDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Choose an Option'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                ListTile(
                  title: Text('View Your Schedule'),
                  onTap: () {
                    Navigator.of(context).pop(); // Close the dialog
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PatrolScheduleView()),
                    );
                  },
                ),
                ListTile(
                  title: Text('View All Schedule'),
                  onTap: () {
                    Navigator.of(context).pop(); // Close the dialog
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PatrolScheduleViewAll()),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _showChoiceDialog2(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Choose an Option'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                ListTile(
                  title: Text('Fine Visitor Vehicle'),
                  onTap: () {
                    Navigator.of(context).pop(); // Close the dialog
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PatrolScreen()),
                    );
                  },
                ),
                ListTile(
                  title: Text('View Visitor Payment'),
                  onTap: () {
                    Navigator.of(context).pop(); // Close the dialog
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PaymentTransactionsView()),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}