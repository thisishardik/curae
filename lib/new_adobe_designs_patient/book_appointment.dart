import 'dart:math';
import 'package:biocom2/aws_services/user.dart';
import 'package:biocom2/networking/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';
import 'package:http/http.dart';
import 'package:page_transition/page_transition.dart';
import 'package:platform_alert_dialog/platform_alert_dialog.dart';

import 'package:time_range_picker/time_range_picker.dart';
import 'package:http/http.dart' as http;

class AdobeBookAppointment extends StatefulWidget {
  String name;
  String occupation;
  AdobeBookAppointment({this.name, this.occupation});
  @override
  _AdobeBookAppointmentState createState() => _AdobeBookAppointmentState();
}

class _AdobeBookAppointmentState extends State<AdobeBookAppointment> {
  DateTime _dateTime;
  TimeOfDay time = TimeOfDay.now();
  int timeInHour;
  int timeInMinutes;
  String nameOfPatient;
  String ageOfPatient;
  String dobOfPatient;
  String sexOfPatient;
  TimeOfDay picked;
  int flag = 0;
  String problemDescription;
  UserModel _userModel;
  TextEditingController nameController = TextEditingController();
  TextEditingController jobController = TextEditingController();

  _makePostRequest(String name, String time, String comp, String P_name,
      String DOB, String age, String sex) async {
    // set up POST requtgest arguments
    String url =
        'https://9jm5pmcjc0.execute-api.us-east-1.amazonaws.com/maakidua/anish2000';
    Map<String, String> headers = {"Content-type": "application/json"};

    String json =
        '{"name": "$name", "time": "$time", "comp": "$comp", "Puser": "$P_name", "dob": "$DOB", "age": "$age", "gen": "$sex" }';
    // make POST request
    // check the status code for the result

    if (name == null ||
        time == null ||
        comp == null ||
        P_name == null ||
        DOB == null ||
        age == null ||
        sex == null) {
      _showErrorDialog('Please Fill all the fields');
    } else {
      Response response = await post(url, headers: headers, body: json);
      int statusCode = response.statusCode;
      String body = response.body;
      print(statusCode);
    }
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

  @override
  void initState() {
    _dateTime = DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: null,
          backgroundColor: Colors.white,
          elevation: 0.0,
          actions: [
            IconButton(
              icon: Icon(Icons.close, color: Colors.black),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 90.0,
                width: 90.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  border: Border.all(
                    color: Colors.blueGrey,
                  ),
                ),
                child: Center(
                  child: CircleAvatar(
                    radius: 50.0,
                    backgroundImage: AssetImage('assets/images/avatar.jpg'),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.0, left: 35.0, right: 35.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Dr. ${widget.name}',
                          style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          '${widget.occupation}',
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 15.0, left: 35.0, right: 35.0),
                child: Container(
                  height: 1.5,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey.withOpacity(0.5),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF6CA8F1),
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6.0,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  height: 60.0,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'OpenSans',
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(top: 14.0),
                        hintText: 'Name',
                        hintStyle: TextStyle(
                          color: Colors.white54,
                          fontFamily: 'OpenSans',
                        ),
                      ),
                      onChanged: (value) {
                        nameOfPatient = value;
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF6CA8F1),
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6.0,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  height: 60.0,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'OpenSans',
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(top: 14.0),
                        hintText: 'Age',
                        hintStyle: TextStyle(
                          color: Colors.white54,
                          fontFamily: 'OpenSans',
                        ),
                      ),
                      onChanged: (value) {
                        ageOfPatient = value;
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF6CA8F1),
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6.0,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  height: 60.0,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'OpenSans',
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(top: 14.0),
                        hintText: 'Gender',
                        hintStyle: TextStyle(
                          color: Colors.white54,
                          fontFamily: 'OpenSans',
                        ),
                      ),
                      onChanged: (value) {
                        sexOfPatient = value;
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF6CA8F1),
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6.0,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  height: 60.0,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'OpenSans',
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(top: 14.0),
                        hintText: 'Date of Birth',
                        hintStyle: TextStyle(
                          color: Colors.white54,
                          fontFamily: 'OpenSans',
                        ),
                      ),
                      onChanged: (value) {
                        dobOfPatient = value;
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF6CA8F1),
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6.0,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  height: 60.0,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'OpenSans',
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(top: 14.0),
                        hintText: 'Problem Description',
                        hintStyle: TextStyle(
                          color: Colors.white54,
                          fontFamily: 'OpenSans',
                        ),
                      ),
                      onChanged: (value) {
                        problemDescription = value;
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 60.0,
                        decoration: BoxDecoration(
                          color: Color(0xFFEFEFF6),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Choose Date',
                              style: TextStyle(
                                  color: Color(0xFF6B6690),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700),
                            ),
                            GestureDetector(
                              onTap: () {
                                showRoundedDatePicker(
                                  theme: ThemeData.dark(),
                                  context: context,
                                  initialDate: _dateTime == null
                                      ? DateTime.now()
                                      : _dateTime,
                                  firstDate: DateTime(2001),
                                  lastDate: DateTime(2022),
                                  borderRadius: 16,

                                  /// Do substring at length = 11 to get only the date
                                ).then((date) {
                                  setState(() {
                                    _dateTime = date;
                                  });
                                  print(_dateTime);
                                });
                              },
                              child: Container(
                                height: 40.0,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Icon(
                                          Icons.calendar_today,
                                          size: 18,
                                        ),
                                        SizedBox(
                                          width: 10.0,
                                        ),
                                        Text(
                                          _dateTime.toString() == null
                                              ? DateTime.now()
                                              : _dateTime
                                                  .toString()
                                                  .substring(0, 11),
                                          style: TextStyle(
                                            color: Colors.blueAccent,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),

              ///                 time
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 60.0,
                        decoration: BoxDecoration(
                          color: Color(0xFFEFEFF6),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Choose Time Slot',
                              style: TextStyle(
                                  color: Color(0xFF6B6690),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700),
                            ),
                            Container(
                              height: 40.0,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Icon(
                                        Icons.access_time,
                                        size: 18,
                                      ),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      Text(
//                                        startTime == null ?
                                        "${timeInHour == null ? '00' : timeInHour} : ${timeInMinutes == null ? '00' : timeInMinutes}",
//                                            : startTime,
                                        style: TextStyle(
                                          color: Colors.blueAccent,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              ///                 time
//              Padding(
//                padding: const EdgeInsets.only(
//                    left: 20.0, right: 20.0, top: 20.0, bottom: 20.0),
//                child: Row(
//                  children: [
//                    Expanded(
//                      child: Container(
//                        height: 60.0,
//                        decoration: BoxDecoration(
//                          color: Color(0xFFEFEFF6),
//                          borderRadius: BorderRadius.circular(10.0),
//                        ),
//                        child: Row(
//                          mainAxisAlignment: MainAxisAlignment.spaceAround,
//                          crossAxisAlignment: CrossAxisAlignment.center,
//                          children: [
//                            Container(
//                              height: 35.0,
//                              decoration: BoxDecoration(
//                                color: Colors.white,
//                                borderRadius: BorderRadius.circular(5.0),
//                              ),
//                              child: Center(
//                                child: Padding(
//                                  padding: const EdgeInsets.all(10.0),
//                                  child: Text(
//                                    startTime == null
//                                        ? '00:00'
//                                        : startTime.toString(),
//                                    style: TextStyle(
//                                      fontWeight: FontWeight.w700,
//                                      fontFamily: 'Montserrat',
//                                    ),
//                                  ),
//                                ),
//                              ),
//                            ),
//                            Text(
//                              '-',
//                              style: TextStyle(
//                                fontWeight: FontWeight.bold,
//                                fontSize: 17.0,
//                              ),
//                            ),
//                            Container(
//                              height: 35.0,
//                              decoration: BoxDecoration(
//                                color: Colors.white,
//                                borderRadius: BorderRadius.circular(5.0),
//                              ),
//                              child: Center(
//                                child: Padding(
//                                  padding: const EdgeInsets.all(10.0),
//                                  child: Text(
//                                    endTime == null ? '00:00' : endTime,
//                                    style: TextStyle(
//                                      fontFamily: 'Montserrat',
//                                      fontWeight: FontWeight.w700,
//                                    ),
//                                  ),
//                                ),
//                              ),
//                            ),
//                          ],
//                        ),
//                      ),
//                    ),
//                  ],
//                ),
//              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () async {
                      _selectTime(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 18.0),
                      child: Container(
                        width: 120.0,
                        height: 45.0,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        child: Center(
                          child: Text(
                            'Choose Slot',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 0.0,
              ),
//              GestureDetector(
//                onTap: () {
//                  setState(() {
//                    flag = 1;
//                  });
//                },
//                child: Padding(
//                  padding: const EdgeInsets.all(15.0),
//                  child: Container(
//                    width: 200.0,
//                    height: 45.0,
//                    decoration: BoxDecoration(
//                      color: Color(0xFF68B2A0),
//                      borderRadius: BorderRadius.circular(50.0),
//                    ),
//                    child: Center(
//                      child: Text(
//                        'Check Availability',
//                        style: TextStyle(
//                          color: Colors.white,
//                          fontWeight: FontWeight.w600,
//                          fontSize: 16.0,
//                        ),
//                      ),
//                    ),
//                  ),
//                ),
//              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Container(
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Center(
                            child: Text(
                          'Cancel',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17.0,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Nunito'),
                        )),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: GestureDetector(
                        onTap: () async {
//                          final UserModel userModel = await createUser(
//                              widget.name,
//                              '$_dateTime ' +
//                                  '$timeInHour' +
//                                  ':' +
//                                  '$timeInMinutes',
//                              problemDescription,
//                              nameOfPatient);
//                          final UserModel userModel = await createUser();
//                          final UserModel userModel = await createUser(
//                              'anish2000',
//                              '2020-08-15 15:30',
//                              'hllo',
//                              'hardik');
//                        _makePostRequest(widget.name, time, comp, P_name)
//                          setState(() {
//                            _userModel = userModel;
//                          });
                          _makePostRequest(
                            widget.name,
                            '$_dateTime+$timeInHour+$timeInMinutes',
                            problemDescription,
                            nameOfPatient,
                            dobOfPatient,
                            ageOfPatient,
                            sexOfPatient,
                          );
                          print(_userModel);
                        },
                        child: Container(
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: Color(0xFFFEB755),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Center(
                              child: Text(
                            'Book',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 17.0,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Nunito'),
                          )),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<Null> _selectTime(BuildContext context) async {
    picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: time.hour, minute: time.minute),
    );
    setState(() {
      time = picked;
      timeInHour = time.hour;
      timeInMinutes = time.minute;
      print(time.hour);

      print(time);
    });
  }
}
