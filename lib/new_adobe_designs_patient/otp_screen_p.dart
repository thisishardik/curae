import 'dart:async';

import 'package:adobe_xd/gradient_xd_transform.dart';
import 'package:biocom2/new_adobe_designs/dashboard.dart';
import 'package:biocom2/new_adobe_designs_patient/dashboard_p.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class AdobeOTPScreenPatient extends StatefulWidget {
  static String id = 'otp_screen';
  @override
  _AdobeOTPScreenPatientState createState() => _AdobeOTPScreenPatientState();
}

class _AdobeOTPScreenPatientState extends State<AdobeOTPScreenPatient> {
  String verificationCode;
  String sampleVerificationCode = '12345';
  StreamController<ErrorAnimationType> errorController;

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController.close();
    super.dispose();
  }

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
                      'User Verification',
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
                  'Enter the verification code sent to your email',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff38A7D1),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 50.0),
                Padding(
                    padding: EdgeInsets.all(20.0),
                    child: PinCodeTextField(
                      autoFocus: true,
                      length: 5,
                      obsecureText: true,
                      animationType: AnimationType.fade,
                      errorAnimationController: errorController,
                      pinTheme: PinTheme(
                        selectedFillColor: Colors.white,
                        inactiveFillColor: Colors.white,
                        shape: PinCodeFieldShape.underline,
                        fieldHeight: 50,
                        fieldWidth: 40,
                        activeFillColor: Colors.white,
                      ),
                      animationDuration: Duration(milliseconds: 300),
                      enableActiveFill: true,
                      onCompleted: (value) {
                        print("Completed");
                      },
                      onChanged: (value) {
                        print(value);
                        setState(() {
                          verificationCode = value;
                        });
                      },
                    )),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: GestureDetector(
                onTap: () {
                  if (sampleVerificationCode == verificationCode) {
                    Navigator.push(
                        context,
                        PageTransition(
                            child: AdobeDashboardPatient(),
                            type: PageTransitionType.fade));
                  } else {
                    errorController.add(ErrorAnimationType.shake);
                  }
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
                        const Color(0xff38A7D1),
                      ],
                      stops: [0.0, 1.0],
                      transform: GradientXDTransform(
                          1.0, 0.0, 0.0, 1.0, 0.0, 0.0, Alignment(-0.88, -1.0)),
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
                      'VERIFY',
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
            ),
          ],
        ),
      ),
    );
  }
}
