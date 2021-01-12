import 'package:biocom2/networking/doctor_data.dart';
import 'package:biocom2/networking/network_helper.dart';
import 'package:biocom2/new_adobe_designs/my_profile.dart';
import 'package:biocom2/new_adobe_designs/patient_details.dart';
import 'package:biocom2/new_adobe_designs_patient/dashboard_p.dart';
import 'package:biocom2/new_adobe_designs_patient/doctor_details.dart';
import 'package:biocom2/new_adobe_designs_patient/my_records.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:page_transition/page_transition.dart';

class AdobeAllDoctorsPage extends StatefulWidget {
  static String id = 'all_doctors_page';
  @override
  _AdobeAllDoctorsPageState createState() => _AdobeAllDoctorsPageState();
}

class _AdobeAllDoctorsPageState extends State<AdobeAllDoctorsPage> {
  DoctorData doctorData = DoctorData();
  int i = 0;
  String name;
  String slot;
  String profession;
  String openTime;
  String closeTime;

  bool showSpinner = false;

  void updateUI(dynamic doctorData, int i) {
    setState(() {
      name = doctorData[i]['username'];
      profession = doctorData[i]['Spec'];
      slot = doctorData[i]['weekday_slot'];
      openTime = doctorData[i]['open_time'];
      closeTime = doctorData[i]['close_time'];
      print(name);
    });
  }

  @override
  void initState() {
//    var doctorModel = doctorData.getDoctorData();
//    updateUI(doctorModel, i);
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
                                child: AdobeDashboardPatient()));
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
                                child: AdobeMyRecords()));
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
        body: FutureBuilder(
            future: doctorData.getDoctorData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return SingleChildScrollView(
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
                                      'Alexix Mangla',
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
                        height: 25.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Container(
                                height: 47.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50.0),
                                  color: Colors.blueGrey.withOpacity(0.35),
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(width: 18.0),
                                    Icon(
                                      Icons.search,
                                      size: 22.0,
                                      color: Colors.white,
                                    ),
                                    SizedBox(width: 15.0),
                                    Text(
                                      'Search',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 17.0),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.refresh,
                              color: Colors.black,
                            ),
                          )
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
                                    child: AdobeDoctorDetails(
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
                                      height: 150,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
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
                                                      "${snapshot.data[index]['username']}",
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xFF115291),
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontFamily:
                                                            'Montserrat',
                                                        fontSize: 22.0,
                                                      ),
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          "${snapshot.data[index]['Spec']}",
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xFF115291),
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontFamily:
                                                                'Montserrat',
                                                            fontSize: 16.0,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 5.0,
                                                    ),
                                                    Text(
                                                      "${snapshot.data[index]['weekend_slot']}",
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xFF115291),
                                                        fontFamily:
                                                            'Montserrat',
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 16.0,
                                                      ),
                                                    ),
                                                    Text(
                                                      "${snapshot.data[index]['open_time']} - ${snapshot.data[index]['close_time']}",
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xFF115291),
                                                        fontFamily:
                                                            'Montserrat',
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
            }),
      ),
    );
  }
}
