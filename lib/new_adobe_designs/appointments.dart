import 'package:biocom2/new_adobe_designs/dashboard.dart';
import 'package:biocom2/new_adobe_designs/my_profile.dart';
import 'package:biocom2/new_adobe_designs/patients.dart';
import 'package:biocom2/tools/calender_timeline.dart';
import 'package:bubble_timeline/bubble_timeline.dart';
import 'package:bubble_timeline/timeline_item.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';
import 'package:page_transition/page_transition.dart';
import 'package:timeline_list/timeline.dart';
import 'package:timeline_list/timeline_model.dart';

class AdobeAppointments extends StatefulWidget {
  @override
  _AdobeAppointmentsState createState() => _AdobeAppointmentsState();
}

class _AdobeAppointmentsState extends State<AdobeAppointments> {
  DateTime _dateTime;

  @override
  void initState() {
    _dateTime = DateTime.now();
    super.initState();
  }

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
                      onPressed: () {},
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
                      onPressed: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.fade,
                                child: AdobeMyProfile()));
                      },
                    )
                  ],
                )),
          ),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Color(0xFFdbf0f4),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40.0),
                    bottomRight: Radius.circular(40.0),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.menu,
                                color: Color(0xFF115291),
                              ),
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              'Dr. Alexix Mangla',
                              style: const TextStyle(
                                color: Color(0xFF115291),
                                fontSize: 23.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/avatar.jpg'),
                          radius: 23.0,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20.0,
                  ),
                  Text(
                    'Your Appointments',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 15.0,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              CarouselSlider(
                options: CarouselOptions(
                  height: 150.0,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  viewportFraction: 0.8,
                ),
                items: [
                  Container(
                    margin: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Color(0xFFb3efea),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/images/avatar.jpg'),
                              radius: 35.0,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Harsh Gour',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.5,
                                  ),
                                ),
                                Text(
                                  '19 | Male',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat',
                                    fontSize: 16.5,
                                  ),
                                ),
                                SizedBox(
                                  height: 3.0,
                                ),
                                Text(
                                  '23/06/2000',
                                  style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.5,
                                  ),
                                ),
                                Text(
                                  '6:00 - 6:30 ',
                                  style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.5,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Color(0xFFb3efea),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/images/avatar.jpg'),
                              radius: 35.0,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Harsh Gour',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.5,
                                  ),
                                ),
                                Text(
                                  '19 | Male',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat',
                                    fontSize: 16.5,
                                  ),
                                ),
                                SizedBox(
                                  height: 3.0,
                                ),
                                Text(
                                  '23/06/2000',
                                  style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.5,
                                  ),
                                ),
                                Text(
                                  '6:00 - 6:30 ',
                                  style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.5,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Color(0xFFb3efea),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/images/avatar.jpg'),
                              radius: 35.0,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Harsh Gour',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.5,
                                  ),
                                ),
                                Text(
                                  '19 | Male',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat',
                                    fontSize: 16.5,
                                  ),
                                ),
                                SizedBox(
                                  height: 3.0,
                                ),
                                Text(
                                  '23/06/2000',
                                  style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.5,
                                  ),
                                ),
                                Text(
                                  '6:00 - 6:30 ',
                                  style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.5,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
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
                                height: 35.0,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(
                                      _dateTime.toString() == null
                                          ? DateTime.now()
                                          : _dateTime
                                              .toString()
                                              .substring(0, 11),
                                      style: TextStyle(
                                        color: Color(0xFF6B6690),
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
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
//              Container(
//                child: DatePicker(
//                  DateTime.now().add(Duration(days: -3)),
//                  width: 60,
//                  height: 80,
//                  daysCount: 500,
//                  controller: _controller,
//                  initialSelectedDate: DateTime.now(),
//                  selectionColor: Color(0xFF414956),
//                  selectedTextColor: Colors.white,
//                  onDateChange: (date) {
//                    // New date selected
//                    setState(() {
//                      _selectedValue = date;
//                    });
//                  },
//                ),
//              ),
//            BubbleTimeline()
              SizedBox(
                height: 30.0,
              ),
              buildTimeline(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTimeline() {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return Stack(
          children: <Widget>[
            new Padding(
              padding: const EdgeInsets.only(left: 45.0),
              child: new Container(
                margin: new EdgeInsets.all(20.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 7.0,
                  child: new Container(
                    height: 130,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/images/avatar.jpg'),
                                radius: 35.0,
                              ),
                              SizedBox(
                                width: 25.0,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'ML Srivastava',
                                    style: TextStyle(
                                      color: Color(0xFF115291),
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat',
                                      fontSize: 22.0,
                                    ),
                                  ),
                                  Text(
                                    '19 | Male',
                                    style: TextStyle(
                                      color: Color(0xFF115291),
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat',
                                      fontSize: 18.0,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    '23/06/2000',
                                    style: TextStyle(
                                      color: Color(0xFF115291),
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13.0,
                                    ),
                                  ),
                                  Text(
                                    '6:00 - 6:30 ',
                                    style: TextStyle(
                                      color: Color(0xFF115291),
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13.0,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0.0,
              bottom: 0.0,
              left: 35.0,
              child: new Container(
                height: double.infinity,
                width: 2.0,
                color: Colors.blueGrey,
              ),
            ),
            Positioned(
              top: 70.0,
              left: 16.0,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: new Container(
                  margin: new EdgeInsets.all(5.0),
                  height: 20.0,
                  width: 20.0,
                  decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blueGrey,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
