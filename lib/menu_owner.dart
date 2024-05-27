import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myhome_access/View/emergency_alert.dart';
import 'package:myhome_access/View/history_logs.dart';
import 'package:myhome_access/View/notification.dart';
import 'package:myhome_access/View/patrol_report.dart';
import 'package:myhome_access/View/patrol_schedule.dart';
import 'package:myhome_access/View/vehicle_view.dart';
import 'package:myhome_access/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'View/login_screen.dart';
import 'View/user_profile.dart';
import 'View/visitor_vehicle.dart';






import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';


//class MainMenuAdmin extends StatelessWidget {

class MainMenuOwner extends StatefulWidget {

  @override
  _MainMenuAdminState createState() => _MainMenuAdminState();
}


/*class _MainMenuAdminState extends State<MainMenuOwner> {
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
    return Container(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Container(
          // homepageadmin1yX (300:3726)
          width: double.infinity,
          height: 926*fem,
          child: Stack(
            children: [
              Positioned(
                // signinpagekRK (300:3727)
                left: 0*fem,
                top: 0*fem,
                child: Container(
                  padding: EdgeInsets.fromLTRB(15*fem, 54*fem, 0*fem, 76*fem),
                  width: 428*fem,
                  height: 926*fem,
                  decoration: BoxDecoration (
                    color: Color(0xffffffff),
                  ),
                  child: Container(
                    // framedzu (300:3729)
                    width: 459*fem,
                    height: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          // autogroupzsbwyYy (LBwrr3848Zav9PMGoJZSbw)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 408*fem),
                          width: double.infinity,
                          height: 50*fem,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // logoutroundedHJm (400:1351)
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
                                      // logoutroundedPsb (I400:1351;381:741)
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

                              //edit profile>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                              Expanded(
                                child: TextButton(
                                  // userprofilebuttonvcd (400:1353)
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
                                      // maleuserfq7 (I400:1353;324:4002)
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



                        //delete information>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                        Container(
                          // autogroup4xah1PB (LBwrysELohR5vCCwaT4xaH)
                          margin: EdgeInsets.fromLTRB(11*fem, 0*fem, 0*fem, 18*fem),
                          width: 448*fem,
                          height: 160*fem,
                          child: Stack(
                            children: [

                              //Delete user
                              Positioned(
                                // register visitor (304:3862)
                                left: 0*fem,
                                top: 0*fem,
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => VisitorRegistrationView()),
                                    );
                                  },
                                  style: TextButton.styleFrom (
                                    padding: EdgeInsets.zero,
                                  ),
                                  child: Container(
                                    width: 245*fem,
                                    height: 160*fem,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          // rectangle18RSu (I304:3862;203:503)
                                          left: 0*fem,
                                          top: 0*fem,
                                          child: Align(
                                            child: SizedBox(
                                              width: 179*fem,
                                              height: 160*fem,
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
                                        Positioned(
                                          // smartsecuritytbP (I304:3862;203:508)
                                          left: 23*fem,
                                          top: 124.5*fem,
                                          child: Align(
                                            child: SizedBox(
                                              width: 140*fem,
                                              height: 16*fem,
                                              child: Text(
                                                'Register Visitor',
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
                                          // deleteinformationy73 (I304:3862;203:525)
                                          left: 22*fem,
                                          top: 65*fem,
                                          child: Align(
                                            child: SizedBox(
                                              width: 107*fem,
                                              height: 45*fem,
                                              child: RichText(
                                                text: TextSpan(
                                                  style: SafeGoogleFont (
                                                    'Raleway',
                                                    fontSize: 19*ffem,
                                                    fontWeight: FontWeight.w400,
                                                    height: 1.1739999872*ffem/fem,
                                                    color: Color(0xff000000),
                                                  ),
                                                  children: [
                                                    TextSpan(
                                                      text: 'Register\n',
                                                      style: SafeGoogleFont (
                                                        'Raleway',
                                                        fontSize: 19*ffem,
                                                        fontWeight: FontWeight.w400,
                                                        height: 1.175*ffem/fem,
                                                        color: Color(0xff000000),
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text: 'Visitor',
                                                      style: SafeGoogleFont (
                                                        'Raleway',
                                                        fontSize: 19*ffem,
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
                                          // fulltrashMWu (I304:3862;300:3749)
                                          left: 23*fem,
                                          top: 25*fem,
                                          child: Align(
                                            child: SizedBox(
                                              width: 30*fem,
                                              height: 30*fem,
                                              child: Image.asset(
                                                'assets/page-1/images/full-trash-1vm.png',
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


                              //emergency alert>>>>>>>>>>>>>>>>>>>>>>>>
                              Positioned(
                                // emergency alert notification U5j (304:3868)
                                left: 203*fem,
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
                                    width: 245*fem,
                                    height: 160*fem,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          // rectangle19Az9 (I304:3868;203:505)
                                          left: 0*fem,
                                          top: 0*fem,
                                          child: Align(
                                            child: SizedBox(
                                              width: 179*fem,
                                              height: 160*fem,
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
                                        Positioned(
                                          // smartsecurityfAD (I304:3868;203:510)
                                          left: 23*fem,
                                          top: 122*fem,
                                          child: Align(
                                            child: SizedBox(
                                              width: 95*fem,
                                              height: 18*fem,
                                              child: Text(
                                                'Notification',
                                                style: SafeGoogleFont (
                                                  'Raleway',
                                                  fontSize: 15*ffem,
                                                  fontWeight: FontWeight.w400,
                                                  height: 1.175*ffem/fem,
                                                  color: Color(0xff000000),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          // editpatrolscheduleZFb (I304:3868;207:528)
                                          left: 23*fem,
                                          top: 70*fem,
                                          child: Align(
                                            child: SizedBox(
                                              width: 131*fem,
                                              height: 43*fem,
                                              child: RichText(
                                                text: TextSpan(
                                                  style: SafeGoogleFont (
                                                    'Raleway',
                                                    fontSize: 19*ffem,
                                                    fontWeight: FontWeight.w400,
                                                    height: 1.1739999872*ffem/fem,
                                                    color: Color(0xff000000),
                                                  ),
                                                  children: [
                                                    TextSpan(
                                                      text: 'View \n',
                                                      style: SafeGoogleFont (
                                                        'Raleway',
                                                        fontSize: 19*ffem,
                                                        fontWeight: FontWeight.w400,
                                                        height: 1.175*ffem/fem,
                                                        color: Color(0xff000000),
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text: 'Emergency Alert',
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
                                          // editTEV (I304:3868;207:526)
                                          left: 18*fem,
                                          top: 25*fem,
                                          child: Align(
                                            child: SizedBox(
                                              width: 30*fem,
                                              height: 30*fem,
                                              child: Image.asset(
                                                'assets/page-1/images/edit-CVs.png',
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



                        //view history logs>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                        Container(
                          // autogroup6rtsAPo (LBwsChCJWNADHmnBkF6RTs)
                          margin: EdgeInsets.fromLTRB(14*fem, 0*fem, 0*fem, 0*fem),
                          width: 445*fem,
                          height: 160*fem,
                          child: Stack(
                            children: [
                              Positioned(
                                // viewhistorylogsbuttonHDX (304:3873)
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
                                    width: 242*fem,
                                    height: 160*fem,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          // rectangle20yMF (I304:3873;203:504)
                                          left: 0*fem,
                                          top: 0*fem,
                                          child: Align(
                                            child: SizedBox(
                                              width: 179*fem,
                                              height: 160*fem,
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
                                        Positioned(
                                          // smartsecurityF3s (I304:3873;203:509)
                                          left: 20*fem,
                                          top: 125*fem,
                                          child: Align(
                                            child: SizedBox(
                                              width: 85*fem,
                                              height: 18*fem,
                                              child: Text(
                                                'View history',
                                                style: SafeGoogleFont (
                                                  'Raleway',
                                                  fontSize: 15*ffem,
                                                  fontWeight: FontWeight.w400,
                                                  height: 1.175*ffem/fem,
                                                  color: Color(0xff000000),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          // viewhistorylogs8tM (I304:3873;207:531)
                                          left: 21*fem,
                                          top: 64*fem,
                                          child: Align(
                                            child: SizedBox(
                                              width: 114*fem,
                                              height: 45*fem,
                                              child: RichText(
                                                text: TextSpan(
                                                  style: SafeGoogleFont (
                                                    'Raleway',
                                                    fontSize: 19*ffem,
                                                    fontWeight: FontWeight.w400,
                                                    height: 1.1739999872*ffem/fem,
                                                    color: Color(0xff000000),
                                                  ),
                                                  children: [
                                                    TextSpan(
                                                      text: 'View\n',
                                                      style: SafeGoogleFont (
                                                        'Raleway',
                                                        fontSize: 19*ffem,
                                                        fontWeight: FontWeight.w400,
                                                        height: 1.175*ffem/fem,
                                                        color: Color(0xff000000),
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text: 'History Logs',
                                                      style: SafeGoogleFont (
                                                        'Raleway',
                                                        fontSize: 19*ffem,
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
                                          // viewS1s (I304:3873;207:529)
                                          left: 20*fem,
                                          top: 21*fem,
                                          child: Align(
                                            child: SizedBox(
                                              width: 30*fem,
                                              height: 30*fem,
                                              child: Image.asset(
                                                'assets/page-1/images/view-Fcy.png',
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


                              //view patrol report >>>>>>>>>>>>>>>>>>>>>>>>>
                              Positioned(
                                // viewpatrolreportbuttonYqb (405:1428)
                                left: 203*fem,
                                top: 0*fem,
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => PatrolScheduleViewAll()),
                                    );
                                  },
                                  style: TextButton.styleFrom (
                                    padding: EdgeInsets.zero,
                                  ),
                                  child: Container(
                                    width: 242*fem,
                                    height: 160*fem,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          // rectangle20qZo (I405:1428;405:1414)
                                          left: 0*fem,
                                          top: 0*fem,
                                          child: Align(
                                            child: SizedBox(
                                              width: 179*fem,
                                              height: 160*fem,
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
                                        Positioned(
                                          // smartsecurityUMs (I405:1428;405:1415)
                                          left: 20*fem,
                                          top: 125*fem,
                                          child: Align(
                                            child: SizedBox(
                                              width: 81*fem,
                                              height: 18*fem,
                                              child: Text(
                                                'View Schedule',
                                                style: SafeGoogleFont (
                                                  'Raleway',
                                                  fontSize: 15*ffem,
                                                  fontWeight: FontWeight.w400,
                                                  height: 1.175*ffem/fem,
                                                  color: Color(0xff000000),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          // viewpatrolreportXL9 (I405:1428;405:1416)
                                          left: 21*fem,
                                          top: 64*fem,
                                          child: Align(
                                            child: SizedBox(
                                              width: 122*fem,
                                              height: 45*fem,
                                              child: RichText(
                                                text: TextSpan(
                                                  style: SafeGoogleFont (
                                                    'Raleway',
                                                    fontSize: 19*ffem,
                                                    fontWeight: FontWeight.w400,
                                                    height: 1.1739999872*ffem/fem,
                                                    color: Color(0xff000000),
                                                  ),
                                                  children: [
                                                    TextSpan(
                                                      text: 'View\n',
                                                      style: SafeGoogleFont (
                                                        'Raleway',
                                                        fontSize: 19*ffem,
                                                        fontWeight: FontWeight.w400,
                                                        height: 1.175*ffem/fem,
                                                        color: Color(0xff000000),
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text: 'Schedule',
                                                      style: SafeGoogleFont (
                                                        'Raleway',
                                                        fontSize: 19*ffem,
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
                                          // viewPmf (I405:1428;405:1426)
                                          left: 20*fem,
                                          top: 21*fem,
                                          child: Align(
                                            child: SizedBox(
                                              width: 30*fem,
                                              height: 30*fem,
                                              child: Image.asset(
                                                'assets/page-1/images/view-DKj.png',
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




                              //view patrol report >>>>>>>>>>>>>>>>>>>>>>>>>
                              Positioned(
                                // viewpatrolreportbuttonYqb (405:1428)
                                left: 203*fem,
                                top: 0*fem,
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => AddVehicleView()),
                                    );
                                  },
                                  style: TextButton.styleFrom (
                                    padding: EdgeInsets.zero,
                                  ),
                                  child: Container(
                                    width: 242*fem,
                                    height: 160*fem,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          // rectangle20qZo (I405:1428;405:1414)
                                          left: 0*fem,
                                          top: 0*fem,
                                          child: Align(
                                            child: SizedBox(
                                              width: 179*fem,
                                              height: 160*fem,
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
                                        Positioned(
                                          // smartsecurityUMs (I405:1428;405:1415)
                                          left: 20*fem,
                                          top: 125*fem,
                                          child: Align(
                                            child: SizedBox(
                                              width: 81*fem,
                                              height: 18*fem,
                                              child: Text(
                                                'View Schedule',
                                                style: SafeGoogleFont (
                                                  'Raleway',
                                                  fontSize: 15*ffem,
                                                  fontWeight: FontWeight.w400,
                                                  height: 1.175*ffem/fem,
                                                  color: Color(0xff000000),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          // viewpatrolreportXL9 (I405:1428;405:1416)
                                          left: 21*fem,
                                          top: 64*fem,
                                          child: Align(
                                            child: SizedBox(
                                              width: 122*fem,
                                              height: 45*fem,
                                              child: RichText(
                                                text: TextSpan(
                                                  style: SafeGoogleFont (
                                                    'Raleway',
                                                    fontSize: 19*ffem,
                                                    fontWeight: FontWeight.w400,
                                                    height: 1.1739999872*ffem/fem,
                                                    color: Color(0xff000000),
                                                  ),
                                                  children: [
                                                    TextSpan(
                                                      text: 'View\n',
                                                      style: SafeGoogleFont (
                                                        'Raleway',
                                                        fontSize: 19*ffem,
                                                        fontWeight: FontWeight.w400,
                                                        height: 1.175*ffem/fem,
                                                        color: Color(0xff000000),
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text: 'Patrol Schedule',
                                                      style: SafeGoogleFont (
                                                        'Raleway',
                                                        fontSize: 19*ffem,
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
                                          // viewPmf (I405:1428;405:1426)
                                          left: 20*fem,
                                          top: 21*fem,
                                          child: Align(
                                            child: SizedBox(
                                              width: 30*fem,
                                              height: 30*fem,
                                              child: Image.asset(
                                                'assets/page-1/images/view-DKj.png',
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
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                // smartsecurityVZo (300:3740)
                left: 35*fem,
                top: 434.5*fem,
                child: Center(
                  child: Align(
                    child: SizedBox(
                      width: 126*fem,
                      height: 29*fem,
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
                ),
              ),
              Positioned(
                // smartsecurityNNh (300:3741)
                left: 38*fem,
                top: 147.5*fem,
                child: Center(
                  child: Align(
                    child: SizedBox(
                      width: 180*fem,
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
                              text: 'Welcome!\n',
                              style: SafeGoogleFont (
                                'Raleway',
                                fontSize: 24*ffem,
                                fontWeight: FontWeight.w600,
                                height: 1.175*ffem/fem,
                                color: Color(0xff323130),
                              ),
                            ),


                            //name display here>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
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
                // smarthomesystemonphonescreentV (300:3745)
                left: 99*fem,
                top: 148*fem,
                child: Align(
                  child: SizedBox(
                    width: 343*fem,
                    height: 343*fem,
                    child: Image.asset(
                      'assets/page-1/images/smart-home-system-on-phone-screen-CRK.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Positioned(
                // ellipse13cAZ (405:1433)
                left: 310*fem,
                top: 728*fem,
                child: Align(
                  child: SizedBox(
                    width: 26*fem,
                    height: 26*fem,
                    child: Container(
                      decoration: BoxDecoration (
                        borderRadius: BorderRadius.circular(13*fem),
                      ),
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
                  title: Text('View Emergency Alert History'),
                  onTap: () {
                    Navigator.of(context).pop(); // Close the dialog
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EmergencyAlertsListView()),
                    );
                  },
                ),
                ListTile(
                  title: Text('View Visitor History'),
                  onTap: () {
                    Navigator.of(context).pop(); // Close the dialog
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => OwnerVisitorsView()),
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

class _MainMenuAdminState extends State<MainMenuOwner> {
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
      body: SingleChildScrollView(
        //width: double.infinity,
        child: Container(
          // homepageownertenantregistervis (300:3615)
          width: double.infinity,
          height: 926*fem,
          child: Stack(
            children: [
              Positioned(
                // signinpagesV6 (300:3616)
                left: 0*fem,
                top: 0*fem,
                child: Container(
                  padding: EdgeInsets.fromLTRB(30*fem, 54*fem, 5*fem, 35*fem),
                  width: 428*fem,
                  height: 926*fem,
                  decoration: BoxDecoration (
                    color: Color(0xffffffff),
                  ),
                  child: Container(
                    // frameNwe (300:3618)
                    width: double.infinity,
                    height: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // autogroupwkdeiVi (UnwANjPqB1FRUCnX1DwKDE)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 30*fem, 374*fem),
                          width: double.infinity,
                          height: 50*fem,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // userlogoutdcg (381:747)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 263*fem, 0*fem),
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
                                      // logoutroundedmD6 (I381:747;381:741)
                                      child: SizedBox(
                                        width: 50*fem,
                                        height: 50*fem,
                                        child: Image.asset(
                                          'assets/page-1/images/logout-rounded-K6C.png',
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
      
                              //edit profile>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                              Expanded(
                                child: TextButton(
                                  // userprofilebuttonJTv (405:1613)
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
                                      // maleuserF8G (I405:1613;324:4002)
                                      child: SizedBox(
                                        width: 50*fem,
                                        height: 50*fem,
                                        child: Image.asset(
                                          'assets/page-1/images/male-user-9zk.png',
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
                        Container(
                          // autogroupjsykxoN (UnwAVeMyj6K5iUF6dPJSYk)
                          margin: EdgeInsets.fromLTRB(33*fem, 0*fem, 0*fem, 19*fem),
                          width: double.infinity,
                          height: 125*fem,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 28.29*fem, 0*fem),
      
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => VisitorRegistrationView()),
                                    );
                                  },
                                  style: TextButton.styleFrom (
                                    padding: EdgeInsets.zero,
                                  ),
                                  child: Container(
                                    // registervisitorbutton5d6 (300:3698)
      
      
                                    padding: EdgeInsets.fromLTRB(18.73*fem, 22.66*fem, 18.73*fem, 12.63*fem),
                                    width: 139.71*fem,
                                    height: double.infinity,
                                    decoration: BoxDecoration (
                                      color: Color(0xffe4d7ba),
                                      borderRadius: BorderRadius.circular(20*fem),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(0x59000000),
                                          offset: Offset(0*fem, 4*fem),
                                          blurRadius: 2*fem,
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          // addusermaleiRA (I300:3698;300:3641)
                                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 7.03*fem),
                                          width: 23.41*fem,
                                          height: 23.44*fem,
                                          child: Image.asset(
                                            'assets/page-1/images/add-user-male.png',
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                        Container(
                                          // registervisitorqEt (I300:3698;300:3631)
                                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 3.25*fem),
                                          constraints: BoxConstraints (
                                            maxWidth: 65*fem,
                                          ),
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
                                                  text: 'Register\n',
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
                                        Text(
                                          // smartsecurity5oS (I300:3698;300:3635)
                                          'Add visitor',
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
                              ),
      
      
                              TextButton(
                                // historylogsbuttonPp8 (300:3703)
                                onPressed: () {
                                  _showChoiceDialog(context);
                                },
                                style: TextButton.styleFrom (
                                  padding: EdgeInsets.zero,
                                ),
                                child: Container(
                                  width: 192*fem,
                                  height: double.infinity,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        // rectangle19KBz (I300:3703;300:3633)
                                        left: 0*fem,
                                        top: 0*fem,
                                        child: Align(
                                          child: SizedBox(
                                            width: 137.47*fem,
                                            height: 125*fem,
                                            child: Container(
                                              decoration: BoxDecoration (
                                                borderRadius: BorderRadius.circular(20*fem),
                                                color: Color(0xffe4d6ba),
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
                                      Positioned(
                                        // historylogsPxY (I300:3703;300:3634)
                                        left: 21.50390625*fem,
                                        top: 53.125*fem,
                                        child: Align(
                                          child: SizedBox(
                                            width: 56*fem,
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
                                                    text: 'History\n',
                                                    style: SafeGoogleFont (
                                                      'Raleway',
                                                      fontSize: 17*ffem,
                                                      fontWeight: FontWeight.w400,
                                                      height: 1.175*ffem/fem,
                                                      color: Color(0xff000000),
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: 'Logs',
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
                                        // smartsecurity5yn (I300:3703;300:3637)
                                        left: 21.50390625*fem,
                                        top: 96.375*fem,
                                        child: Align(
                                          child: SizedBox(
                                            width: 104*fem,
                                            height: 16*fem,
                                            child: Text(
                                              'View your history',
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
                                        // historybookmrc (I300:3703;300:3640)
                                        left: 21.50390625*fem,
                                        top: 22.65625*fem,
                                        child: Align(
                                          child: SizedBox(
                                            width: 23.04*fem,
                                            height: 23.44*fem,
                                            child: Image.asset(
                                              'assets/page-1/images/history-book.png',
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          // autogroupy5bigig (UnwAkobPNcHKhcHUeQy5bi)
                          margin: EdgeInsets.fromLTRB(33*fem, 0*fem, 54.53*fem, 19*fem),
                          width: double.infinity,
                          height: 125*fem,
                          child: Stack(
                            children: [
                              Positioned(
                                // registervehiclebuttonp4C (300:3708)
                                left: 0*fem,
                                top: 0*fem,
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => PatrolScheduleViewAll()),
                                    );
                                  },
                                  style: TextButton.styleFrom (
                                    padding: EdgeInsets.zero,
                                  ),
                                  child: Container(
                                    width: 192*fem,
                                    height: 125*fem,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          // rectangle20WBv (I300:3708;300:3632)
                                          left: 0*fem,
                                          top: 0*fem,
                                          child: Align(
                                            child: SizedBox(
                                              width: 139.71*fem,
                                              height: 125*fem,
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
                                        Positioned(
                                          // smartsecuritymde (I300:3708;300:3636)
                                          left: 18.7319335938*fem,
                                          top: 94.03125*fem,
                                          child: Align(
                                            child: SizedBox(
                                              width: 102*fem,
                                              height: 16*fem,
                                              child: Text(
                                                'Schedule Details',
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
                                          // carFYp (I300:3708;300:3645)
                                          left: 18.7319335938*fem,
                                          top: 18.75*fem,
                                          child: Align(
                                            child: SizedBox(
                                              width: 23.41*fem,
                                              height: 23.44*fem,
                                              child: Image.asset(
                                                'assets/page-1/images/customs-officer.png',
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          // registervehiclemn4 (I300:3708;300:3646)
                                          left: 14.8291015625*fem,
                                          top: 46.875*fem,
                                          child: Align(
                                            child: SizedBox(
                                              width: 105*fem,
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
                                                      text: 'Patrol\n',
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
                                      ],
                                    ),
                                  ),
                                ),
                              ),
      
                              //emergency alert button>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                              Positioned(
                                // emergencyalertbuttonejN (300:3713)
                                left: 168*fem,
                                top: 0*fem,
                                child: TextButton(
                                  onPressed: (){
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => EmergencyScreen(userEmail: userEmail!,)),
                                    );
                                  },
                                  style: TextButton.styleFrom (
                                    padding: EdgeInsets.zero,
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.fromLTRB(12.65*fem, 15.47*fem, 24.97*fem, 14.97*fem),
                                    width: 137.47*fem,
                                    height: 125*fem,
                                    decoration: BoxDecoration (
                                      color: Color(0xffe4d7ba),
                                      borderRadius: BorderRadius.circular(20*fem),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(0x59000000),
                                          offset: Offset(0*fem, 4*fem),
                                          blurRadius: 2*fem,
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          // alarmu9W (I300:3713;300:3644)
                                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 69.86*fem, 1.41*fem),
                                          width: 30*fem,
                                          height: 30*fem,
                                          child: Image.asset(
                                            'assets/page-1/images/alarm.png',
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                        Container(
                                          // emergencyalertokg (I300:3713;300:3642)
                                          margin: EdgeInsets.fromLTRB(8.86*fem, 0*fem, 0*fem, 7.16*fem),
                                          constraints: BoxConstraints (
                                            maxWidth: 91*fem,
                                          ),
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
                                        Container(
                                          // smartsecuritygCC (I300:3713;300:3639)
                                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0.14*fem, 0*fem),
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
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          // autogroupulxeywz (UnwAzDNi4VLEE5UWH1uLXe)
                          margin: EdgeInsets.fromLTRB(33*fem, 0*fem, 49*fem, 0*fem),
                          width: double.infinity,
                          height: 125*fem,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // owneraddvehicleuqe (454:1470)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 31*fem, 0*fem),
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => AddVehicleView()),
                                    );
                                  },
                                  style: TextButton.styleFrom (
                                    padding: EdgeInsets.zero,
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.fromLTRB(18*fem, 20*fem, 18*fem, 14.5*fem),
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
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          // addcarLg4 (I454:1470;454:1450)
                                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 4*fem),
                                          width: 25*fem,
                                          height: 25*fem,
                                          child: Image.asset(
                                            'assets/page-1/images/add-car.png',
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                        Container(
                                          // addvehicleU1a (I454:1470;454:1451)
                                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 5.5*fem),
                                          constraints: BoxConstraints (
                                            maxWidth: 61*fem,
                                          ),
                                          child: RichText(
                                            text: TextSpan(
                                              style: SafeGoogleFont (
                                                'Raleway',
                                                fontSize: 17*ffem,
                                                fontWeight: FontWeight.w700,
                                                height: 1.175*ffem/fem,
                                                color: Color(0xff000000),
                                              ),
                                              children: [
                                                TextSpan(
                                                  text: 'Add\n',
                                                  style: SafeGoogleFont (
                                                    'Raleway',
                                                    fontSize: 17*ffem,
                                                    fontWeight: FontWeight.w400,
                                                    height: 1.175*ffem/fem,
                                                    color: Color(0xff000000),
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: 'Vehicle',
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Text(
                                          // addvehicleU9z (I454:1470;454:1453)
                                          'Add vehicle',
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
                              ),
      
      
                              TextButton(
                                // useremergencyviewDNU (519:725)
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
                                  padding: EdgeInsets.fromLTRB(17*fem, 16*fem, 21*fem, 16*fem),
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
                                        // filepreview59n (I519:725;519:713)
                                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 77*fem, 0*fem),
                                        width: 25*fem,
                                        height: 25*fem,
                                        child: Image.asset(
                                          'assets/page-1/images/file-preview.png',
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 6*fem,
                                      ),
                                      Container(
                                        // emergencyviewNeg (I519:725;519:714)
                                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 11*fem, 0*fem),
                                        constraints: BoxConstraints (
                                          maxWidth: 91*fem,
                                        ),
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
                                                text: 'View',
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
                                      SizedBox(
                                        height: 6*fem,
                                      ),
                                      Text(
                                        // viewemergencyT3r (I519:725;519:715)
                                        'View emergency',
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
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                // smartsecurityzJg (300:3623)
                left: 35*fem,
                top: 434.5*fem,
                child: Center(
                  child: Align(
                    child: SizedBox(
                      width: 126*fem,
                      height: 29*fem,
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
                ),
              ),
              Positioned(
                // smartsecurityt9A (300:3624)
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
                              text: 'Welcome Owner!\n',
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
                // smarthomecontrolviaphonecUU (300:3627)
                left: 71*fem,
                top: 117*fem,
                child: Align(
                  child: SizedBox(
                    width: 372*fem,
                    height: 372*fem,
                    child: Image.asset(
                      'assets/page-1/images/smart-home-control-via-phone.png',
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
                  title: Text('View Emergency Alert History'),
                  onTap: () {
                    Navigator.of(context).pop(); // Close the dialog
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EmergencyAlertsListView()),
                    );
                  },
                ),
                ListTile(
                  title: Text('View Visitor History'),
                  onTap: () {
                    Navigator.of(context).pop(); // Close the dialog
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => OwnerVisitorsView()),
                    );
                  },
                ),
                ListTile(
                  title: Text('View Your Registered Vehicle'),
                  onTap: () {
                    Navigator.of(context).pop(); // Close the dialog
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => UserVehiclesScreen()),
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


