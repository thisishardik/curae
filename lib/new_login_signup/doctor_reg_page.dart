import 'package:biocom2/aws_services/user.dart';
import 'package:biocom2/aws_services/user_service.dart';
import 'package:biocom2/home_screen/dashboard.dart';
import 'package:biocom2/new_login_signup/forget_password_page.dart';
import 'package:biocom2/shared_prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:page_transition/page_transition.dart';
import 'package:platform_alert_dialog/platform_alert_dialog.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';
import 'package:amazon_cognito_identity_dart_2/sig_v4.dart';
import 'package:shared_preferences/shared_preferences.dart';

final userPool = new CognitoUserPool(
  'us-east-1_RrWQ0yWhg',
  '7omgkncbjkr1rdc7lotit0dlfb',
);

class DoctorRegPage extends StatefulWidget {
  static String id = 'doctor_reg_page';
  DoctorRegPage({Key key}) : super(key: key);

  @override
  _DoctorRegPageState createState() => _DoctorRegPageState();
}

class _DoctorRegPageState extends State<DoctorRegPage> {
  List<Color> colors = [
    Color(0xFF2a82ba),
    Color(0xFF66ccf3),
  ];
  int _index = 0;

  UserInfoFromSharedPrefs userInfoFromSharedPrefs = UserInfoFromSharedPrefs();
  User user = User();
  UserService userService = UserService(userPool);
  String username;
  String name;
  String email;
  String number;
  String address;
  String password;
  String gender;
  String aadharNumber;
  String verificationCode;
  String status;
  String newPassword;
  String newPasswordCode;
  bool setForget = false;
  bool _isAuthenticated = false;

  List<CognitoUserAttribute> attributes;

