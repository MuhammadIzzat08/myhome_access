import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myhome_access/utils.dart';

import 'launch-screen-16.dart';

class Launchscreen5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 428;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      child: Container(
        // launchscreen5SXW (257:946)
        padding: EdgeInsets.fromLTRB(0*fem, 104*fem, 0*fem, 0*fem),
        width: double.infinity,
        decoration: BoxDecoration (
          image: DecorationImage (
            fit: BoxFit.cover,
            image: AssetImage (
              'assets/page-1/images/ellipse-4-PLQ.png',
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // smartsecurityLct (257:1097)
              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 10*fem, 20*fem),
              constraints: BoxConstraints (
                maxWidth: 328*fem,
              ),
              child: RichText(
                text: TextSpan(
                  style: SafeGoogleFont (
                    'Roboto',
                    fontSize: 40*ffem,
                    fontWeight: FontWeight.w600,
                    height: 1.1725*ffem/fem,
                    letterSpacing: 2*fem,
                    color: Color(0xff323130),
                  ),
                  children: [
                    TextSpan(
                      text: 'Register \n',
                    ),
                    TextSpan(
                      text: 'Visitor & Vehicle',
                      style: SafeGoogleFont (
                        'Roboto',
                        fontSize: 40*ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.1725*ffem/fem,
                        letterSpacing: 2*fem,
                        color: Color(0xff323130),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              // autogroupl9waTL8 (DSPmvExeSCC8AAR8WML9wA)
              width: double.infinity,
              height: 491*fem,
              child: Stack(
                children: [
                  Positioned(
                    // carrentalzax (257:1095)
                    left: 0*fem,
                    top: 54*fem,
                    child: Align(
                      child: SizedBox(
                        width: 443.65*fem,
                        height: 437*fem,
                        child: Image.asset(
                          'assets/page-1/images/car-rental.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // smartsecurityWJQ (257:1096)
                    left: 52*fem,
                    top: 0*fem,
                    child: Align(
                      child: SizedBox(
                        width: 334*fem,
                        height: 60*fem,
                        child: Text(
                          'Experience streamlined check-ins and enhanced security as residents can easily register guests and their vehicles. ',
                          style: SafeGoogleFont (
                            'Raleway',
                            fontSize: 17*ffem,
                            fontWeight: FontWeight.w600,
                            height: 1.175*ffem/fem,
                            color: Color(0xff323130),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // autogrouptzecb4x (DSPnEu6Dzz134eADJETZEC)
              padding: EdgeInsets.fromLTRB(34*fem, 12*fem, 25*fem, 30*fem),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // autogroupwjp47oz (DSPmzezxUWoJc3WvSBwJp4)
                    margin: EdgeInsets.fromLTRB(144*fem, 0*fem, 149*fem, 94*fem),
                    width: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // rectangle27SrG (257:955)
                          width: 12*fem,
                          height: 11*fem,
                          decoration: BoxDecoration (
                            borderRadius: BorderRadius.circular(50*fem),
                            color: Color(0xffb1afab),
                          ),
                        ),
                        SizedBox(
                          width: 10*fem,
                        ),
                        Container(
                          // rectangle28kMA (257:956)
                          width: 12*fem,
                          height: 11*fem,
                          decoration: BoxDecoration (
                            borderRadius: BorderRadius.circular(50*fem),
                            color: Color(0xffb1afab),
                          ),
                        ),
                        SizedBox(
                          width: 10*fem,
                        ),
                        Container(
                          // rectangle295PS (257:957)
                          width: 32*fem,
                          height: 11*fem,
                          decoration: BoxDecoration (
                            borderRadius: BorderRadius.circular(50*fem),
                            color: Color(0xffe9c372),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // autogrouprqjcQwW (DSPn7eoJK4UeSivKytrqJC)
                    width: double.infinity,
                    height: 70*fem,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // smartsecurityZZW (257:1090)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 250*fem, 1*fem),
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => launchscreen1()),
                              );
                            },
                            style: TextButton.styleFrom (
                              padding: EdgeInsets.zero,
                            ),
                            child: Text(
                              'Back',
                              style: SafeGoogleFont (
                                'Roboto',
                                fontSize: 20*ffem,
                                fontWeight: FontWeight.w500,
                                height: 1.1725*ffem/fem,
                                letterSpacing: 1*fem,
                                color: Color(0xff767676),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          // launchbutton3Fx8 (510:2922)
                          padding: EdgeInsets.fromLTRB(14*fem, 14*fem, 14*fem, 14*fem),
                          height: double.infinity,
                          decoration: BoxDecoration (
                            image: DecorationImage (
                              fit: BoxFit.cover,
                              image: AssetImage (
                                'assets/page-1/images/rectangle-26.png',
                              ),
                            ),
                          ),
                          child: Center(
                            // rightmfa (I510:2922;257:1091)
                            child: SizedBox(
                              width: 42*fem,
                              height: 42*fem,
                              child: Image.asset(
                                'assets/page-1/images/right-xaY.png',
                                fit: BoxFit.contain,
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
          ],
        ),
      ),
          );
  }
}