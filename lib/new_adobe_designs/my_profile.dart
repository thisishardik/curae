import 'package:biocom2/new_adobe_designs/appointments.dart';
import 'package:biocom2/new_adobe_designs/dashboard.dart';
import 'package:biocom2/new_adobe_designs/patients.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:time_range_picker/time_range_picker.dart';

class AdobeMyProfile extends StatefulWidget {
  static String id = 'my_profile';
  @override
  _AdobeMyProfileState createState() => _AdobeMyProfileState();
}

class _AdobeMyProfileState extends State<AdobeMyProfile> {
  double containerLength = 250;
  String startTime = '00:00';
  String endTime = '00:00';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.white,
            elevation: 0.0,
            child: Container(
              height: 100.0,
              width: 100.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF6ad396),
                        Color(0xFF3ca79b),
                      ])),
              child: Icon(
                Icons.camera,
                size: 28.0,
                color: Colors.white,
              ),
            )),
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          child: Container(
            height: 60.0,
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
//                    Container(
//                      decoration: BoxDecoration(
//                        shape: BoxShape.circle,
//                        image: DecorationImage(
//                          image: AssetImage('assets/icons/Icons-home.png'),
//                        ),
//                      ),
//                    ),
                    IconButton(
                      icon: Icon(Icons.home),
                      onPressed: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.fade,
                                child: AdobeDashboard()));
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.home),
                      onPressed: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.fade,
                                child: AdobeAppointments()));
                      },
                    ),
                    Container(),
                    IconButton(
                      icon: Icon(Icons.home),
                      onPressed: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.fade,
                                child: AdobePatients()));
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.home),
                      onPressed: () {},
                    )
                  ],
                )),
          ),
        ),
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
            Container(
              height: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30.0),
                  bottomLeft: Radius.circular(30.0),
                ),
                gradient: LinearGradient(
                  colors: [
                    Color(0xff23b6e6),
                    Color(0xff02d39a),
                  ],
                ),
              ),
            ),
            Positioned(
              top: -3.5,
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
                        'Your Profile',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Jost',
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListView(
              children: <Widget>[
                SizedBox(height: 135.0),
                Container(
                  margin: EdgeInsets.only(right: 40, left: 45),
                  height: 380,
                  width: 300,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xff444444).withOpacity(.1),
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
                          height: 90,
                          width: 90,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/avatar.jpg'),
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
                          "@manglabangla",
                          style: TextStyle(
                            color: Color(0xff444444),
                            fontFamily: 'Poppins',
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 40.0, right: 40.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Name: ',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff444444),
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                'Alexis Mangla',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Color(0xff444444),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 40.0, right: 40.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Age: ',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff444444),
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                '19',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Color(0xff444444),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 40.0, right: 40.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Gender: ',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff444444),
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                'Male',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Color(0xff444444),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 40.0, right: 40.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'DOB: ',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff444444),
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                '29/11/2001',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Color(0xff444444),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 40.0, right: 40.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Licence: ',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff444444),
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                '5689-5321-5622',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Color(0xff444444),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 40.0, right: 40.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Address: ',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff444444),
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                'Far Far Away',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Color(0xff444444),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 45.0),
                Container(
                  margin: EdgeInsets.only(right: 40, left: 45),
                  height: containerLength,
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                          color: Color(0xff444444).withOpacity(.1),
                          blurRadius: 20,
                          spreadRadius: 10),
                    ],
                  ),
                  child: Form(
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Your Timings",
                          style: TextStyle(
                            color: Color(0xff444444),
                            fontFamily: 'Poppins',
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, right: 20.0, top: 20.0, bottom: 20.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 60.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFEFEFF6),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                          height: 35.0,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          child: Center(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Text(
                                                '$startTime',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontFamily: 'Montserrat',
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        '-',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17.0,
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                          height: 35.0,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          child: Center(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Text(
                                                '$endTime',
                                                style: TextStyle(
                                                  fontFamily: 'Montserrat',
                                                  fontWeight: FontWeight.w700,
                                                ),
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
                        GestureDetector(
                          onTap: () async {
                            TimeRange result = await showTimeRangePicker(
                                context: context,
                                start: TimeOfDay(hour: 9, minute: 0),
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
                                      idx: e.key, length: 8, text: e.value);
                                }).toList(),
                                onStartChange: (value) {
                                  print("Start time" + value.toString());
                                  setState(() {
                                    startTime = value.toString().substring(
                                        10, value.toString().lastIndexOf(')'));
                                  });
                                },
                                onEndChange: (value) {
                                  print("Start time" + value.toString());
                                  setState(() {
                                    endTime = value.toString().substring(
                                        10, value.toString().lastIndexOf(')'));
                                    containerLength += 150;
                                  });
                                },
                                labelOffset: 35,
                                rotateLabels: false,
                                padding: 60);

                            print("result " + result.toString());
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 110.0, right: 110.0),
                            child: Container(
                              height: 35.0,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              child: Center(
                                child: Text(
                                  'Add Slot',
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
                  ),
                ),
                SizedBox(
                  height: 200,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
