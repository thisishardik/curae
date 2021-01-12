import 'dart:async';

import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:biocom2/aws_services/flutter_local_storage.dart';
import 'package:biocom2/aws_services/user.dart';
import 'package:biocom2/aws_services/user_service.dart';
import 'package:biocom2/consult_now/consult_now.dart';
import 'package:biocom2/doctor_contacts/doctor_contacts.dart';
import 'package:biocom2/emergency/emergency.dart';
import 'package:biocom2/main.dart';
import 'package:biocom2/meet_my_patients/meet_my_patients.dart';
import 'package:biocom2/my_profile/my_profile.dart';
import 'package:biocom2/shared_prefs.dart';
import 'package:biocom2/view_record/view_record.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:draw_graph/draw_graph.dart';
import 'package:draw_graph/models/feature.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:localstorage/localstorage.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'griddashboardtile.dart';
import 'grid_doctors_tile.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:html/dom.dart' as dom;
import 'package:biocom2/home_screen/grid_symptoms_tile.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:amazon_cognito_identity_dart_2/sig_v4.dart';

final userPool = new CognitoUserPool(
  'us-east-1_RrWQ0yWhg',
  '7omgkncbjkr1rdc7lotit0dlfb',
);

class Home extends StatefulWidget {
  static String id = 'home';

  List<CognitoUserAttribute> userAttributes;
  CognitoUserSession session;
  Home({this.userAttributes, this.session});

  @override
  HomeState createState() => new HomeState();
}

class HomeState extends State<Home> {
  int _currentIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  User user = User();
  UserService userService = UserService(userPool);
  String userNameFromAttribute;
  Future<String> userFromSharedPref;
  UserInfoFromSharedPrefs userInfoFromSharedPrefs = UserInfoFromSharedPrefs();
  String usernameFromSharedPrefs;

  /// LOCAL STORAGE BEGINS HERE
//  final AttributesList list = new AttributesList();
//  final LocalStorage storage = new LocalStorage('profile');
//  bool initialized = false;
//  TextEditingController controller = new TextEditingController();

//  _toggleItem(Attribute item) {
//    setState(() {
//      item.done = !item.done;
//      _saveToStorage();
//    });
//  }

//  _addItem(String title) {
//    setState(() {
//      final item = new Attribute(title: title, done: false);
//      list.items.add(item);
//      _saveToStorage();
//    });
//  }

//  _saveToStorage() {
//    storage.setItem('todos', list.toJSONEncodable());
//  }

//  _clearStorage() async {
//    await storage.clear();
//
//    setState(() {
//      list.items = storage.getItem('todos') ?? [];
//    });
//  }
  /// LOCAL STORAGE END
//  void getAttributes() async {
//    List<CognitoUserAttribute> attributes;
//    try {
//      attributes = await cognitoUser.getUserAttributes();
//    } catch (e) {
//      print(e);
//    }
//    attributes.forEach((attribute) {
//      print(
//          'attribute ${attribute.getName()} has value ${attribute.getValue()}');
//    });
//  }

  void getUserNameFromAttribute() {
    widget.userAttributes.forEach((attribute) {
      if (attribute.getName() == 'name') {
        userNameFromAttribute = attribute.getValue();
      }
    });
  }

  void getUsernameFromSharedPrefs() async {
    final SharedPreferences prefs = await userInfoFromSharedPrefs.saveInfo();
    usernameFromSharedPrefs = await prefs.getString('username');
  }

