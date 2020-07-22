import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:biocom2/new_login_signup/doctor_reg_page.dart';
import 'package:biocom2/new_login_signup/forget_passwd_page_for_verification.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:page_transition/page_transition.dart';
import 'package:platform_alert_dialog/platform_alert_dialog.dart';

class ForgetPasswordPage extends StatefulWidget {
  @override
  _ForgetPasswordPageState createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  String hintText = 'Enter your new Password';
  String newPassword;
  String newPasswordCode;
  bool isHidden = true;
  bool setForgetForPasswordPage = true;
  String username;

  final userPool = new CognitoUserPool(
    'us-east-1_RrWQ0yWhg',
    '7omgkncbjkr1rdc7lotit0dlfb',
  );

  void setTypeAsForgetPassword() {
    setState(() {
      setForgetForPasswordPage = !setForgetForPasswordPage;
    });
  }

  Widget _showErrorDialog(String errorMessage) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return PlatformAlertDialog(
            title: Text('Authentication Error'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(errorMessage),
                ],
              ),
            ),
            actions: <Widget>[
              PlatformDialogAction(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              PlatformDialogAction(
                child: Text('Ok'),
                actionType: ActionType.Preferred,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  Widget _showSuccessDialog(String successMessage) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return PlatformAlertDialog(
            title: Text('Authentication Successful'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(successMessage),
                ],
              ),
            ),
            actions: <Widget>[
              PlatformDialogAction(
                actionType: ActionType.Preferred,
                child: Text('Ok'),
                onPressed: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.fade,
                          child: DoctorRegPage()));
                },
              ),
            ],
          );
        });
  }

  void toggleVisibility() {
    setState(() {
      isHidden = !isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF2a82ba),
                Color(0xFF66ccf3),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Forgot Password',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 34.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 30.0, top: 30.0, right: 30.0),
                      child: TextField(
                        cursorColor: Colors.white,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        onChanged: (value) {
                          username = value;
                        },
                        decoration: InputDecoration(
                          hintText: 'Enter your Username',
                          hintStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(13.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xFF76ead7), width: 2.5),
                            borderRadius:
                                BorderRadius.all(Radius.circular(13.0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xFF76ead7), width: 3.5),
                            borderRadius:
                                BorderRadius.all(Radius.circular(13.0)),
                          ),
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 30.0, top: 50.0, right: 30.0),
                      child: Center(
                        child: GestureDetector(
                          child: Container(
                            width: MediaQuery.of(context).size.width - 130,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Color(0xFF76ead7),
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 12.0),
                              child: Center(
                                child: Text(
                                  "PROCEED",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              ),
                            ),
                          ),
                          onTap: () async {
                            final cognitoUser =
                                new CognitoUser('$username', userPool);
                            var data;
                            try {
                              data = await cognitoUser.forgotPassword();
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.fade,
                                      child: ForgetPasswdPageForVerification(
                                        cognitoUser: cognitoUser,
                                      )));
                            } catch (e) {
                              _showErrorDialog(
                                  "Some unknown error has occurred.");
                              print(e);
                            }
                            print('Code sent to $data');
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
