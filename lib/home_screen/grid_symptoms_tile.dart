import 'package:flutter/material.dart';

class GridSymptomsTile extends StatelessWidget {
  String title;
  Function onTap;

  GridSymptomsTile({this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50.0,
        width: 100.0,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF60BE93),
                Color(0xFF4cd3c2),
              ],
            ),
            borderRadius: BorderRadius.circular(10.0)),
        child: Center(
          child: Text(title,
              style: TextStyle(
                  fontSize: 13.5,
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.w700,
                  color: Colors.white)),
        ));
  }
}
