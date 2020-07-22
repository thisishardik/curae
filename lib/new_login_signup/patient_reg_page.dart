import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PatientRegPage extends StatefulWidget {
  static String id = 'patient_reg_page';

  PatientRegPage({Key key}) : super(key: key);

  @override
  _PatientRegPageState createState() => _PatientRegPageState();
}

class _PatientRegPageState extends State<PatientRegPage> {
  List<Color> colors = [
    Color(0xFF66ccf3),
    Color(0xFF2a82ba),
  ];
  int _index = 0;
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
                  SizedBox(height: 10.0),
                  Image.asset(
                    'assets/images/patient-removebg-preview.png',
                    width: 300,
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
          ),
        ),
      ),
    );
  }

  Widget Login(BuildContext context) {
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
                                    BorderSide(color: Colors.transparent))),
                      ),
                      Divider(color: Colors.grey, height: 8),
                      TextField(
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
                                    BorderSide(color: Colors.transparent))),
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
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: GestureDetector(
              child: Center(
                child: Text(
                  "Forget Password?",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
              onTap: () {},
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
            padding: const EdgeInsets.only(top: 15.0),
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
                  onTap: () {},
                ),
              ],
            ),
          ),
          SizedBox(height: 25.0),
        ],
      ),
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
                                labelText: "Name",
                                labelStyle: TextStyle(color: Colors.black87),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent)),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent))),
                          ),
                          Divider(color: Colors.grey, height: 8),
                          TextField(
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
                          ),
                          Divider(color: Colors.grey, height: 8),
                          TextField(
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
                                        BorderSide(color: Colors.transparent))),
                          ),
                          Divider(color: Colors.grey, height: 8),
                          TextField(
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
                                        BorderSide(color: Colors.transparent))),
                          ),
                          Divider(color: Colors.grey, height: 8),
                          TextField(
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Colors.grey,
                                ),
                                labelText: "Confirm Password",
                                labelStyle: TextStyle(color: Colors.black87),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent)),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent))),
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
                        )),
                      ),
                    ),
                  ),
                ),
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
}
