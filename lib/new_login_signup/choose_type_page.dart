import 'package:biocom2/home_screen/dashboard.dart';
import 'package:biocom2/home_screen/on_boarding_screen.dart';
import 'package:biocom2/new_login_signup/doctor_reg_page.dart';
import 'package:biocom2/new_login_signup/patient_reg_page.dart';
import 'package:biocom2/registration_screen/registration_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:biocom2/login_screen/custom_icons.dart';
import 'package:biocom2/login_screen/form_card_login.dart';
import 'package:biocom2/login_screen/social_icons.dart';
import 'package:page_transition/page_transition.dart';

class ChooseTypePage extends StatefulWidget {
  static String id = 'choose_type_page';
  @override
  _ChooseTypePageState createState() => _ChooseTypePageState();
}

class _ChooseTypePageState extends State<ChooseTypePage> {
  bool _isSelected = false;

  Widget horizontalLine() => Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Container(
          width: ScreenUtil.getInstance().setWidth(120),
          height: 1.0,
          color: Colors.black26.withOpacity(.2),
        ),
      );
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true);
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: new Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomPadding: true,
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 100.0),
                  child: Image.asset("assets/image_01.png"),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
//                  SizedBox(
//                    height: ScreenUtil.getInstance().setHeight(30),
//                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Text(
                      "HealthCare",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: "Jost",
                          color: Colors.green,
                          fontSize: ScreenUtil.getInstance().setSp(60),
                          letterSpacing: 3,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
//                  SizedBox(
//                    height: ScreenUtil.getInstance().setHeight(130),
//                  ),
//                  SizedBox(height: ScreenUtil.getInstance().setHeight(70)),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 30, right: 30.0, top: 25.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              InkWell(
                                child: Container(
                                  width: ScreenUtil.getInstance().setWidth(500),
                                  height:
                                      ScreenUtil.getInstance().setHeight(115),
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(colors: [
                                        Color(0xFF17ead9),
                                        Color(0xFF6078ea)
                                      ]),
                                      borderRadius: BorderRadius.circular(6.0),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Color(0xFF6078ea)
                                                .withOpacity(.3),
                                            offset: Offset(0.0, 8.0),
                                            blurRadius: 8.0)
                                      ]),
                                  child: Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      onTap: () {
                                        //ToDo Add onTap
                                        Navigator.push(
                                          context,
                                          PageTransition(
                                            type: PageTransitionType.fade,
                                            child: DoctorRegPage(),
                                          ),
                                        );
                                      },
                                      child: Center(
                                        child: Text("I'm a Doctor",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: "Jost",
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                                letterSpacing: 1.0)),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 30, right: 30.0, top: 15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              InkWell(
                                child: Container(
                                  width: ScreenUtil.getInstance().setWidth(500),
                                  height:
                                      ScreenUtil.getInstance().setHeight(115),
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(colors: [
                                        Color(0xFF17ead9),
                                        Color(0xFF6078ea)
                                      ]),
                                      borderRadius: BorderRadius.circular(6.0),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Color(0xFF6078ea)
                                                .withOpacity(.3),
                                            offset: Offset(0.0, 8.0),
                                            blurRadius: 8.0)
                                      ]),
                                  child: Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      onTap: () {
                                        //ToDo Add onTap
                                        Navigator.push(
                                            context,
                                            PageTransition(
                                              type: PageTransitionType.fade,
                                              child: PatientRegPage(),
                                            ));
                                      },
                                      child: Center(
                                        child: Text("I'm a Patient",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: "Jost",
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                                letterSpacing: 1.0)),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 30, right: 30.0, top: 15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              InkWell(
                                child: Container(
                                  width: ScreenUtil.getInstance().setWidth(500),
                                  height:
                                      ScreenUtil.getInstance().setHeight(115),
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(colors: [
                                        Color(0xFF17ead9),
                                        Color(0xFF6078ea)
                                      ]),
                                      borderRadius: BorderRadius.circular(6.0),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Color(0xFF6078ea)
                                                .withOpacity(.3),
                                            offset: Offset(0.0, 8.0),
                                            blurRadius: 8.0)
                                      ]),
                                  child: Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      onTap: () {
                                        //ToDo Add onTap
                                        Navigator.push(
                                            context,
                                            PageTransition(
                                              type: PageTransitionType.fade,
                                              child: Home(),
                                            ));
                                      },
                                      child: Center(
                                        child: Text("I'm the Admin",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: "Jost",
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                                letterSpacing: 1.0)),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