  @override
  void initState() {
//    userService.getCurrentUser();
//    print("${widget.userAttributes} are the User Attributes");
//    getUserNameFromAttribute();
//    userFromSharedPref =
//        userInfoFromSharedPrefs.saveInfo().then((SharedPreferences prefs) {
//      return (prefs.getString('username'));
//    });
//    print(userFromSharedPref);
//    getUsernameFromSharedPrefs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
//        appBar: AppBar(
//          primary: true,
//          elevation: 0,
//          iconTheme: IconThemeData(color: Colors.black87),
//          backgroundColor: Color(0xFFecfbfc),
//          leading: IconButton(
//            icon: Icon(
//              Icons.sort,
//              color: Colors.black,
//              size: 24,
//            ),
//          ),
//          actions: <Widget>[
//            SizedBox(
//              width: 5.0,
//            ),
//            IconButton(
//              // ToDo Add notification dot. Put them in a stack and use positioned for placement
//              icon: Icon(Icons.notifications, color: Colors.black, size: 24),
//            ),
//            IconButton(
//              // ToDo Add notification dot. Put them in a stack and use positioned for placement
//              icon: Icon(
//                Icons.person,
//                color: Colors.black,
//                size: 24,
//              ),
//            ),
//          ],
////          bottom: PreferredSize(
////            preferredSize: Size.fromHeight(33.0),
////            child: Row(
////              children: <Widget>[
////                SizedBox(
////                  width: 3.5,
////                ),
////                Align(
////                  alignment: Alignment.centerLeft,
////                  child: IconButton(
////                    icon: Icon(
////                      Icons.location_on,
////                      color: Colors.black,
////                      size: 20.0,
////                    ),
////                  ),
////                ),
////                Text(
////                  'Lucknow, Uttar Pradesh',
////                  style: TextStyle(
////                      fontWeight: FontWeight.w500,
////                      fontSize: 15,
////                      color: Colors.black),
////                ),
////              ],
////            ),
////          ),
//        ),
          key: _scaffoldKey,
          appBar: GradientAppBar(
            elevation: 0.0,
            leading: IconButton(
              icon: Icon(Icons.menu, color: Colors.white),
              onPressed: () => _scaffoldKey.currentState.openDrawer(),
            ),
            gradient: LinearGradient(
              colors: [
                Color(0xFF2a82ba),
                Color(0xFF66ccf3),
              ],
            ),
          ),
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
                  print('pressed');
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
          drawer: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Drawer(
              elevation: 20.0,
              child: Container(
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      Color(0xFF66ccf3),
                      Color(0xFF2a82ba),
                    ])),
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            icon: Icon(Icons.close,
                                size: 30.0, color: Colors.white),
                            onPressed: () => Navigator.pop(context)),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 35.0,
                              ),
                              child: CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/images/avatar.jpg'),
                                radius: 47.0,
                              ),
                            ),
                            SizedBox(width: 20.0),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 15.0,
                                ),
                                Text(
                                  'Dr. T Vasanth',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 3.0,
                                ),
                                Text(
                                  'Oncologist',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    print('Edit Profile Clicked');
                                  },
                                  child: Text(
                                    'View and Edit Profile',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    ListTile(
                      title: Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text(
                          "Dashboard",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 19.0,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      trailing: Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: Container(
                          height: 15.0,
                          width: 15.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100.0),
                          ),
                        ),
                      ),
                      onTap: () {},
                    ),
                    ListTile(
                      title: Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text(
                          "Services",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 19.0,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      onTap: () {},
                    ),
                    ListTile(
                      title: Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text(
                          "All Appointments",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 19.0,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.fade,
                                child: MeetMyPatients()));
                      },
                    ),
                    ListTile(
                      title: Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text(
                          "Doctors",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 19.0,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      onTap: () {},
                    ),
                    ListTile(
                      title: Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text(
                          "Pharmacies",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 19.0,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      onTap: () {},
                    ),
                    SizedBox(height: 20.0),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                      child: Container(
                        height: 3.0,
                        width: 300.0,
                        decoration: BoxDecoration(
                          color: Color(0xFF000046),
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    ListTile(
                      title: Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text(
                          "My Profile",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 19.0,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.fade,
                                child: MyProfile()));
                      },
                    ),
                    ListTile(
                      title: Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text(
                          "FAQ",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 19.0,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      onTap: () {},
                    ),
                    ListTile(
                      title: Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text(
                          "About Us",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 19.0,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF2a82ba),
                  Color(0xFF66ccf3),
                ],
              ),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.05,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
//                          'Hi $userNameFromAttribute',
                          'Hi Hardik',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                DraggableScrollableSheet(
                  builder: (BuildContext context,
                      ScrollController scrollController) {
                    return Stack(
                      overflow: Overflow.visible,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(40),
                                topLeft: Radius.circular(40)),
                          ),
                          child: ListView(
//                      physics: BouncingScrollPhysics(),
                            controller: scrollController,
                            children: [
                              SizedBox(
                                height: 25.0,
                              ),
//                        LineGraph(
//                          features: features,
//                          size: Size(500, 200),
//                          labelX: ['Day 1', 'Day 2', 'Day 3', 'Day 4', 'Day 5'],
//                          labelY: ['20%', '40%', '60%', '80%', '100%'],
//                          showDescription: true,
//                          graphColor: Colors.black,
//                        ),
//                        SizedBox(
//                          height: 25.0,
//                        ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Upcoming Appointments',
                                    style: TextStyle(
                                        fontSize: 22.0,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 35.0, right: 35.0, top: 20.0),
                                      child: Container(
                                        child: Column(
                                          children: [
                                            Image.asset(
                                              'assets/images/sample-profile-male.png',
                                              width: 120.0,
                                              fit: BoxFit.fill,
                                            ),
                                            Container(
                                              height: 50.0,
                                              width: 140.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFF3a96ca),
                                                borderRadius:
                                                    BorderRadius.circular(50.0),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(2.0),
                                                child: Center(
                                                  child: Text(
                                                    'Aditya Mangla',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 17.0),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 35.0, right: 35.0, top: 20.0),
                                      child: Container(
                                        child: Column(
                                          children: [
                                            Image.asset(
                                              'assets/images/sample-profile-male.png',
                                              width: 120.0,
                                              fit: BoxFit.fill,
                                            ),
                                            Container(
                                              height: 50.0,
                                              width: 140.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFF3a96ca),
                                                borderRadius:
                                                    BorderRadius.circular(50.0),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(2.0),
                                                child: Center(
                                                  child: Text(
                                                    'Aditya Mangla',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 17.0),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 35.0, right: 35.0, top: 20.0),
                                      child: Container(
                                        child: Column(
                                          children: [
                                            Image.asset(
                                              'assets/images/sample-profile-male.png',
                                              width: 120.0,
                                              fit: BoxFit.fill,
                                            ),
                                            Container(
                                              height: 50.0,
                                              width: 140.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFF3a96ca),
                                                borderRadius:
                                                    BorderRadius.circular(50.0),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(2.0),
                                                child: Center(
                                                  child: Text(
                                                    'Aditya Mangla',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 17.0),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 35.0, right: 35.0, top: 20.0),
                                      child: Container(
                                        child: Column(
                                          children: [
                                            Image.asset(
                                              'assets/images/sample-profile-male.png',
                                              width: 120.0,
                                              fit: BoxFit.fill,
                                            ),
                                            Container(
                                              height: 50.0,
                                              width: 140.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFF3a96ca),
                                                borderRadius:
                                                    BorderRadius.circular(50.0),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(2.0),
                                                child: Center(
                                                  child: Text(
                                                    'Aditya Mangla',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 17.0),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 25.0,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Recent News in Oncology',
                                    style: TextStyle(
                                        fontSize: 22.0,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 35.0, right: 35.0, top: 20.0),
                                      child: Container(
                                        child: Column(
                                          children: [
                                            Image.asset(
                                              'assets/images/sample-profile-male.png',
                                              width: 120.0,
                                              fit: BoxFit.fill,
                                            ),
                                            Container(
                                              height: 50.0,
                                              width: 120.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFF3a96ca),
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(15.0),
                                                  bottomRight:
                                                      Radius.circular(15.0),
                                                ),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(2.0),
                                                child: Center(
                                                  child: Text(
                                                    'Headline',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 17.0),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 35.0, right: 35.0, top: 20.0),
                                      child: Container(
                                        child: Column(
                                          children: [
                                            Image.asset(
                                              'assets/images/sample-profile-male.png',
                                              width: 120.0,
                                              fit: BoxFit.fill,
                                            ),
                                            Container(
                                              height: 50.0,
                                              width: 120.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFF3a96ca),
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(15.0),
                                                  bottomRight:
                                                      Radius.circular(15.0),
                                                ),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(2.0),
                                                child: Center(
                                                  child: Text(
                                                    'Headline',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 17.0),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 35.0, right: 35.0, top: 20.0),
                                      child: Container(
                                        child: Column(
                                          children: [
                                            Image.asset(
                                              'assets/images/sample-profile-male.png',
                                              width: 120.0,
                                              fit: BoxFit.fill,
                                            ),
                                            Container(
                                              height: 50.0,
                                              width: 120.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFF3a96ca),
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(15.0),
                                                  bottomRight:
                                                      Radius.circular(15.0),
                                                ),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(2.0),
                                                child: Center(
                                                  child: Text(
                                                    'Headline',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 17.0),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 35.0, right: 35.0, top: 20.0),
                                      child: Container(
                                        child: Column(
                                          children: [
                                            Image.asset(
                                              'assets/images/sample-profile-male.png',
                                              width: 120.0,
                                              fit: BoxFit.fill,
                                            ),
                                            Container(
                                              height: 50.0,
                                              width: 120.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFF3a96ca),
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(15.0),
                                                  bottomRight:
                                                      Radius.circular(15.0),
                                                ),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(2.0),
                                                child: Center(
                                                  child: Text(
                                                    'Headline',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 17.0),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
//                  Positioned(
//                    child: FloatingActionButton(
//                      child: Icon(
//                        Icons.add,
//                        color: Colors.white,
//                      ),
//                      backgroundColor: Colors.pinkAccent,
//                    ),
//                    top: -30,
//                    right: 30,
//                  )
                      ],
                    );
                  },
                ),
              ],
            ),
          )),
    );
  }
}
