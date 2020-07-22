import 'package:biocom2/consult_now/consult_now.dart';
import 'package:biocom2/doctor_contacts/navigate_to_doctor.dart';
import 'package:biocom2/emergency/emergency.dart';
import 'package:biocom2/home_screen/dashboard.dart';
import 'package:biocom2/meet_my_patients/meet_my_patients.dart';
import 'package:biocom2/my_profile/my_profile.dart';
import 'package:biocom2/tools/location_placemark.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:slide_popup_dialog/slide_popup_dialog.dart' as slideDialog;
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:page_transition/page_transition.dart';
import 'package:biocom2/tools/location.dart';
import 'doctor_contacts.dart';
import 'package:snack/snack.dart';

class MessageTile extends StatefulWidget {
  static String id = 'message_tile';

  String image;
  final String name;
  final String hospitalTitle;
  final String degree;
  final String designation;
  final String language;
  final String description;
  MessageTile(
      {Key key,
      this.image,
      this.name,
      this.hospitalTitle,
      this.degree,
      this.designation,
      this.description,
      this.language})
      : super(key: key);

  @override
  _MessageTileState createState() => _MessageTileState();
}

class _MessageTileState extends State<MessageTile> {
  int _currentIndex = 1;
  bool showSpinner = false;

  final bar = SnackBar(content: Text('Some error has occured'));

  @override
  Widget build(BuildContext context) {
//    return ListTile(
//      leading: CircleAvatar(
//        radius: 30,
////        backgroundImage: AssetImage('assets/images/health.jpg'),
//        child: ClipOval(
//          child: SizedBox(
//            height: 100.0,
//            width: 100.0,
//            child: Image.asset(
//              'assets/images/health.jpg',
//              fit: BoxFit.fill,
//            ),
//          ),
//        ),
//      ),
//      title: Text(
//        'Dr. Strange',
//        style: TextStyle(
//          color: Colors.black,
//          fontWeight: FontWeight.bold,
//        ),
//      ),
//      subtitle: Text(
//        'I am the coolest avenger after Iron Man',
//        style: TextStyle(
//          color: Colors.black,
//        ),
//      ),
//      onTap: _showDialog,
//    );
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
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
                Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.fade,
                      child: MyProfile(),
                    ));
//              Navigator.pushNamed(context, MyProfile.id);
              }
            });
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.near_me,
            color: Colors.white,
            size: 22.5,
          ),
          onPressed: () async {
            Location location = Location();
            await location.getCurrentLocation(widget.hospitalTitle);
            try {
              Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.fade,
                    child: NavigateToDoctor(
                      originName: location.myLocation[0].addressLine,
                      destinationName: widget.hospitalTitle,
                      originLatitude: location.latitude,
                      originLongitude: location.longitude,
                      destinationLatitude: location.latitudeByPlacemark,
                      destinationLongitude: location.longitudeByPlacemark,
                    ),
                  ));
            } catch (e) {
              bar.show(context);
            }
          },
        ),
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/illustration.png'),
                alignment: Alignment.topCenter,
                fit: BoxFit.fitWidth,
              ),
            ),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: SvgPicture.asset(
                          'assets/images/back.svg',
                          height: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.24,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xffF9F9F9),
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(40),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            CircleAvatar(
                              backgroundImage: AssetImage(widget.image),
                              radius: 30,
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  widget.name,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Color(0xff1E1C61),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  widget.designation,
                                  style: TextStyle(
                                    color: Color(0xff1E1C61).withOpacity(0.7),
                                  ),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  widget.degree,
                                  style: TextStyle(
                                    color: Color(0xff1E1C61).withOpacity(0.7),
                                  ),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  widget.hospitalTitle,
                                  style: TextStyle(
                                    color: Color(0xff1E1C61).withOpacity(0.7),
                                  ),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Row(
                                  children: <Widget>[
                                    Text(
                                      "Speaks - ",
                                      style: TextStyle(
                                        color:
                                            Color(0xff1E1C61).withOpacity(0.7),
                                      ),
                                    ),
                                    Text(
                                      widget.language,
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Text(
                          'About Doctor',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Color(0xff1E1C61),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          widget.description,
                          style: TextStyle(
                            height: 1.6,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff1E1C61).withOpacity(0.7),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
//                      Text(
//                        'Want to navigate to this doctor ?',
//                        style: TextStyle(
//                          fontWeight: FontWeight.bold,
//                          fontSize: 18,
//                          color: Color(0xff1E1C61),
//                        ),
//                      ),
//                      SizedBox(
//                        height: 20,
//                      ),
//                      Row(
//                        children: <Widget>[
//                          Text(
//                            'Click ',
//                            style: TextStyle(
//                              fontWeight: FontWeight.bold,
//                              fontSize: 18,
//                              color: Color(0xff1E1C61),
//                            ),
//                          ),
//                          Icon(
//                            Icons.near_me,
//                            color: Colors.blue,
//                          )
//                        ],
//                      )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
