import 'package:biocom2/new_adobe_designs_patient/all_doctors_page.dart';
import 'package:biocom2/new_adobe_designs_patient/dashboard_p.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class AdobeMyRecords extends StatefulWidget {
  @override
  _AdobeMyRecordsState createState() => _AdobeMyRecordsState();
}

class _AdobeMyRecordsState extends State<AdobeMyRecords> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
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
                        onPressed: () {},
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
                  height: 25.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
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
                          style: TextStyle(color: Colors.white, fontSize: 17.0),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, top: 20.0, bottom: 10.0),
                      child: Text(
                        '19 Feb, 2020',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
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
                          height: 80.0,
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
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 5.0,
                                  ),
                                  Text(
                                    'X-Ray Report',
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
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/images/file.jpg',
                                    height: 90.0,
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'reports.pdf',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              ],
            ),
          )),
    );
  }
}
