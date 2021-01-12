import 'package:biocom2/meet_my_patients/qr_code_scanner.dart';
import 'package:biocom2/networking/calls_and_message_service.dart';
import 'package:biocom2/networking/doctor_data.dart';
import 'package:biocom2/networking/service_locator.dart';
import 'package:biocom2/new_adobe_designs_patient/book_appointment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:url_launcher/url_launcher.dart';

class AdobeDoctorDetails extends StatefulWidget {
  int index;
  AdobeDoctorDetails({this.index});

  @override
  _AdobeDoctorDetailsState createState() => _AdobeDoctorDetailsState();
}

class _AdobeDoctorDetailsState extends State<AdobeDoctorDetails> {
  double rating;
  DoctorData doctorData = DoctorData();
//  final CallsAndMessagesService _service = locator<CallsAndMessagesService>();

  _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: doctorData.getDoctorData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SafeArea(
              child: Scaffold(
                backgroundColor: Colors.white,
                body: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 50.0),
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
                            backgroundImage:
                                AssetImage('assets/images/avatar.jpg'),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(top: 15.0, left: 35.0, right: 35.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Dr. ${snapshot.data[widget.index]['username']}',
                                  style: TextStyle(
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  '${snapshot.data[widget.index]['Spec']}',
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      snapshot.data[widget.index]['Star']
                                          .toString(),
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15.0,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    SmoothStarRating(
                                      allowHalfRating: true,
                                      starCount: 5,
                                      rating: snapshot.data[widget.index]
                                          ['Star'],
                                      size: 25.0,
                                      isReadOnly: false,
                                      color: Colors.yellow,
                                      borderColor: Colors.yellow,
                                      spacing: 2.0,
//                                      onRated: (value) {
//                                        setState(() {
//                                          rating = value;
//                                        });
//                                      },
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
//                                    _service.call(
//                                        snapshot.data[widget.index]['Phone']);
                                  },
                                  child: Container(
                                    height: 50.0,
                                    width: 50.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF4ac18e),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.phone,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 20.0,
                                ),
                                GestureDetector(
                                  onTap: () {
//                                    _service.sendEmail(
//                                        snapshot.data[widget.index]['Email']);
                                  },
                                  child: Container(
                                    height: 50.0,
                                    width: 50.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFfeb755),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.email,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 15.0, left: 20.0, right: 20.0),
                        child: Container(
                          height: 0.5,
                          decoration: BoxDecoration(
                            color: Colors.blueGrey.withOpacity(0.5),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 30.0,
                          ),
                          Text(
                            'Address',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 18.0),
                          ),
                        ],
                      ),
                      SizedBox(height: 0.0),
                      ProblemCard(
                        snapshot.data[widget.index]['Address'],
                      ),
                      SizedBox(height: 15.0),
                      Row(
                        children: [
                          SizedBox(
                            width: 30.0,
                          ),
                          Text(
                            'Working Hours',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 18.0),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 30.0,
                          ),
                          Text(
                            "${snapshot.data[widget.index]['weekend_slot']}",
                            style: TextStyle(
                                fontFamily: 'Nunito',
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 15.0),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 30.0,
                          ),
                          Text(
                            "${snapshot.data[widget.index]['open_time']} - ${snapshot.data[widget.index]['close_time']}",
                            style: TextStyle(
                                fontFamily: 'Nunito',
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 15.0),
                          ),
                        ],
                      ),
                      SizedBox(height: 15.0),
                      Row(
                        children: [
                          SizedBox(
                            width: 30.0,
                          ),
                          Text(
                            'Statistics',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 18.0),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              border: Border.all(
                                  color: Colors.blueGrey, width: 2.5),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '380',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 27.0,
                                      fontFamily: 'AbrilFatface',
                                    ),
                                  ),
                                  Text(
                                    'Visits',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15.0,
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              border: Border.all(
                                  color: Colors.blueGrey, width: 2.5),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(children: [
                                      TextSpan(
                                        text: '10 ',
                                        style: TextStyle(
                                          fontFamily: 'AbrilFatface',
                                          color: Colors.black,
                                          fontSize: 27.0,
                                        ),
                                      ),
                                      TextSpan(
                                        text: 'yrs',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14.0,
                                        ),
                                      ),
                                    ]),
                                  ),
                                  Text(
                                    'Experience',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15.0,
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.fade,
                              child: AdobeBookAppointment(
                                name: snapshot.data[widget.index]['username'],
                                occupation: snapshot.data[widget.index]['Spec'],
                              ),
                            ),
                          );
                        },
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 110.0, right: 110.0),
                          child: Container(
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: Color(0xFF4AC18E),
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            child: Center(
                              child: Text(
                                'Book an Appointment',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50.0,
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  Widget ProblemCard(String problem) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 20.0),
      child: Card(
        elevation: 0.0,
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              '$problem',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16.0,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget CustomListTile(String text1, String text2) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "$text1",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.0),
          ),
          Text(
            "$text2",
            softWrap: true,
            style: TextStyle(fontSize: 16.0),
          ),
        ],
      ),
    );
  }
}