  Future<UserService> _getValues() async {
    await userService.init();
    _isAuthenticated = await userService.checkAuthenticated();
    return userService;
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
                child: Text('Login'),
                actionType: ActionType.Preferred,
                onPressed: () {
                  setTypeAsForgetPassword();
                },
              ),
            ],
          );
        });
  }

  void setTypeAsForgetPassword() {
    setState(() {
      setForget = !setForget;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        bottom: false,
        left: false,
        right: false,
        child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: colors,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter),
            ),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 25.0),
                    Image.asset(
                      'assets/images/doctor-removebg-preview.png',
                      width: 220,
                    ),
                    Tabs(context),
                    AnimatedCrossFade(
                      duration: Duration(milliseconds: 150),
                      firstChild: Login(context),
                      secondChild: SignUp(context),
                      crossFadeState: _index == 0
                          ? CrossFadeState.showFirst
                          : CrossFadeState.showSecond,
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }

  Widget Login(BuildContext context) {
    return FutureBuilder(
      future: _getValues(),
      builder: (context, AsyncSnapshot<UserService> snapshot) {
        if (snapshot.hasData) {
          if (_isAuthenticated) {
            return Home();
          }
          return Padding(
            padding: const EdgeInsets.only(top: 30.0, left: 15, right: 15),
            child: Column(
              children: <Widget>[
                Stack(
                  overflow: Overflow.visible,
                  alignment: Alignment.bottomCenter,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 10.0,
                          left: 15,
                          right: 15,
                          bottom: 10.0,
                        ),
                        child: Column(
                          children: <Widget>[
                            TextField(
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: Colors.grey,
                                ),
                                labelText: "Username",
                                labelStyle: TextStyle(color: Colors.black87),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent)),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                ),
                              ),
                              onChanged: (value) {
                                username = value;
                              },
                            ),
                            Divider(color: Colors.grey, height: 8),
                            TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Colors.grey,
                                ),
                                labelText: "Password",
                                labelStyle: TextStyle(color: Colors.black87),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent)),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                ),
                              ),
                              onChanged: (value) {
                                password = value;
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.0,
                ),
                Center(
                  child: GestureDetector(
                    child: Container(
                      width: MediaQuery.of(context).size.width - 100,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Color(0xFF76ead7),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Center(
                            child: Text(
                          "SIGN IN",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        )),
                      ),
                    ),
                    onTap: () async {
                      try {
                        user = await userService.login(username, password);
                      } catch (e) {
                        _showErrorDialog("Please check your credentials.");
                      }
//                final cognitoUser = new CognitoUser(username, userPool);
//                final authDetails = new AuthenticationDetails(
//                  username: '$username',
//                  password: '$password',
//                );
//                CognitoUserSession session;
//                try {
//                  session = await cognitoUser.authenticateUser(authDetails);
//                } on CognitoUserNewPasswordRequiredException catch (e) {
//                  _showErrorDialog('Some error has occurred.');
//                  print(e);
//                } on CognitoUserMfaRequiredException catch (e) {
//                  _showErrorDialog(
//                      'Please make sure that the credentials entered are correct.');
//                  print(e);
//                  // handle SMS_MFA challenge
//                } on CognitoUserSelectMfaTypeException catch (e) {
//                  print(e);
//                  // handle SELECT_MFA_TYPE challenge
//                } on CognitoUserMfaSetupException catch (e) {
//                  print(e);
//                  // handle MFA_SETUP challenge
//                } on CognitoUserTotpRequiredException catch (e) {
//                  print(e);
//                  // handle SOFTWARE_TOKEN_MFA challenge
//                } on CognitoUserCustomChallengeException catch (e) {
//                  print(e);
//                  // handle CUSTOM_CHALLENGE challenge
//                } on CognitoUserConfirmationNecessaryException catch (e) {
//                  print(e);
//                  // handle User Confirmation Necessary
//                } on CognitoClientException catch (e) {
//                  print(e);
//                  _showErrorDialog(
//                      'Please make sure that the credentials entered are correct.');
//                  // handle Wrong Username and Password and Cognito Client
//                } catch (e) {
//                  print(e);
//                }
//                print(session.getAccessToken().getJwtToken());
//
//                final SharedPreferences prefs =
//                    await userInfoFromSharedPrefs.saveInfo();
//                prefs.setString('username', username);

//                userInfoFromSharedPrefs
//                    .saveInfo()
//                    .then((SharedPreferences prefs) {
//                  prefs.setString('username', username);
//                });
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.fade,
                              child: Home(
//                          userAttributes: attributes,
//                          session: session,
                                  )));
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 45.0),
                  child: GestureDetector(
                    child: Center(
                        child: Text(
                      "Forgot Password?",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    )),
                    onTap: () {
//                setTypeAsForgetPassword();
//                final cognitoUser =
//                    new CognitoUser("hardy.lko@gmail.com", userPool);
//                var data;
//                try {
//                  data = await cognitoUser.forgotPassword();
//                } catch (e) {
//                  print(e);
//                }
//                print('Code sent to $data');
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.fade,
                              child: ForgetPasswordPage()));
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 55,
                        height: 1,
                        color: Colors.white,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Text(
                          "OR",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        width: 55,
                        height: 1,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        child: CircleAvatar(
                          backgroundImage: AssetImage(
                            'assets/images/google.png',
                          ),
                          radius: 20.0,
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.fade,
                                  child: Home()));
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
        return Scaffold(
          appBar: AppBar(
            leading: Text('Loading App'),
          ),
        );
      },
    );
  }

  Widget SignUp(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0, left: 15, right: 15),
      child: Column(
        children: <Widget>[
          Stack(
              overflow: Overflow.visible,
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                      left: 10.0, right: 10.0, bottom: 65.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 10.0, left: 15, right: 15, bottom: 20),
                      child: Column(
                        children: <Widget>[
                          TextField(
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: Colors.grey,
                                ),
                                labelText: "Username",
                                labelStyle: TextStyle(color: Colors.black87),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent)),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent))),
                            onChanged: (value) {
                              username = value;
                            },
                          ),
                          Divider(color: Colors.grey, height: 8),
