import 'package:biocom2/networking/patient_data.dart';
import 'package:biocom2/new_adobe_designs/appointments.dart';
import 'package:biocom2/new_adobe_designs/dashboard.dart';
import 'package:biocom2/new_adobe_designs/my_profile.dart';
import 'package:biocom2/new_adobe_designs/patient_details.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:percent_indicator/percent_indicator.dart';

class AdobePatients extends StatefulWidget {
  @override
  _AdobePatientsState createState() => _AdobePatientsState();
}

class _AdobePatientsState extends State<AdobePatients> {
  PatientData patientData = PatientData();
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
                      onPressed: () {},
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
        body: FutureBuilder(
          future: patientData.getPatientData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
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
                    Container(
                      height: 150.0,
                      padding: EdgeInsets.only(left: 20.0),
                      child: ListView(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: CircularPercentIndicator(
                                radius: 110.0,
                                lineWidth: 12,
                                animation: true,
                                animationDuration: 1000,
                                percent: 0.7,
                                center: new Text(
                                  "70%",
                                  style: new TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                    color: Color(0xFF47c9cb),
                                  ),
                                ),
                                circularStrokeCap: CircularStrokeCap.round,
                                linearGradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color(0xFF6ad396),
                                      Color(0xFF3ca79b),
                                    ])),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: CircularPercentIndicator(
                                radius: 110.0,
                                lineWidth: 12,
                                animation: true,
                                animationDuration: 1000,
                                percent: 0.9,
                                center: new Text(
                                  "90%",
                                  style: new TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                    color: Color(0xFF47c9cb),
                                  ),
                                ),
                                circularStrokeCap: CircularStrokeCap.round,
                                linearGradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color(0xFF6ad396),
                                      Color(0xFF3ca79b),
                                    ])),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: CircularPercentIndicator(
                                radius: 110.0,
                                lineWidth: 12,
                                animation: true,
                                animationDuration: 1000,
                                percent: 0.5,
                                center: new Text(
                                  "50%",
                                  style: new TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                    color: Color(0xFF47c9cb),
                                  ),
                                ),
                                circularStrokeCap: CircularStrokeCap.round,
                                linearGradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color(0xFF6ad396),
                                      Color(0xFF3ca79b),
                                    ])),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: CircularPercentIndicator(
                                radius: 110.0,
                                lineWidth: 12,
                                animationDuration: 1000,
                                animation: true,
                                percent: 0.1,
                                center: new Text(
                                  "10%",
                                  style: new TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                    color: Color(0xFF47c9cb),
                                  ),
                                ),
                                circularStrokeCap: CircularStrokeCap.round,
                                linearGradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color(0xFF6ad396),
                                      Color(0xFF3ca79b),
                                    ])),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: CircularPercentIndicator(
                                radius: 110.0,
                                lineWidth: 12,
                                animation: true,
                                animationDuration: 1000,
                                percent: 0.35,
                                center: new Text(
                                  "35%",
                                  style: new TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                    color: Color(0xFF47c9cb),
                                  ),
                                ),
                                circularStrokeCap: CircularStrokeCap.round,
                                linearGradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color(0xFF6ad396),
                                      Color(0xFF3ca79b),
                                    ])),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: CircularPercentIndicator(
                                radius: 110.0,
                                lineWidth: 12,
                                animation: true,
                                animationDuration: 1000,
                                percent: 0.8,
                                center: new Text(
                                  "80%",
                                  style: new TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                    color: Color(0xFF47c9cb),
                                  ),
                                ),
                                circularStrokeCap: CircularStrokeCap.round,
                                linearGradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color(0xFF6ad396),
                                      Color(0xFF3ca79b),
                                    ])),
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
                          'Your Patients',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 17.0),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.fade,
                                  child: AdobePatientDetails(
                                    index: index,
                                  ),
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 15.0, bottom: 20.0, right: 15.0),
                              child: Container(
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  elevation: 5.0,
                                  child: new Container(
                                    height: 130,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.0),
                                      color: Colors.white,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                                    '${snapshot.data['Items'][index]['P_username']['S']}',
                                                    style: TextStyle(
                                                      color: Color(0xFF115291),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: 'Montserrat',
                                                      fontSize: 22.0,
                                                    ),
                                                  ),
                                                  Text(
                                                    '${snapshot.data['Items'][index]['age']['S']} | ${snapshot.data['Items'][index]['gender']['S']}',
                                                    style: TextStyle(
                                                      color: Color(0xFF115291),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: 'Montserrat',
                                                      fontSize: 18.0,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 5.0,
                                                  ),
                                                  Text(
                                                    'Consultation',
                                                    style: TextStyle(
                                                      color: Color(0xFF115291),
                                                      fontFamily: 'Montserrat',
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 13.0,
                                                    ),
                                                  ),
                                                  Text(
                                                    '${snapshot.data['Items'][index]['TimeStamp']['S']}',
                                                    style: TextStyle(
                                                      color: Color(0xFF115291),
                                                      fontFamily: 'Montserrat',
                                                      fontWeight:
                                                          FontWeight.bold,
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
                          );
                        })
                  ],
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
