import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myhome_access/utils.dart';

class LaunchScreen4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 428;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      child: Container(
        // launchscreen44s6 (257:794)
        padding: EdgeInsets.fromLTRB(0*fem, 104*fem, 0*fem, 30*fem),
        width: double.infinity,
        decoration: BoxDecoration (
          image: DecorationImage (
            fit: BoxFit.cover,
            image: AssetImage (
              'assets/page-1/images/ellipse-4.png',
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // smartsecurityLZi (257:942)
              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 124*fem, 20*fem),
              constraints: BoxConstraints (
                maxWidth: 224*fem,
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
                      text: 'Alert the \n',
                    ),
                    TextSpan(
                      text: 'Community',
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
              // smartsecurity13a (257:941)
              margin: EdgeInsets.fromLTRB(10*fem, 0*fem, 0*fem, 41*fem),
              constraints: BoxConstraints (
                maxWidth: 358*fem,
              ),
              child: Text(
                'Empower your home community with our intuitive Emergency Alert System. Seamless and easy-to-use.',
                style: SafeGoogleFont (
                  'Raleway',
                  fontSize: 17*ffem,
                  fontWeight: FontWeight.w600,
                  height: 1.175*ffem/fem,
                  color: Color(0xff323130),
                ),
              ),
            ),
            Container(
              // groupofthreepeoplediscussingpr (257:940)
              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 2*fem, 90*fem),
              width: 436*fem,
              height: 312*fem,
              child: Image.asset(
                'assets/page-1/images/group-of-three-people-discussing-project.png',
                fit: BoxFit.contain,
              ),
            ),
            Container(
              // autogroupfelcp12 (DSPmT1F2e91u9AJwdRfeLC)
              margin: EdgeInsets.fromLTRB(178*fem, 0*fem, 174*fem, 94*fem),
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // rectangle278nQ (257:803)
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
                    // rectangle28S2Q (257:804)
                    width: 32*fem,
                    height: 11*fem,
                    decoration: BoxDecoration (
                      borderRadius: BorderRadius.circular(50*fem),
                      color: Color(0xffe9c372),
                    ),
                  ),
                  SizedBox(
                    width: 10*fem,
                  ),
                  Container(
                    // rectangle29Z72 (257:805)
                    width: 12*fem,
                    height: 11*fem,
                    decoration: BoxDecoration (
                      borderRadius: BorderRadius.circular(50*fem),
                      color: Color(0xffb1afab),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // autogroupob5ehDE (DSPmZatQ4Pcq1mzDZQoB5E)
              margin: EdgeInsets.fromLTRB(34*fem, 0*fem, 25*fem, 0*fem),
              width: double.infinity,
              height: 70*fem,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // smartsecurityR9E (257:938)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 250*fem, 1*fem),
                    child: TextButton(
                      onPressed: () {

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
                    // launchbutton27Gx (510:2893)
                    padding: EdgeInsets.fromLTRB(14*fem, 14*fem, 14*fem, 14*fem),
                    height: double.infinity,
                    decoration: BoxDecoration (
                      image: DecorationImage (
                        fit: BoxFit.cover,
                        image: AssetImage (
                          'assets/page-1/images/rectangle-26-Ckk.png',
                        ),
                      ),
                    ),
                    child: Center(
                      // rightqTr (I510:2893;257:939)
                      child: SizedBox(
                        width: 42*fem,
                        height: 42*fem,
                        child: Image.asset(
                          'assets/page-1/images/right.png',
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
          );
  }
}