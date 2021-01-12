import 'package:adobe_xd/gradient_xd_transform.dart';
import 'package:biocom2/new_adobe_designs/dashboard.dart';
import 'package:biocom2/new_adobe_designs/notif_page.dart';
import 'package:biocom2/new_adobe_designs/otp_screen.dart';
import 'package:biocom2/new_adobe_designs/sign_in_doctor.dart';
import 'package:biocom2/new_adobe_designs_patient/otp_screen_p.dart';
import 'package:biocom2/new_adobe_designs_patient/sign_in_page_p.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class AdobeSignUpPatient extends StatefulWidget {
  @override
  _AdobeSignUpPatientState createState() => _AdobeSignUpPatientState();
}

class _AdobeSignUpPatientState extends State<AdobeSignUpPatient> {
  String username;
  String name;
  String email;
  String number;
  String address;
  String password;
  String gender;
  String aadharNumber;

  bool isHidden = true;

  void toggleVisibility() {
    setState(() {
      isHidden = !isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                Navigator.pop(context);
              },
            )),
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        body: ListView(
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            SizedBox(
              height: 20.0,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 40),
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(
                        "Sign Up",
                        style: TextStyle(
                            color: Color(0xff205072),
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Enter your details to create an account.",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey[700],
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      SizedBox(height: 25.0),
                      TextField(
                        decoration: InputDecoration(
                            hintText: "Username",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(13.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xff38A7D1), width: 1.5),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(13.0)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xff38A7D1), width: 2.5),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(13.0)),
                            ),
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.black54,
                            )),
                        onChanged: (value) {
                          username = value;
                        },
                      ),
                      SizedBox(height: 20.0),
                      TextField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            hintText: "Email",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(13.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xff38A7D1), width: 1.5),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(13.0)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xff38A7D1), width: 2.5),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(13.0)),
                            ),
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.black54,
                            )),
                        onChanged: (value) {
                          email = value;
                        },
                      ),
                      SizedBox(height: 20.0),
                      TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            hintText: "Contact Number",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(13.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xff38A7D1), width: 1.5),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(13.0)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xff38A7D1), width: 2.5),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(13.0)),
                            ),
                            prefixIcon: Icon(
                              Icons.phone,
                              color: Colors.black54,
                            )),
                        onChanged: (value) {
                          number = value;
                        },
                      ),
                      SizedBox(height: 20.0),
                      TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            hintText: "Aadhar Number",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(13.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xff38A7D1), width: 1.5),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(13.0)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xff38A7D1), width: 2.5),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(13.0)),
                            ),
                            prefixIcon: Icon(
                              Icons.lightbulb_outline,
                              color: Colors.black54,
                            )),
                        onChanged: (value) {
                          aadharNumber = value;
                        },
                      ),
                      SizedBox(height: 20.0),
                      TextField(
                        decoration: InputDecoration(
                            hintText: "Address",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(13.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xff38A7D1), width: 1.5),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(13.0)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xff38A7D1), width: 2.5),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(13.0)),
                            ),
                            prefixIcon: Icon(
                              Icons.location_city,
                              color: Colors.black54,
                            )),
                        onChanged: (value) {
                          address = value;
                        },
                      ),
                      SizedBox(height: 20.0),
                      TextField(
                        obscureText: isHidden == true ? true : false,
                        decoration: InputDecoration(
                          hintText: "Password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(13.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xff38A7D1), width: 1.5),
                            borderRadius:
                                BorderRadius.all(Radius.circular(13.0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: const Color(0xff38A7D1), width: 2.5),
                            borderRadius:
                                BorderRadius.all(Radius.circular(13.0)),
                          ),
                          prefixIcon: Icon(
                            Icons.vpn_key,
                            color: Colors.black54,
                          ),
                          suffixIcon: IconButton(
                            color: Colors.black,
                            onPressed: toggleVisibility,
                            icon: isHidden
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.visibility),
                          ),
                        ),
                        onChanged: (value) {
                          value = password;
                        },
                      ),
                      SizedBox(
                        height: 25,
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
                                    child: AdobeOTPScreenPatient(),
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
                                transform: GradientXDTransform(1.0, 0.0, 0.0,
                                    1.0, 0.0, 0.0, Alignment(-0.88, -1.0)),
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
                                'SIGN UP',
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
                                child: AdobeSignInPatient(),
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
                  SizedBox(height: 20.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
