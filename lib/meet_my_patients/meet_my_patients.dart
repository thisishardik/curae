import 'dart:developer';
import 'dart:ui' as ui;
import 'package:biocom2/doctor_contacts/doctor_contacts.dart';
import 'package:biocom2/emergency/emergency.dart';
import 'package:biocom2/home_screen/dashboard.dart';
import 'package:biocom2/meet_my_patients/qr_code_scanner.dart';
import 'package:biocom2/my_profile/my_profile.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:page_transition/page_transition.dart';

class MeetMyPatients extends StatefulWidget {
  static String id = 'meet_my_patients';

  final String qrLink;
  MeetMyPatients({this.qrLink});

  @override
  _MeetMyPatientsState createState() => _MeetMyPatientsState();
}

class _MeetMyPatientsState extends State<MeetMyPatients> {
  int _currentIndex = 2;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final bar = SnackBar(content: Text('You are already on this page!'));

  String name = 'Aditya Mangla';
  String complaint = 'Fever';
  int age = 22;
  DateTime dateTime = DateTime(2020, 07, 10, 15, 30, 0);
  String time = '10-07-2020 15:30';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//        appBar: AppBar(
//          primary: true,
//          elevation: 0,
//          iconTheme: IconThemeData(color: Colors.black87),
//          backgroundColor: Color(0xFFecfbfc),
//          leading: IconButton(
//            icon: Icon(
//              Icons.sort,
//              color: Colors.black,
//              size: 24,
//            ),
//          ),
//          actions: <Widget>[
//            SizedBox(
//              width: 5.0,
//            ),
//            IconButton(
//              // ToDo Add notification dot. Put them in a stack and use positioned for placement
//              icon: Icon(Icons.notifications, color: Colors.black, size: 24),
//            ),
//            IconButton(
//              // ToDo Add notification dot. Put them in a stack and use positioned for placement
//              icon: Icon(
//                Icons.person,
//                color: Colors.black,
//                size: 24,
//              ),
//            ),
//          ],
////          bottom: PreferredSize(
////            preferredSize: Size.fromHeight(33.0),
////            child: Row(
////              children: <Widget>[
////                SizedBox(
////                  width: 3.5,
////                ),
////                Align(
////                  alignment: Alignment.centerLeft,
////                  child: IconButton(
////                    icon: Icon(
////                      Icons.location_on,
////                      color: Colors.black,
////                      size: 20.0,
////                    ),
////                  ),
////                ),
////                Text(
////                  'Lucknow, Uttar Pradesh',
////                  style: TextStyle(
////                      fontWeight: FontWeight.w500,
////                      fontSize: 15,
////                      color: Colors.black),
////                ),
////              ],
////            ),
////          ),
//        ),
      key: _scaffoldKey,
      appBar: GradientAppBar(
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.white),
          onPressed: () => _scaffoldKey.currentState.openDrawer(),
        ),
        gradient: LinearGradient(
          colors: [
            Color(0xFF2a82ba),
            Color(0xFF66ccf3),
          ],
        ),
      ),
      bottomNavigationBar: CustomNavigationBar(
        iconSize: 27.0,
        selectedColor: Color(0xff0c18fb),
        strokeColor: Color(0x300c18fb),
        unSelectedColor: Colors.grey[600],
        backgroundColor: Colors.white,
        items: [
          CustomNavigationBarItem(
            icon: Icons.home,
          ),
          CustomNavigationBarItem(
            icon: Icons.location_on,
          ),
          CustomNavigationBarItem(
            icon: Icons.assignment,
          ),
          CustomNavigationBarItem(
            icon: Icons.report_problem,
          ),
          CustomNavigationBarItem(
            icon: CupertinoIcons.person_solid,
          ),
        ],
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            if (_currentIndex == 0) {
              Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.fade,
                    child: Home(),
                  ));
            }
            if (_currentIndex == 1) {
              Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.fade,
                    child: DoctorContacts(),
                  ));
            }
            if (_currentIndex == 2) {
              print('clicked');
            }
            if (_currentIndex == 3) {
              Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.fade,
                    child: Emergency(),
                  ));
            }
            if (_currentIndex == 4) {
              Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.fade,
                    child: MyProfile(),
                  ));
