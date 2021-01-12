import 'package:adobe_xd/adobe_xd.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import './IconsMainAppIcon.dart';

class ScreenNotification extends StatelessWidget {
  ScreenNotification({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
        ),
      ),
      backgroundColor: const Color(0xffffffff),
      body: ListView(
        children: [Image.asset('assets/images/notif.png')],
      ),
    );
  }
}
