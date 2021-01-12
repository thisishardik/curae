import 'package:adobe_xd/gradient_xd_transform.dart';
import 'package:biocom2/new_adobe_designs/dashboard.dart';
import 'package:biocom2/new_adobe_designs/notif_page.dart';
import 'package:biocom2/new_adobe_designs/notification_screen.dart';
import 'package:biocom2/new_adobe_designs/sign_in_doctor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class AdobeWelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';
  @override
  _AdobeWelcomeScreenState createState() => _AdobeWelcomeScreenState();
}

class _AdobeWelcomeScreenState extends State<AdobeWelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(height: 60.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Welcome to Curae',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 21,
                        fontWeight: FontWeight.w800,
                        color: const Color(0xff205072),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Text(
                  'Your Health. Our Priority.',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xff68b2a0),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 50.0),
                Image.asset(
                  'assets/images/doc_vector.jpg',
                  height: 280.0,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              child: AdobeNotificationPage(),
                              type: PageTransitionType.fade));
                    },
                    child: Container(
                      width: 296.0,
                      height: 55.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(21.0),
                        gradient: RadialGradient(
                          center: Alignment(-0.88, -1.0),
                          radius: 1.34,
                          colors: [
                            const Color(0xff47cacc),
                            const Color(0xff329d9c)
                          ],
                          stops: [0.0, 1.0],
                          transform: GradientXDTransform(1.0, 0.0, 0.0, 1.0,
                              0.0, 0.0, Alignment(-0.88, -1.0)),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0x36329d9c),
                            offset: Offset(21, 21),
                            blurRadius: 55,
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          'GET STARTED',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Montserrat',
                            fontSize: 14.5,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.fade,
                          child: AdobeSignInDoctor(),
                        ),
                      );
                    },
                    child: SizedBox(
                      width: 264.0,
                      child: Text.rich(
                        TextSpan(
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 13,
                            color: const Color(0x8c68b2a0),
                            height: 1.5384615384615385,
                          ),
                          children: [
                            TextSpan(
                                text: 'Already have an account?',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 13.0,
                                )),
                            TextSpan(
                              text: ' ',
                              style: TextStyle(
                                color: const Color(0xff68b2a0),
                              ),
                            ),
                            TextSpan(
                              text: 'Sign In',
                              style: TextStyle(
                                color: const Color(0xff205072),
                                fontWeight: FontWeight.w600,
                                fontSize: 14.0,
                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
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
