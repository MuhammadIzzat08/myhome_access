import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myhome_access/utils.dart';

class Launchscreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 428;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Container(
          // launchscreen17Ajo (257:794)
          width: double.infinity,
          height: 926*fem,
          child: Stack(
            children: [
              Positioned(
                // signinpages8R (257:795)
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
                    // frameYEZ (257:797)
                    width: 1814*fem,
                    height: 1814*fem,
                  ),
                ),
              ),
              Positioned(
                // ellipse4u57 (257:798)
                left: 0*fem,
                top: 0*fem,
                child: Align(
                  child: SizedBox(
                    width: 1500*fem,
                    height: 1228*fem,
                    child: Image.asset(
                      'assets/page-1/images/ellipse-4-jgy.png',
                      width: 1500*fem,
                      height: 1228*fem,
                    ),
                  ),
                ),
              ),
              Positioned(
                // group21owB (257:799)
                left: 0*fem,
                top: 299*fem,
                child: Align(
                  child: SizedBox(
                    width: 19*fem,
                    height: 19*fem,
                    child: Image.asset(
                      'assets/page-1/images/group-2-1-G3f.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                // smartsecurityw1o (257:800)
                left: 0*fem,
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
                // smartsecurityJus (257:801)
                left: 0*fem,
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
                // rectangle26c3P (257:802)
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
                        'assets/page-1/images/rectangle-26-8DB.png',
                        width: 70*fem,
                        height: 70*fem,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                // rectangle27V7B (257:803)
                left: 178*fem,
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
                // rectangle28QE9 (257:804)
                left: 200*fem,
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
                // rectangle297uF (257:805)
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
                // internetofthingsnetworkofconne (257:806)
                left: 0*fem,
                top: 322*fem,
                child: Align(
                  child: SizedBox(
                    width: 388*fem,
                    height: 291*fem,
                    child: Image.asset(
                      'assets/page-1/images/internet-of-things-network-of-connected-devices-MkR.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Positioned(
                // smartsecurityXxy (257:807)
                left: 0*fem,
                top: 225*fem,
                child: Align(
                  child: SizedBox(
                    width: 301.45*fem,
                    height: 47.76*fem,
                    child: Image.asset(
                      'assets/page-1/images/smart-security-Cbw.png',
                      width: 301.45*fem,
                      height: 47.76*fem,
                    ),
                  ),
                ),
              ),
              Positioned(
                // smartsecurityXbb (257:917)
                left: 0*fem,
                top: 110*fem,
                child: Container(
                  width: 230.26*fem,
                  height: 80.79*fem,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        // autogroupmm1xpqb (LBxrhsiPNxidD6hMVemm1X)
                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 187.36*fem, 0.39*fem),
                        height: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              // autogroupisqfxS1 (LBxrqczUmdw7PVcCMFisqF)
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0.16*fem, 17.08*fem),
                              width: 49.88*fem,
                              height: 28.95*fem,
                              child: Image.asset(
                                'assets/page-1/images/auto-group-isqf.png',
                                width: 49.88*fem,
                                height: 28.95*fem,
                              ),
                            ),
                            Container(
                              // autogroupv2cm3iM (LBxrvsLjeYh7mWAFWXv2CM)
                              width: 45.25*fem,
                              height: 34.37*fem,
                              child: Image.asset(
                                'assets/page-1/images/auto-group-v2cm.png',
                                width: 45.25*fem,
                                height: 34.37*fem,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // autogroup2bqoBJm (LBxqzK5Jmyiz9613q92bqo)
                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 338.09*fem, 5.8*fem),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // vectorJuB (257:937)
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 17.08*fem),
                              width: 22.91*fem,
                              height: 26.73*fem,
                              child: Image.asset(
                                'assets/page-1/images/vector-Vrd.png',
                                width: 22.91*fem,
                                height: 26.73*fem,
                              ),
                            ),
                            Container(
                              // vectordRf (257:926)
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0.7*fem, 0*fem),
                              width: 19.43*fem,
                              height: 27.47*fem,
                              child: Image.asset(
                                'assets/page-1/images/vector-feD.png',
                                width: 19.43*fem,
                                height: 27.47*fem,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // autogroupkrimM6m (LBxrbYZbp5xk7irZLJKRiM)
                        margin: EdgeInsets.fromLTRB(0*fem, 1.85*fem, 241.84*fem, 0*fem),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              // vectorgPw (257:933)
                              margin: EdgeInsets.fromLTRB(1.63*fem, 0*fem, 0*fem, 24.32*fem),
                              width: 20.16*fem,
                              height: 26.73*fem,
                              child: Image.asset(
                                'assets/page-1/images/vector-56m.png',
                                width: 20.16*fem,
                                height: 26.73*fem,
                              ),
                            ),
                            Container(
                              // vector1BK (257:921)
                              width: 16.93*fem,
                              height: 27.89*fem,
                              child: Image.asset(
                                'assets/page-1/images/vector-KMF.png',
                                width: 16.93*fem,
                                height: 27.89*fem,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // vectorwqf (257:927)
                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 48*fem),
                        width: 11.59*fem,
                        height: 25.12*fem,
                        child: Image.asset(
                          'assets/page-1/images/vector-76u.png',
                          width: 11.59*fem,
                          height: 25.12*fem,
                        ),
                      ),
                      Container(
                        // autogroupkrwqsUR (LBxrE91bt9rJdcvD5TkrWq)
                        margin: EdgeInsets.fromLTRB(0*fem, 8.35*fem, 278.16*fem, 7.66*fem),
                        height: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              // autogroupunk5nrH (LBxrMYxv8zc4SN3kEtUNk5)
                              margin: EdgeInsets.fromLTRB(1.38*fem, 0*fem, 0*fem, 15.23*fem),
                              width: 33.9*fem,
                              height: 20.6*fem,
                              child: Image.asset(
                                'assets/page-1/images/auto-group-unk5.png',
                                width: 33.9*fem,
                                height: 20.6*fem,
                              ),
                            ),
                            Container(
                              // autogroupk8dtgRs (LBxrSJL1K9fyFtvqruK8DT)
                              width: 31.95*fem,
                              height: 28.95*fem,
                              child: Image.asset(
                                'assets/page-1/images/auto-group-k8dt.png',
                                width: 31.95*fem,
                                height: 28.95*fem,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // autogroupwxuz1DF (LBxr7Phqtz21aBMHJPWXUZ)
                        margin: EdgeInsets.fromLTRB(0*fem, 8.35*fem, 317.33*fem, 7.66*fem),
                        height: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // vectorXxH (257:936)
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 23.58*fem),
                              width: 18.64*fem,
                              height: 20.6*fem,
                              child: Image.asset(
                                'assets/page-1/images/vector-Dss.png',
                                width: 18.64*fem,
                                height: 20.6*fem,
                              ),
                            ),
                            Container(
                              // vectorrjf (257:925)
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0.07*fem, 0*fem),
                              width: 16.4*fem,
                              height: 20.6*fem,
                              child: Image.asset(
                                'assets/page-1/images/vector-MX3.png',
                                width: 16.4*fem,
                                height: 20.6*fem,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // autogroup9vhjndK (LBxs6Su7HKSczysGg79vHj)
                        margin: EdgeInsets.fromLTRB(0*fem, 7.97*fem, 164.37*fem, 0*fem),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              // vectorXau (257:929)
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 2.59*fem, 23.58*fem),
                              width: 17.77*fem,
                              height: 20.6*fem,
                              child: Image.asset(
                                'assets/page-1/images/vector-Evh.png',
                                width: 17.77*fem,
                                height: 20.6*fem,
                              ),
                            ),
                            Container(
                              // vectorevR (257:918)
                              width: 16.8*fem,
                              height: 27.87*fem,
                              child: Image.asset(
                                'assets/page-1/images/vector-xER.png',
                                width: 16.8*fem,
                                height: 27.87*fem,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // vectorzjP (257:928)
                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 145.45*fem, 43.48*fem),
                        width: 17.24*fem,
                        height: 20.6*fem,
                        child: Image.asset(
                          'assets/page-1/images/vector-Kos.png',
                          width: 17.24*fem,
                          height: 20.6*fem,
                        ),
                      ),
                      Container(
                        // vectorifP (257:922)
                        margin: EdgeInsets.fromLTRB(0*fem, 40.42*fem, 267.22*fem, 0*fem),
                        width: 10.83*fem,
                        height: 25.06*fem,
                        child: Image.asset(
                          'assets/page-1/images/vector-wxq.png',
                          width: 10.83*fem,
                          height: 25.06*fem,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                // smartsecurity3Sm (257:938)
                left: 34*fem,
                top: 848.5*fem,
                child: Align(
                  child: SizedBox(
                    width: 49*fem,
                    height: 24*fem,
                    child: TextButton(
                      onPressed: () {},
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
                ),
              ),
              Positioned(
                // rightWbF (257:939)
                left: 347*fem,
                top: 840*fem,
                child: Align(
                  child: SizedBox(
                    width: 42*fem,
                    height: 42*fem,
                    child: Image.asset(
                      'assets/page-1/images/right-oob.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Positioned(
                // groupofthreepeoplediscussingpr (257:940)
                left: 0*fem,
                top: 319*fem,
                child: Align(
                  child: SizedBox(
                    width: 436*fem,
                    height: 312*fem,
                    child: Image.asset(
                      'assets/page-1/images/group-of-three-people-discussing-project-rHj.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Positioned(
                // smartsecurityjD7 (257:941)
                left: 40*fem,
                top: 218*fem,
                child: Align(
                  child: SizedBox(
                    width: 358*fem,
                    height: 60*fem,
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
                // smartsecurityRrd (257:942)
                left: 40*fem,
                top: 104*fem,
                child: Align(
                  child: SizedBox(
                    width: 224*fem,
                    height: 94*fem,
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
              Positioned(
                // carrentalBDX (257:943)
                left: 403*fem,
                top: 272*fem,
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
                // smartsecurityhhf (257:944)
                left: 446*fem,
                top: 238*fem,
                child: Align(
                  child: SizedBox(
                    width: 925*fem,
                    height: 20*fem,
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
              Positioned(
                // smartsecurityp1b (257:945)
                left: 446*fem,
                top: 127.5*fem,
                child: Align(
                  child: SizedBox(
                    width: 507*fem,
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
                ),
              ),
            ],
          ),
        ),
      ),
          );
  }
}