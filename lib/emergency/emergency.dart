import 'package:biocom2/consult_now/consult_now.dart';
import 'package:biocom2/doctor_contacts/doctor_contacts.dart';
import 'package:biocom2/meet_my_patients/meet_my_patients.dart';
import 'package:biocom2/my_profile/my_profile.dart';
import 'package:biocom2/view_record/view_record.dart';
import 'package:flutter/material.dart';
import 'package:biocom2/home_screen/dashboard.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:page_transition/page_transition.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';

class Emergency extends StatefulWidget {
  static String id = 'emergency';

  @override
  _EmergencyState createState() => _EmergencyState();
}

class _EmergencyState extends State<Emergency> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int _currentIndex = 3;
//  String idGenerator =
//      '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
//
//  void randomIdGenerator(int size,  String idGenerator)
//  {
//  return ''.join(random.choice(allowed_chars) for x in range(str_size));
//  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFddf3f5),
        key: _scaffoldKey,
        appBar: AppBar(
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(Icons.menu, color: Colors.black),
            onPressed: () => _scaffoldKey.currentState.openDrawer(),
          ),
          backgroundColor: Color(0xFFddf3f5),
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
                          icon: Icon(Icons.close,
                              size: 30.0, color: Colors.white),
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
                              type: PageTransitionType.fade,
                              child: MyProfile()));
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
                Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.fade,
                      child: MeetMyPatients(),
                    ));
              }
              if (_currentIndex == 3) {
                print('pressed');
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
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('My QR',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Montserrat',
                    fontSize: 45.0,
                    fontWeight: FontWeight.w600,
                  )),
              Center(
                child: Container(
                  height: 300,
                  child: SfBarcodeGenerator(
                    value: 'ASDda654d5s94X64AS645d0s',
                    symbology: QRCode(),
                    showValue: false,
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