//              Navigator.pushNamed(context, MyProfile.id);
            }
          });
        },
      ),
      drawer: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Drawer(
          elevation: 20.0,
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  Color(0xFF66ccf3),
                  Color(0xFF2a82ba),
                ])),
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                SizedBox(
                  height: 15.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        icon:
                            Icon(Icons.close, size: 30.0, color: Colors.white),
                        onPressed: () => Navigator.pop(context)),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 35.0,
                          ),
                          child: CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/avatar.jpg'),
                            radius: 47.0,
                          ),
                        ),
                        SizedBox(width: 20.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 15.0,
                            ),
                            Text(
                              'Dr. T Vasanth',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 3.0,
                            ),
                            Text(
                              'Oncologist',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            GestureDetector(
                              onTap: () {
                                print('Edit Profile Clicked');
                              },
                              child: Text(
                                'View and Edit Profile',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.0,
                ),
                ListTile(
                  title: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text(
                      "Dashboard",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 19.0,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.fade, child: Home()));
                  },
                ),
                ListTile(
                  title: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text(
                      "Services",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 19.0,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  title: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text(
                      "All Appointments",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 19.0,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  trailing: Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: Container(
                      height: 15.0,
                      width: 15.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                    ),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  title: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text(
                      "Doctors",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 19.0,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  title: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text(
                      "Pharmacies",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 19.0,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  onTap: () {},
                ),
                SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                  child: Container(
                    height: 3.0,
                    width: 300.0,
                    decoration: BoxDecoration(
                      color: Color(0xFF000046),
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                ListTile(
                  title: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text(
                      "My Profile",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 19.0,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.fade, child: MyProfile()));
                  },
                ),
                ListTile(
                  title: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text(
                      "FAQ",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 19.0,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  title: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text(
                      "About Us",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 19.0,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF2a82ba),
              Color(0xFF66ccf3),
            ],
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: MediaQuery.of(context).size.height * 0.05,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      "Meet your Patients",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            DraggableScrollableSheet(
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return Stack(
                  overflow: Overflow.visible,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(40),
                            topLeft: Radius.circular(40)),
                      ),
                      child: ListView(
//                      physics: BouncingScrollPhysics(),
                        controller: scrollController,
                        children: [
                          SizedBox(
                            height: 25.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Upcoming Appointments',
                                style: TextStyle(
                                    fontSize: 22.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          ConstrainedBox(
                            constraints: BoxConstraints(
                                maxHeight: MediaQuery.of(context).size.height),
                            child: ListView.builder(
                                controller: scrollController,
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemCount: 5,
                                itemBuilder: (context, index) {
                                  return Padding(
                                      padding: const EdgeInsets.only(
                                          left: 35.0, right: 35.0, top: 20.0),
                                      child: GestureDetector(
                                        onTap: () {
                                          print('pressed');
                                          showModalBottomSheet(
                                            context: context,
                                            builder:
                                                (BuildContext buildContext) {
                                              return Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    .60,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: <Widget>[
                                                      Row(
                                                        children: <Widget>[
                                                          Text(
                                                            name,
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 25.0,
                                                            ),
                                                          ),
                                                          Spacer(),
                                                          IconButton(
                                                            icon: Icon(
                                                              Icons.cancel,
                                                              color:
                                                                  Colors.orange,
                                                              size: 25,
                                                            ),
                                                            onPressed: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                          )
                                                        ],
                                                      ),
                                                      RichText(
                                                        textAlign:
                                                            TextAlign.center,
                                                        text:
                                                            TextSpan(children: [
                                                          TextSpan(
                                                              text: 'Age: ',
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              )),
                                                          TextSpan(
                                                            text:
                                                                age.toString(),
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.blue,
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                          )
                                                        ]),
                                                      ),
                                                      SizedBox(
                                                        height: 10.0,
                                                      ),
                                                      RichText(
                                                        textAlign:
                                                            TextAlign.center,
                                                        text:
                                                            TextSpan(children: [
                                                          TextSpan(
                                                            text: 'Complaint: ',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                          ),
                                                          TextSpan(
                                                            text: complaint,
                                                            style: TextStyle(
                                                              color: Colors.red,
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                          )
                                                        ]),
                                                      ),
                                                      SizedBox(
                                                        height: 10.0,
                                                      ),
                                                      Text(
                                                        'Diagnosis',
                                                        style: TextStyle(
                                                          fontSize: 21,
                                                          color: Colors.green,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 60.0,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: <Widget>[
                                                          RaisedButton(
                                                            child: Text('Scan'),
                                                            color: Colors
                                                                .deepPurple,
                                                            textColor:
                                                                Colors.white,
                                                            onPressed: () {
                                                              Navigator.push(
                                                                  context,
                                                                  PageTransition(
                                                                      type: PageTransitionType
                                                                          .fade,
                                                                      child:
                                                                          QrCodeScanner()));
                                                            },
                                                          ),
                                                          SizedBox(
                                                            width: 20.0,
                                                          ),
                                                          RaisedButton(
                                                            child:
                                                                Text('Delete'),
                                                            color: Colors.red,
                                                            textColor:
                                                                Colors.white,
                                                            onPressed: () {},
                                                          )
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                        child: Stack(
                                          children: [
                                            Container(
                                              height: 120.0,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.0),
                                                  gradient: LinearGradient(
                                                      begin: Alignment.topLeft,
                                                      end:
                                                          Alignment.bottomRight,
                                                      colors: [
                                                        Color(0xFF12cad6),
                                                        Color(0xFF0fabbc),
                                                      ]),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Color(0xFF12cad6),
                                                      blurRadius: 1.0,
                                                      offset: Offset(0, 1),
                                                    ),
                                                  ]),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Row(
                                                    children: [
                                                      SizedBox(
                                                        width: 25.0,
                                                      ),
                                                      CircleAvatar(
                                                        backgroundImage:
                                                            AssetImage(
                                                          'assets/images/avatar.jpg',
                                                        ),
                                                        radius: 35.0,
                                                      ),
                                                      SizedBox(
                                                        width: 20.0,
                                                      ),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            name,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 16.5,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 8.0,
                                                          ),
                                                          RichText(
                                                            textAlign: TextAlign
                                                                .center,
                                                            text: TextSpan(
                                                                children: [
                                                                  TextSpan(
                                                                      text:
                                                                          'Age: ',
                                                                      style:
                                                                          TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            16.5,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      )),
                                                                  TextSpan(
                                                                    text: age
                                                                        .toString(),
                                                                    style:
                                                                        TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          15,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                    ),
                                                                  )
                                                                ]),
                                                          ),
                                                          SizedBox(
                                                            height: 8.0,
                                                          ),
                                                          Text(
                                                            'Appointment',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 16.5,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 2.0,
                                                          ),
                                                          Text(
                                                            dateTime
                                                                .toString()
                                                                .substring(
                                                                    0,
                                                                    dateTime
                                                                        .toString()
                                                                        .lastIndexOf(
                                                                            ':')),
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 16.5,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                            Positioned(
                                              right: 0,
                                              top: 0,
                                              bottom: 0,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(0.5),
                                                child: CustomPaint(
                                                  size: Size(80, 150),
                                                  painter:
                                                      CustomCardShapePainter(
                                                    radius: 24.0,
                                                    startColor:
                                                        Color(0xFF12cad6),
                                                    endColor: Color(0xFF0fabbc),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ));
                                }),
                          ),
                        ],
                      ),
                    ),
//                  Positioned(
//                    child: FloatingActionButton(
//                      child: Icon(
//                        Icons.add,
//                        color: Colors.white,
//                      ),
//                      backgroundColor: Colors.pinkAccent,
//                    ),
//                    top: -30,
//                    right: 30,
//                  )
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showSnackBar(BuildContext context) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(
        'You are currently viewing this page!',
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      duration: const Duration(milliseconds: 1000),
    ));
  }

  void _showModalBottomSheet(
      context, String name, String complaint, int age, String qrLink) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return Container(
          height: MediaQuery.of(context).size.height * .60,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                      ),
                    ),
                    Spacer(),
                    IconButton(
                      icon: Icon(
                        Icons.cancel,
                        color: Colors.orange,
                        size: 25,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(children: [
                    TextSpan(
                        text: 'Age: ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        )),
                    TextSpan(
                      text: age.toString(),
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ]),
                ),
                SizedBox(
                  height: 10.0,
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(children: [
                    TextSpan(
                        text: 'Complaint: ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        )),
                    TextSpan(
                      text: complaint,
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ]),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Diagnosis',
                  style: TextStyle(
                    fontSize: 21,
                    color: Colors.green,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'QR Link: ' + qrLink == null ? 'Scan QR Code' : qrLink,
                  style: TextStyle(
                    fontSize: 21,
                    color: Colors.green,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 60.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      child: Text('Scan'),
                      color: Colors.deepPurple,
                      textColor: Colors.white,
                      onPressed: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.fade,
                                child: QrCodeScanner()));
                      },
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    RaisedButton(
                      child: Text('Delete'),
                      color: Colors.red,
                      textColor: Colors.white,
                      onPressed: () {},
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class CustomCardShapePainter extends CustomPainter {
  final Color startColor;
  final double radius;
  final Color endColor;

  CustomCardShapePainter({this.radius, this.endColor, this.startColor});

  @override
  void paint(Canvas canvas, Size size) {
    var radius = 0.0;

    var paint = Paint();
    paint.shader = ui.Gradient.linear(
        Offset(0, 0), Offset(size.width, size.height), [
      HSLColor.fromColor(startColor).withLightness(0.8).toColor(),
      endColor
    ]);

    var path = Path()
      ..moveTo(0, size.height)
      ..lineTo(size.width - radius, size.height)
      ..quadraticBezierTo(size.width, 0, size.width - radius, 0)
      ..lineTo(size.width - 1.5 * radius, 0)
      ..quadraticBezierTo(-radius, 2 * radius, 0, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
