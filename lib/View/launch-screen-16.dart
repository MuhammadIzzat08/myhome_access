import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myhome_access/View/launch-screen-5.dart';
import 'package:myhome_access/View/login_screen.dart';
import 'package:myhome_access/utils.dart';

import 'launch-screen-4.dart';

class launchscreen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 428;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Container(
          // launchscreen16fTb (257:645)
          width: double.infinity,
          height: 926*fem,
          child: Stack(
            children: [
              Positioned(
                // signinpagen2R (257:646)
                left: 0*fem,
                top: 0*fem,
                child: Container(
                  width: 428*fem,
                  height: 926*fem,
                  decoration: BoxDecoration (
                    gradient: LinearGradient (
                      begin: Alignment(0, -1),
                      end: Alignment(0, 1),
                      colors: <Color>[Color(0xfffff3dc), Color(0xffffffff)],
                      stops: <double>[0, 1],
                    ),
                  ),
                  child: Container(
                    // frameFAu (257:648)
                    width: 1814*fem,
                    height: 1814*fem,
                  ),
                ),
              ),
              Positioned(
                // ellipse41A5 (257:649)
                left: 0*fem,
                top: 0*fem,
                child: Align(
                  child: SizedBox(
                    width: 1500*fem,
                    height: 1228*fem,
                    child: Image.asset(
                      'assets/page-1/images/ellipse-4-82h.png',
                      width: 1500*fem,
                      height: 1228*fem,
                    ),
                  ),
                ),
              ),
              Positioned(
                // group217iu (257:650)
                left: 205*fem,
                top: 299*fem,
                child: Align(
                  child: SizedBox(
                    width: 19*fem,
                    height: 19*fem,
                    child: Image.asset(
                      'assets/page-1/images/group-2-1-v69.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                // smartsecurity36m (257:651)
                left: 152*fem,
                top: 393*fem,
                child: Align(
                  child: SizedBox(
                    width: 287*fem,
                    height: 47*fem,
                    child: RichText(
                      text: TextSpan(
                        style: SafeGoogleFont (
                          'Nunito Sans',
                          fontSize: 40*ffem,
                          fontWeight: FontWeight.w700,
                          height: 1.363999939*ffem/fem,
                          color: Color(0xff323130),
                        ),
                        children: [
                          TextSpan(
                            text: 'MyHome',
                            style: SafeGoogleFont (
                              'Raleway',
                              fontSize: 40*ffem,
                              fontWeight: FontWeight.w600,
                              height: 1.175*ffem/fem,
                              color: Color(0xff323130),
                            ),
                          ),
                          TextSpan(
                            text: '            ',
                            style: SafeGoogleFont (
                              'Raleway',
                              fontSize: 40*ffem,
                              fontWeight: FontWeight.w700,
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
              Positioned(
                // smartsecurityE4m (257:652)
                left: 253*fem,
                top: 440*fem,
                child: Align(
                  child: SizedBox(
                    width: 269*fem,
                    height: 47*fem,
                    child: RichText(
                      text: TextSpan(
                        style: SafeGoogleFont (
                          'Nunito Sans',
                          fontSize: 40*ffem,
                          fontWeight: FontWeight.w700,
                          height: 1.363999939*ffem/fem,
                          color: Color(0xff323130),
                        ),
                        children: [
                          TextSpan(
                            text: 'ACCESS',
                            style: SafeGoogleFont (
                              'Raleway',
                              fontSize: 40*ffem,
                              fontWeight: FontWeight.w700,
                              height: 1.175*ffem/fem,
                              color: Color(0xff323130),
                            ),
                          ),
                          TextSpan(
                            text: '            ',
                            style: SafeGoogleFont (
                              'Raleway',
                              fontSize: 40*ffem,
                              fontWeight: FontWeight.w700,
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
              Positioned(
                // rectangle26uaD (257:653)
                left: 333*fem,
                top: 826*fem,
                child: Align(
                  child: SizedBox(
                    width: 70*fem,
                    height: 70*fem,
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom (
                        padding: EdgeInsets.zero,
                      ),
                      child: Image.asset(
                        'assets/page-1/images/rectangle-26-MrV.png',
                        width: 70*fem,
                        height: 70*fem,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                // rectangle27zbf (257:654)
                left: 178*fem,
                top: 721*fem,
                child: Align(
                  child: SizedBox(
                    width: 32*fem,
                    height: 11*fem,
                    child: Container(
                      decoration: BoxDecoration (
                        borderRadius: BorderRadius.circular(50*fem),
                        color: Color(0xffe9c372),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                // rectangle28K89 (257:655)
                left: 220*fem,
                top: 721*fem,
                child: Align(
                  child: SizedBox(
                    width: 12*fem,
                    height: 11*fem,
                    child: Container(
                      decoration: BoxDecoration (
                        borderRadius: BorderRadius.circular(50*fem),
                        color: Color(0xffb1afab),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                // rectangle292YM (257:656)
                left: 242*fem,
                top: 721*fem,
                child: Align(
                  child: SizedBox(
                    width: 12*fem,
                    height: 11*fem,
                    child: Container(
                      decoration: BoxDecoration (
                        borderRadius: BorderRadius.circular(50*fem),
                        color: Color(0xffb1afab),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                // internetofthingsnetworkofconne (257:657)
                left: 20*fem,
                top: 322*fem,
                child: Align(
                  child: SizedBox(
                    width: 388*fem,
                    height: 291*fem,
                    child: Image.asset(
                      'assets/page-1/images/internet-of-things-network-of-connected-devices-FmX.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Positioned(
                // smartsecurityFg1 (257:658)
                left: 53*fem,
                top: 225*fem,
                child: Align(
                  child: SizedBox(
                    width: 300.45*fem,
                    height: 47.76*fem,
                    child: Image.asset(
                      'assets/page-1/images/smart-security-3mo.png',
                      width: 300.45*fem,
                      height: 47.76*fem,
                    ),
                  ),
                ),
              ),
              Positioned(
                // smartsecurity4NZ (257:768)
                left: 53*fem,
                top: 110*fem,
                child: Container(
                  width: 230.26*fem,
                  height: 80.79*fem,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        // autogroupndvfyEd (LBxmRcM2weZYZ3uBywnDVF)
                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 2.12*fem, 5.8*fem),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // vectorVyf (257:788)
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 17.08*fem),
                              width: 22.91*fem,
                              height: 26.73*fem,
                              child: Image.asset(
                                'assets/page-1/images/vector-ihb.png',
                                width: 22.91*fem,
                                height: 26.73*fem,
                              ),
                            ),
                            Container(
                              // vectorcYV (257:777)
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0.7*fem, 0*fem),
                              width: 19.43*fem,
                              height: 27.47*fem,
                              child: Image.asset(
                                'assets/page-1/images/vector-p1b.png',
                                width: 19.43*fem,
                                height: 27.47*fem,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // autogrouphjtbLUV (LBxmZSTKcnPiKrkrm6HjTb)
                        margin: EdgeInsets.fromLTRB(0*fem, 8.35*fem, 3.9*fem, 7.66*fem),
                        height: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // vectorsDX (257:787)
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 23.58*fem),
                              width: 18.64*fem,
                              height: 20.6*fem,
                              child: Image.asset(
                                'assets/page-1/images/vector-ngD.png',
                                width: 18.64*fem,
                                height: 20.6*fem,
                              ),
                            ),
                            Container(
                              // vectoro7B (257:776)
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0.07*fem, 0*fem),
                              width: 16.4*fem,
                              height: 20.6*fem,
                              child: Image.asset(
                                'assets/page-1/images/vector-vff.png',
                                width: 16.4*fem,
                                height: 20.6*fem,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // autogroupttpbK5X (LBxmggkFJhv6wmzk5RtTPb)
                        margin: EdgeInsets.fromLTRB(0*fem, 8.35*fem, 0.1*fem, 7.66*fem),
                        height: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              // autogroup3audFUy (LBxmp1sNH64BA7BTKK3aUD)
                              margin: EdgeInsets.fromLTRB(1.38*fem, 0*fem, 0*fem, 15.23*fem),
                              width: 33.9*fem,
                              height: 20.6*fem,
                              child: Image.asset(
                                'assets/page-1/images/auto-group-3aud.png',
                                width: 33.9*fem,
                                height: 20.6*fem,
                              ),
                            ),
                            Container(
                              // autogroupgkghyA5 (LBxmuBPRsYCVwhngZ3gKgh)
                              width: 31.95*fem,
                              height: 28.95*fem,
                              child: Image.asset(
                                'assets/page-1/images/auto-group-gkgh.png',
                                width: 31.95*fem,
                                height: 28.95*fem,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // vectorhLy (257:773)
                        margin: EdgeInsets.fromLTRB(0*fem, 40.42*fem, 3.59*fem, 0*fem),
                        width: 10.83*fem,
                        height: 25.06*fem,
                        child: Image.asset(
                          'assets/page-1/images/vector-Crq.png',
                          width: 10.83*fem,
                          height: 25.06*fem,
                        ),
                      ),
                      Container(
                        // autogroupdrzdpAh (LBxn3kyU6oZp4E9ne6DRzd)
                        margin: EdgeInsets.fromLTRB(0*fem, 1.85*fem, 4.43*fem, 0*fem),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              // vectorYsP (257:784)
                              margin: EdgeInsets.fromLTRB(1.63*fem, 0*fem, 0*fem, 24.32*fem),
                              width: 20.16*fem,
                              height: 26.73*fem,
                              child: Image.asset(
                                'assets/page-1/images/vector-BH7.png',
                                width: 20.16*fem,
                                height: 26.73*fem,
                              ),
                            ),
                            Container(
                              // vectorG2h (257:772)
                              width: 16.93*fem,
                              height: 27.89*fem,
                              child: Image.asset(
                                'assets/page-1/images/vector.png',
                                width: 16.93*fem,
                                height: 27.89*fem,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // autogroup8xumoHX (LBxnAkmowMF9tuZCBo8xUm)
                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 2.63*fem, 0.39*fem),
                        height: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              // autogroupmgkmw8q (LBxnJkYVBQJgrYJWp2mGkM)
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0.16*fem, 17.08*fem),
                              width: 49.88*fem,
                              height: 28.95*fem,
                              child: Image.asset(
                                'assets/page-1/images/auto-group-mgkm.png',
                                width: 49.88*fem,
                                height: 28.95*fem,
                              ),
                            ),
                            Container(
                              // autogroupz1t3eZ3 (LBxnQkNVcSbqaGN1HCz1T3)
                              width: 45.25*fem,
                              height: 34.37*fem,
                              child: Image.asset(
                                'assets/page-1/images/auto-group-z1t3.png',
                                width: 45.25*fem,
                                height: 34.37*fem,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // autogroupnjh3aSh (LBxnaQm4Xfy2QA1rNKnJh3)
                        margin: EdgeInsets.fromLTRB(0*fem, 7.97*fem, 1.68*fem, 0*fem),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              // vectoriJ1 (257:780)
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 2.59*fem, 23.58*fem),
                              width: 17.77*fem,
                              height: 20.6*fem,
                              child: Image.asset(
                                'assets/page-1/images/vector-J3o.png',
                                width: 17.77*fem,
                                height: 20.6*fem,
                              ),
                            ),
                            Container(
                              // vector2Zb (257:769)
                              width: 16.8*fem,
                              height: 27.87*fem,
                              child: Image.asset(
                                'assets/page-1/images/vector-yD7.png',
                                width: 16.8*fem,
                                height: 27.87*fem,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // vectormn5 (257:779)
                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 3.13*fem, 43.48*fem),
                        width: 17.24*fem,
                        height: 20.6*fem,
                        child: Image.asset(
                          'assets/page-1/images/vector-Tv5.png',
                          width: 17.24*fem,
                          height: 20.6*fem,
                        ),
                      ),
                      Container(
                        // vectoru7b (257:778)
                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 48*fem),
                        width: 11.59*fem,
                        height: 25.12*fem,
                        child: Image.asset(
                          'assets/page-1/images/vector-DWm.png',
                          width: 11.59*fem,
                          height: 25.12*fem,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                // smartsecuritypkM (257:789)
                left: 34*fem,
                top: 848.5*fem,
                child: Align(
                  child: SizedBox(
                    width: 43*fem,
                    height: 24*fem,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginScreen(userEmail: '',)),
                        );
                      },
                      style: TextButton.styleFrom (
                        padding: EdgeInsets.zero,
                      ),
                      child: Text(
                        'Skip',
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
                ),
              ),
              Positioned(
                left: 347*fem,
                top: 840*fem,
                child: TextButton(onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Launchscreen5()),
                  );
                },
                  style: TextButton.styleFrom (
                    padding: EdgeInsets.zero,
                  ),
                  child: Container(
                    child: Align(
                      child: SizedBox(
                        width: 42*fem,
                        height: 42*fem,
                        child: Image.asset(
                          'assets/page-1/images/right-j5F.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                // groupofthreepeoplediscussingpr (257:791)
                left: 409*fem,
                top: 319*fem,
                child: Align(
                  child: SizedBox(
                    width: 436*fem,
                    height: 312*fem,
                    child: Image.asset(
                      'assets/page-1/images/group-of-three-people-discussing-project.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Positioned(
                // smartsecurityKqX (257:792)
                left: 452*fem,
                top: 238*fem,
                child: Align(
                  child: SizedBox(
                    width: 830*fem,
                    height: 20*fem,
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
                ),
              ),
              Positioned(
                // smartsecurity1iM (257:793)
                left: 452*fem,
                top: 127.5*fem,
                child: Align(
                  child: SizedBox(
                    width: 410*fem,
                    height: 47*fem,
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
                ),
              ),
            ],
          ),
        ),
      ),
          );
  }
}