import 'package:biocom2/home_screen/grid_doctors_tile.dart';
import 'package:biocom2/new_adobe_designs/appointments.dart';
import 'package:biocom2/new_adobe_designs/my_profile.dart';
import 'package:biocom2/new_adobe_designs/patients.dart';
import 'package:biocom2/new_adobe_designs_patient/all_doctors_page.dart';
import 'package:biocom2/new_adobe_designs_patient/doctor_details.dart';
import 'package:biocom2/new_adobe_designs_patient/my_records.dart';
import 'package:biocom2/new_adobe_designs_patient/patient_profile_page.dart';
import 'package:biocom2/new_login_signup/patient_reg_page.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';

class AdobeDashboardPatient extends StatefulWidget {
  static String id = 'dashboard_p';
  @override
  _AdobeDashboardPatientState createState() => _AdobeDashboardPatientState();
}

class _AdobeDashboardPatientState extends State<AdobeDashboardPatient> {
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
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.home),
                      onPressed: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.fade,
                                child: AdobeAllDoctorsPage()));
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
                                child: AdobeMyRecords()));
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.home),
                      onPressed: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.fade,
                                child: PatientProfilePage()));
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
                  color: Color(0xFFDBF4E4),
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
                        IconButton(
                          icon: Icon(
                            Icons.menu,
                            color: Color(0xFF68B2A0),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/avatar.jpg'),
                            radius: 30.0,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Good Evening',
                          style: const TextStyle(
                            color: Color(0xFF205072),
                            fontFamily: 'Montserrat',
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Alexix',
                          style: const TextStyle(
                            color: Color(0xFF205072),
                            fontFamily: 'Montserrat',
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05),
                        Text(
                          'Your target for today is to keep positive mindset and smile to everyone you meet.',
                          style: const TextStyle(
                            color: Color(0xFF68B2A0),
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0,
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.025),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                width: 85.0,
                                height: 30.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFF119142),
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                child: Center(
                                  child: Text(
                                    'View Profile',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12.0),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 18.0,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.fade,
                                    child: AdobeAllDoctorsPage(),
                                  ),
                                );
                              },
                              child: Container(
                                width: 130.0,
                                height: 30.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFF119142),
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                child: Center(
                                  child: Text(
                                    'Book appointment',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12.5),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 25.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Container(
                  padding: EdgeInsets.only(
                      left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
                  height: 130,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        const Color(0xff3FBCEB),
                        const Color(0xff38A7D1),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        left: 0,
                        child: Container(
                          height: 140,
                          child: Image.asset(
                            "assets/images/own_test.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned.fill(
                        left: 140,
                        top: 10,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Do you have any symptoms?",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      "Checkout our Chatbot",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                    Icon(
                                      Icons.arrow_forward,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
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
                    'Doctors',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 16.5),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                padding: const EdgeInsets.only(left: 16.0),
                height: 150.0,
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    GridDoctorsTile(
                      title: "General Physician",
                      image: 'assets/doctor_vectors/physician.jpg',
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            child: AdobeAllDoctorsPage(),
                          ),
                        );
                      },
                    ),
                    SizedBox(width: 10.0),
                    GridDoctorsTile(
                        title: "Dentist",
                        image: 'assets/doctor_vectors/dentist.jpg'),
                    SizedBox(width: 10.0),
                    GridDoctorsTile(
                        title: "Endocrinologist",
                        image: 'assets/doctor_vectors/diabetes.jpg'),
                    SizedBox(width: 10.0),
                    GridDoctorsTile(
                        title: "Gastrologist",
                        image: 'assets/doctor_vectors/gastro.jpg'),
                    SizedBox(width: 10.0),
                    GridDoctorsTile(
                        title: "Psychiatrist",
                        image: 'assets/doctor_vectors/psy.png'),
                    SizedBox(width: 10.0),
                    GridDoctorsTile(
                        title: "Cardiologist",
                        image: 'assets/doctor_vectors/heart.jpg'),
                    SizedBox(width: 10.0),
                    GridDoctorsTile(
                        title: "Dermatologist",
                        image: 'assets/doctor_vectors/skin.jpg'),
                    SizedBox(width: 10.0),
                    GridDoctorsTile(
                        title: "Gynaecologist",
                        image: 'assets/doctor_vectors/gynae.jpg'),
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
                    'Your Medication',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 16.5),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          top: 15.0, left: 15.0, right: 15.0, bottom: 10.0),
                      child: Container(
//                        height: 100.0,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.blueGrey,
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 5.0,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 5.0,
                                ),
                                Container(
                                  height: 20.0,
                                  width: 20.0,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.black45,
                                      width: 1.5,
                                    ),
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text(
                                  'Paracetemol',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Poppins'),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Container(
                              height: 1.5,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black45,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CircleAvatar(
                                  backgroundImage:
                                      AssetImage('assets/images/sun.png'),
                                  radius: 15.0,
                                ),
                                CircleAvatar(
                                  backgroundImage:
                                      AssetImage('assets/images/evening.jpg'),
                                  radius: 15.0,
                                ),
                                CircleAvatar(
                                  backgroundImage:
                                      AssetImage('assets/images/moon.jpg'),
                                  radius: 15.0,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  '5 Tbs',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  '2 Tbs',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  '1 Tbs',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  }),
              SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20.0,
                  ),
                  Text(
                    'Upcoming Appointments',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 16.5),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {},
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 25.0, right: 25.0, bottom: 20.0),
                        child: Container(
                          height: 130,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Color(0xffB8E2C7),
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
                                      backgroundImage: AssetImage(
                                          'assets/images/avatar.jpg'),
                                      radius: 35.0,
                                    ),
                                    SizedBox(
                                      width: 25.0,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Dr. Falana Dikhana',
                                          style: TextStyle(
                                            color: Colors.black87,
                                            fontWeight: FontWeight.w700,
                                            fontFamily: 'Montserrat',
                                            fontSize: 20.0,
                                          ),
                                        ),
                                        Text(
                                          'Dentist',
                                          style: TextStyle(
                                            color: Colors.black87,
                                            fontWeight: FontWeight.w700,
                                            fontFamily: 'Montserrat',
                                            fontSize: 17.0,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5.0,
                                        ),
                                        Text(
                                          '23/06/2020',
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
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
