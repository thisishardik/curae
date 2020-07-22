import 'dart:math';

import 'package:biocom2/consult_now/consult_now.dart';
import 'package:biocom2/doctor_contacts/doctor_contacts.dart';
import 'package:biocom2/emergency/emergency.dart';
import 'package:biocom2/meet_my_patients/meet_my_patients.dart';
import 'package:biocom2/my_profile/my_profile.dart';
import 'package:biocom2/view_record/view_record.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:biocom2/home_screen/dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';
import 'package:page_transition/page_transition.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:time_range_picker/time_range_picker.dart';

class MyProfile extends StatefulWidget {
  static String id = "my_profile";

  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  int _currentIndex = 4;
  GlobalKey _bottomNavigationKey = GlobalKey();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  List _myWeekSchedule;
  String _myActivitiesResult;
  final formKey = new GlobalKey<FormState>();

  String startTime = '00:00';
  String endTime = '00:00';
  int totalSteps = 500;
  int currentStep = 230;

  _saveForm() {
    var form = formKey.currentState;
    if (form.validate()) {
      form.save();
      setState(() {
        _myActivitiesResult = _myWeekSchedule.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Color(0xFFfcfcfc),
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
                Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.fade,
                      child: MeetMyPatients(),
                    ));
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
                print('clicked');
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
        body: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Color(0xFF2a82ba),
                Color(0xFF66ccf3),
              ])),
            ),
            Positioned(
              top: -20,
              right: 0,
              left: 0,
              child: Container(
                height: 85,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Text(
                        'User Profile',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Jost',
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: ListView(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 135, right: 20, left: 20),
                    height: 1600,
                    width: 350,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.red.withOpacity(.1),
                              blurRadius: 20,
                              spreadRadius: 10),
                        ]),
                    child: Form(
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 135,
                            width: 130,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/avatar.jpg'),
                                    fit: BoxFit.fill),
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(
                                    color: Colors.blueAccent.withOpacity(.2),
                                    width: 1)),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Dr. Kaleen Bhaiya',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Neurologist',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 10.0, right: 10.0),
                            child: Text(
                              'ASD6596D1S64E894D1F6DA65489EA',
                              style: TextStyle(
                                  color: Colors.deepOrange,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 20.0, right: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Username',
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  'superkaleen',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 20.0, right: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Date of Birth',
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  '30-02-1947',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 30),
                            padding: EdgeInsets.only(
                                left: 20, right: 20, top: 8, bottom: 15.0),
                            width: 320,
                            height: 570,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(.1),
                                      blurRadius: 30,
                                      spreadRadius: 5)
                                ],
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10.0, right: 6.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        'Sittings Schedule',
                                        style: TextStyle(
                                            color: Colors.blue,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 6.0, right: 6.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Timings',
                                        style: TextStyle(
                                            color: Colors.blue,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 6.0, right: 6.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text('Starting:   ',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                          )),
                                      Text(
                                        startTime == '00:00'
                                            ? '00:00'
                                            : startTime + ' hrs',
                                        style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 6.0, right: 6.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        'Ending:     ',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        endTime == '00:00'
                                            ? '00:00'
                                            : endTime + ' hrs',
                                        style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                RaisedButton(
                                  color: Colors.blueAccent,
                                  onPressed: () async {
                                    TimeRange result =
                                        await showTimeRangePicker(
                                            context: context,
                                            start:
                                                TimeOfDay(hour: 9, minute: 0),
                                            end: TimeOfDay(hour: 12, minute: 0),
                                            strokeWidth: 4,
                                            ticks: 24,
                                            ticksOffset: -7,
                                            ticksLength: 15,
                                            fromText: 'From',
                                            toText: 'Till',
                                            ticksColor: Colors.grey,
                                            labels: [
                                              "12 pm",
                                              "3 am",
                                              "6 am",
                                              "9 am",
                                              "12 am",
                                              "3 pm",
                                              "6 pm",
                                              "9 pm"
                                            ].asMap().entries.map((e) {
                                              return ClockLabel.fromIndex(
                                                  idx: e.key,
                                                  length: 8,
                                                  text: e.value);
                                            }).toList(),
                                            onStartChange: (value) {
                                              print("Start time" +
                                                  value.toString());
                                              setState(() {
                                                startTime = value
                                                    .toString()
                                                    .substring(
                                                        10,
                                                        value
                                                            .toString()
                                                            .lastIndexOf(')'));
                                              });
                                            },
                                            onEndChange: (value) {
                                              print("Start time" +
                                                  value.toString());
                                              setState(() {
                                                endTime = value
                                                    .toString()
                                                    .substring(
                                                        10,
                                                        value
                                                            .toString()
                                                            .lastIndexOf(')'));
                                              });
                                            },
                                            labelOffset: 35,
                                            rotateLabels: false,
                                            padding: 60);

                                    print("result " + result.toString());
                                  },
                                  child: Text("Select Time",
                                      style: TextStyle(color: Colors.white)),
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10.0, right: 6.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        'Weekday Slots',
                                        style: TextStyle(
                                            color: Colors.blue,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                MultiSelectFormField(
                                  autovalidate: false,
                                  titleText: 'My Schedule',
                                  validator: (value) {
                                    if (value == null || value.length == 0) {
                                      return 'Please select one or more options';
                                    }
                                    return null;
                                  },
                                  dataSource: [
                                    {
                                      "display": "Monday",
                                      "value": "Monday",
                                    },
                                    {
                                      "display": "Tuesday",
                                      "value": "Tuesday",
                                    },
                                    {
                                      "display": "Wednesday",
                                      "value": "Wednesday",
                                    },
                                    {
                                      "display": "Thursday",
                                      "value": "Thursday",
                                    },
                                    {
                                      "display": "Friday",
                                      "value": "Friday",
                                    },
                                    {
                                      "display": "Saturday",
                                      "value": "Saturday",
                                    },
                                    {
                                      "display": "Sunday",
                                      "value": "Sunday",
                                    },
                                  ],
                                  textField: 'display',
                                  valueField: 'value',
                                  okButtonLabel: 'OK',
                                  cancelButtonLabel: 'CANCEL',
                                  // required: true,
                                  hintText: 'Please choose one or more',
                                  initialValue: _myWeekSchedule,
                                  onSaved: (value) {
                                    if (value == null) return;
                                    setState(() {
                                      _myWeekSchedule = value;
                                    });
                                  },
                                ),
                                Container(
                                  padding: EdgeInsets.all(8),
                                  child: RaisedButton(
                                    color: Colors.blueAccent,
                                    child: Text(
                                      'Save',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    onPressed: _saveForm,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 30),
                            padding: EdgeInsets.only(
                                left: 20, right: 20, top: 8, bottom: 15.0),
                            width: 320,
                            height: 450,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(.1),
                                      blurRadius: 30,
                                      spreadRadius: 5)
                                ],
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10.0, right: 6.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        'Appointments Schedule',
                                        style: TextStyle(
                                            color: Colors.blue,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      '$currentStep Patients',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: StepProgressIndicator(
                                        totalSteps: totalSteps,
                                        currentStep: currentStep,
                                        size: 8,
                                        padding: 0,
                                        selectedColor: Colors.yellow,
                                        unselectedColor: Colors.cyan,
                                        roundedEdges: Radius.circular(10),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5.0,
                                    ),
                                    RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: '$currentStep / ',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w800,
                                            ),
                                          ),
                                          TextSpan(
                                            text: totalSteps.toString(),
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w800,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 30.0, right: 30.0, top: 30.0),
                                  child: Container(
                                    height: 3.0,
                                    width: 300.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF000046),
                                      borderRadius:
                                          BorderRadius.circular(100.0),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 20.0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20.0,
                                              right: 20.0,
                                              top: 20.0),
                                          child: Container(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '2000',
                                                  style: TextStyle(
                                                    fontSize: 30.0,
                                                    fontFamily: 'AbrilFatface',
                                                    color: Color(0xFF3a96ca),
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                SizedBox(height: 2.0),
                                                Text(
                                                  'Appointments',
                                                  style: TextStyle(
                                                    fontSize: 15.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20.0,
                                              right: 20.0,
                                              top: 20.0),
                                          child: Container(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '3000',
                                                  style: TextStyle(
                                                    fontSize: 30.0,
                                                    fontFamily: 'AbrilFatface',
                                                    color: Color(0xFF3a96ca),
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                SizedBox(height: 2.0),
                                                Text(
                                                  'Total Patients',
                                                  style: TextStyle(
                                                    fontSize: 15.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 20.0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10.0,
                                              right: 10.0,
                                              top: 20.0),
                                          child: Container(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '13,500',
                                                  style: TextStyle(
                                                    fontSize: 30.0,
                                                    fontFamily: 'AbrilFatface',
                                                    color: Color(0xFF3a96ca),
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                SizedBox(height: 2.0),
                                                Text(
                                                  'Consultations',
                                                  style: TextStyle(
                                                    fontSize: 15.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10.0,
                                              right: 10.0,
                                              top: 20.0),
                                          child: Container(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '6500',
                                                  style: TextStyle(
                                                    fontSize: 30.0,
                                                    fontFamily: 'AbrilFatface',
                                                    color: Color(0xFF3a96ca),
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                SizedBox(height: 2.0),
                                                Text(
                                                  'Return Patients',
                                                  style: TextStyle(
                                                    fontSize: 15.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 200,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
