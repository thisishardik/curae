import 'package:flutter/material.dart';
import 'package:biocom2/home_screen/dashboard.dart';
import 'package:page_transition/page_transition.dart';

class OnboardingScreen extends StatelessWidget {
  static String id = 'on_boarding';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF9F9F9),
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                'assets/images/onboarding_illustration.png',
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fitWidth,
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height / 12,
              child: Padding(
                padding: EdgeInsets.only(left: 40.0, right: 40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'BioCom Welcome\s You',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                        color: Color(0xff1E1C61),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Appointments, Consultations and Advice',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff1E1C61).withOpacity(0.7),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'made easy with HealthCare',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff1E1C61).withOpacity(0.7),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    MaterialButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.fade,
                              child: Home(),
                            ));
                      },
                      color: Color(0xffEF716B),
                      padding: EdgeInsets.symmetric(
                        horizontal: 30,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        'Get Started',
                        style: TextStyle(
                          color: Color(0xffffffff),
                          fontSize: 16,
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
    );
  }
}