//                          TextField(
//                            decoration: InputDecoration(
//                                prefixIcon: Icon(
//                                  Icons.person,
//                                  color: Colors.grey,
//                                ),
//                                labelText: "Name",
//                                labelStyle: TextStyle(color: Colors.black87),
//                                enabledBorder: UnderlineInputBorder(
//                                    borderSide:
//                                        BorderSide(color: Colors.transparent)),
//                                focusedBorder: UnderlineInputBorder(
//                                    borderSide:
//                                        BorderSide(color: Colors.transparent))),
//                            onChanged: (value) {
//                              name = value;
//                            },
//                          ),
//                          Divider(color: Colors.grey, height: 8),
                          TextField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.email,
                                color: Colors.grey,
                              ),
                              labelText: "Email",
                              labelStyle: TextStyle(color: Colors.black87),
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                              ),
                            ),
                            onChanged: (value) {
                              email = value;
                            },
                          ),
                          Divider(color: Colors.grey, height: 8),
                          TextField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.phone,
                                color: Colors.grey,
                              ),
                              labelText: "Contact Number",
                              labelStyle: TextStyle(color: Colors.black87),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent)),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                              ),
                            ),
                            onChanged: (value) {
                              number = value;
                            },
                          ),
                          Divider(color: Colors.grey, height: 8),
                          TextField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.person_outline,
                                color: Colors.grey,
                              ),
                              labelText: "Gender",
                              labelStyle: TextStyle(color: Colors.black87),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent)),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                              ),
                            ),
                            onChanged: (value) {
                              gender = value;
                            },
                          ),
                          Divider(color: Colors.grey, height: 8),
                          TextField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.phone,
                                color: Colors.grey,
                              ),
                              labelText: "Aadhar Number",
                              labelStyle: TextStyle(color: Colors.black87),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent)),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                              ),
                            ),
                            onChanged: (value) {
                              aadharNumber = value;
                            },
                          ),
                          Divider(color: Colors.grey, height: 8),
                          TextField(
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.home,
                                color: Colors.grey,
                              ),
                              labelText: "Address",
                              labelStyle: TextStyle(color: Colors.black87),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent)),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                              ),
                            ),
                            onChanged: (value) {
                              address = value;
                            },
                          ),
                          Divider(color: Colors.grey, height: 8),
                          TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Colors.grey,
                              ),
                              labelText: "Password",
                              labelStyle: TextStyle(color: Colors.black87),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent)),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                              ),
                            ),
                            onChanged: (value) {
                              password = value;
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Center(
                    child: GestureDetector(
                        child: Container(
                          width: MediaQuery.of(context).size.width - 100,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Color(0xFF76ead7),
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12.0),
                            child: Center(
                              child: Text(
                                "SIGN UP",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                        onTap: () async {
                          user = await userService.signUp(username, email,
                              password, number, gender, aadharNumber, address);
//                          final userAttributes = [
//                            AttributeArg(name: 'name', value: '$username'),
//                            AttributeArg(name: 'email', value: '$email'),
//                            AttributeArg(
//                                name: 'phone_number', value: '+91$number'),
//                            AttributeArg(name: 'address', value: '$address'),
//                            AttributeArg(name: 'gender', value: '$gender')
//                          ];
                          print('*******************************');
                          print(username);
                          print('*******************************');
                          var data;
                          try {
//                            data = await userPool.signUp(
//                              '$username',
//                              '$password',
//                              userAttributes: userAttributes,
//                            );
//                            showDialog(
//                                context: context,
//                                builder: (BuildContext context) {
//                                  return PlatformAlertDialog(
//                                    title: Text('Confirm Verification'),
//                                    content: SingleChildScrollView(
//                                      child: ListBody(
//                                        children: <Widget>[
//                                          Text('Enter your OTP'),
//                                        ],
//                                      ),
//                                    ),
//                                    actions: <Widget>[
//                                      TextField(
//                                        onChanged: (value) {
//                                          setState(() {
//                                            verificationCode = value;
//                                          });
//                                        },
//                                      ),
//                                      PlatformDialogAction(
//                                        child: Text('Resend OTP'),
//                                        onPressed: () {
//                                          //Todo Add Resend OTP functionality
//                                        },
//                                      ),
//                                      PlatformDialogAction(
//                                          child: Text('Submit'),
//                                          actionType: ActionType.Preferred,
//                                          onPressed: () async {
//                                            final cognitoUser =
//                                                CognitoUser(username, userPool);
//                                            bool registrationConfirmed = false;
//                                            try {
//                                              registrationConfirmed =
//                                                  await cognitoUser
//                                                      .confirmRegistration(
//                                                          verificationCode);
//                                              Navigator.pop(context);
//                                            } catch (e) {
//                                              print(e);
//                                              _showErrorDialog(
//                                                  'Authentication Error, Please make sure details are correct.');
//                                            }
//                                          }),
//                                    ],
//                                  );
//                                });
                            Alert(
                                context: context,
                                title:
                                    "Enter the OTP sent on your registered Email",
                                content: Column(
                                  children: <Widget>[
                                    TextField(
                                      decoration: InputDecoration(
                                        icon: Icon(Icons.sms),
                                        labelText: 'OTP',
                                      ),
                                      onChanged: (value) {
                                        verificationCode = value;
                                      },
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    GestureDetector(
                                      onTap: () async {
                                        final cognitoUser =
                                            new CognitoUser(username, userPool);
                                        try {
                                          status = await cognitoUser
                                              .resendConfirmationCode();
                                        } catch (e) {
                                          print(e);
                                        }
                                      },
                                      child: Text(
                                        'Resend OTP',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                buttons: [
                                  DialogButton(
                                    onPressed: () async {
                                      print(verificationCode);
                                      final cognitoUser =
                                          new CognitoUser(username, userPool);

                                      bool registrationConfirmed = false;
                                      try {
                                        registrationConfirmed =
                                            await cognitoUser
                                                .confirmRegistration(
                                                    '$verificationCode');
                                        Navigator.pop(context);
                                      } catch (e) {
                                        print(e);
                                      }
                                      print(registrationConfirmed);
                                    },
                                    child: Text(
                                      " SUBMIT",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                  )
                                ]).show();
                          } catch (e) {
                            print(e);
                          }
                        })),
                SizedBox(height: 60.0),
              ]),
          SizedBox(height: 60.0),
//          Padding(
//            padding: const EdgeInsets.only(top: 40.0),
//            child: Row(
//              mainAxisAlignment: MainAxisAlignment.center,
//              children: <Widget>[
//                Container(
//                  width: 55,
//                  height: 1,
//                  color: Colors.white,
//                ),
//                Padding(
//                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
//                  child: Text(
//                    "Or",
//                    style: TextStyle(
//                        color: Colors.white,
//                        fontSize: 15,
//                        fontWeight: FontWeight.bold),
//                  ),
//                ),
//                Container(
//                  width: 55,
//                  height: 1,
//                  color: Colors.white,
//                ),
//              ],
//            ),
//          ),
//          Padding(
//            padding: const EdgeInsets.only(top: 25.0),
//            child: Row(
//              mainAxisAlignment: MainAxisAlignment.center,
//              children: <Widget>[
//                GestureDetector(
//                  child: CircleAvatar(
//                    backgroundImage: AssetImage(
//                      'assets/images/google.png',
//                    ),
//                    radius: 25.0,
//                  ),
//                  onTap: () {},
//                ),
//              ],
//            ),
//          ),
        ],
      ),
    );
  }

  Widget Tabs(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 30.0, left: 15, right: 15),
      child: Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.12),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: GestureDetector(
                  child: Container(
                      decoration: BoxDecoration(
                          color:
                              _index == 0 ? Colors.white : Colors.transparent,
                          borderRadius: BorderRadius.circular(25)),
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Existing",
                          style: TextStyle(
                              color: _index == 0 ? Colors.black : Colors.white,
                              fontSize: 18,
                              fontWeight: _index == 0
                                  ? FontWeight.bold
                                  : FontWeight.normal),
                        ),
                      ))),
                  onTap: () {
                    setState(() {
                      _index = 0;
                    });
                  },
                ),
              ),
              Expanded(
                child: GestureDetector(
                  child: Container(
                      decoration: BoxDecoration(
                          color:
                              _index == 1 ? Colors.white : Colors.transparent,
                          borderRadius: BorderRadius.circular(25)),
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "New",
                          style: TextStyle(
                              color: _index == 1 ? Colors.black : Colors.white,
                              fontSize: 18,
                              fontWeight: _index == 1
                                  ? FontWeight.bold
                                  : FontWeight.normal),
                        ),
                      ))),
                  onTap: () {
                    setState(() {
                      _index = 1;
                    });
                  },
                ),
              )
            ],
          )),
    );
  }
} //helllo
