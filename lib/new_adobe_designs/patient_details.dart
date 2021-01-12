import 'package:biocom2/meet_my_patients/qr_code_scanner.dart';
import 'package:biocom2/networking/patient_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class AdobePatientDetails extends StatefulWidget {
  int index;
  AdobePatientDetails({this.index});
  @override
  _AdobePatientDetailsState createState() => _AdobePatientDetailsState();
}

class _AdobePatientDetailsState extends State<AdobePatientDetails> {
  PatientData patientData = PatientData();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: FutureBuilder(
            future: patientData.getPatientData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return SingleChildScrollView(
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
                                  '${snapshot.data['Items'][widget.index]['P_username']['S']}',
                                  style: TextStyle(
                                    fontSize: 28.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
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
                                SizedBox(
                                  width: 20.0,
                                ),
                                Container(
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
                            'About',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 18.0),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 10.0, right: 20.0, left: 20.0, bottom: 10.0),
                        child: Card(
                          elevation: 0.0,
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              children: <Widget>[
                                CustomListTile(
                                  "Age",
                                  '${snapshot.data['Items'][widget.index]['age']['S']}',
                                ),
                                CustomListTile(
                                  "Sex",
                                  '${snapshot.data['Items'][widget.index]['gender']['S']}',
                                ),
                                CustomListTile(
                                  "DOB",
                                  '${snapshot.data['Items'][widget.index]['DOB']['S']}',
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 30.0,
                          ),
                          Text(
                            'Problem Description',
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
                        '${snapshot.data['Items'][widget.index]['Complaint']['S']}',
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
                                    '45',
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
                                  Text(
                                    '45',
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
                                  Text(
                                    '45',
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
                                  child: QrCodeScanner()));
                        },
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 130.0, right: 130.0),
                          child: Container(
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            child: Center(
                              child: Text(
                                'Scan QR',
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
