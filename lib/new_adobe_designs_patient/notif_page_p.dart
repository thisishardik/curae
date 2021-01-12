import 'package:adobe_xd/gradient_xd_transform.dart';
import 'package:biocom2/new_adobe_designs/dashboard.dart';
import 'package:biocom2/new_adobe_designs/sign_up_doctor.dart';
import 'package:biocom2/new_adobe_designs_patient/sign_up_page_p.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';

class AdobeNotificationPagePatient extends StatefulWidget {
  @override
  _AdobeNotificationPagePatientState createState() =>
      _AdobeNotificationPagePatientState();
}

class _AdobeNotificationPagePatientState
    extends State<AdobeNotificationPagePatient> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
  }

//  initPlatformState() async {
//    String platformVersion;
//    // Platform messages may fail, so we use a try/catch PlatformException.
//    try {
//      platformVersion = await SimplePermissions.platformVersion;
//    } on PlatformException {
//      platformVersion = 'Failed to get platform version.';
//    }
//
//    // If the widget was removed from the tree while the asynchronous platform
//    // message was in flight, we want to discard the reply rather than calling
//    // setState to update our non-existent appearance.
//    if (!mounted) return;
//
//    setState(() {
//      _platformVersion = platformVersion;
//    });
//  }
//
//  requestPermission() async {}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFfefdfe),
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
                  'Turn on Notifications',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xff68b2a0),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10.0),
                Image.asset(
                  'assets/images/notif.png',
                  height: 410.0,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              child: AdobeSignUpPatient(),
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
                            const Color(0xff3FBCEB),
                            const Color(0xff38A7D1)
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
                          'CONTINUE',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
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
