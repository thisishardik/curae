import 'package:biocom2/consult_now/consult_now.dart';
import 'package:biocom2/emergency/emergency.dart';
import 'package:biocom2/my_profile/my_profile.dart';
import 'package:biocom2/view_record/view_record.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:biocom2/home_screen/dashboard.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:page_transition/page_transition.dart';

class ViewRecord extends StatefulWidget {
  static String id = 'view_record';

  @override
  _ViewRecordState createState() => _ViewRecordState();
}

class _ViewRecordState extends State<ViewRecord> {
  int _currentIndex = 1;
  GlobalKey _bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFfcfcfc),
        appBar: AppBar(
          primary: true,
          iconTheme: IconThemeData(size: 30.0, color: Colors.black87),
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(
              Icons.sort,
              color: Colors.black,
              size: 27.0,
            ),
          ),
          actions: <Widget>[
            SizedBox(
              width: 5.0,
            ),
            IconButton(
              // ToDo Add notification dot. Put them in a stack and use positioned for placement
              icon: Icon(
                Icons.notifications,
                color: Colors.black87,
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.account_circle,
                color: Colors.black87,
              ),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(35.0),
            child: Row(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    icon: Icon(
                      Icons.location_on,
                      color: Colors.black87,
                    ),
                  ),
                ),
                Text(
                  'Lucknow, Uttar Pradesh',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.5),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: CustomNavigationBar(
          iconSize: 30.0,
          selectedColor: Color(0xff0c18fb),
          strokeColor: Color(0x300c18fb),
          unSelectedColor: Colors.grey[600],
          backgroundColor: Colors.white,
          items: [
            CustomNavigationBarItem(
              icon: Icons.home,
            ),
            CustomNavigationBarItem(
              icon: Icons.assignment,
            ),
            CustomNavigationBarItem(
              icon: Icons.add,
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
                      child: ViewRecord(),
                    ));
              }
              if (_currentIndex == 2) {
                Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.fade,
                      child: ConsultNow(),
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
      ),
    );
  }
}
