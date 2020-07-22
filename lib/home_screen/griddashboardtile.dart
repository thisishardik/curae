import 'dart:convert';

import 'package:flutter/material.dart';

class GridDashboardTile extends StatelessWidget {
  final Function onPressed;
  final String title;
  GridDashboardTile({this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.all(5.0),
      child: Card(
        color: Color(0xFF4cd3c2),
        elevation: 0,
        child: Container(
            height: 80.0,
            width: 100.0,
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
            child: Center(
              child: Text(title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 14.8,
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.w600,
                      color: Colors.white)),
            )),
      ),
      onPressed: onPressed,
    );
  }
}

// Sample Code
//        height: 65.0,
//        width: 100.0,
//        decoration: BoxDecoration(
////          image: DecorationImage(
////            fit: BoxFit.fill,
////            image: NetworkImage(
////                'https://png.pngtree.com/png-vector/20190228/ourmid/pngtree-tooth-dental-icon-design-template-vector-illustration-png-image_710399.jpg'),
////          ),
//          color: Colors.white,
//          borderRadius: BorderRadius.circular(3),
////          border: Border.all(width: 0.2),
//          boxShadow: [
//            BoxShadow(
//              color: Colors.black38,
//              //offset: Offset(1.0, 1.0),
//              blurRadius: 1.0,
//              spreadRadius: 1.0,
//            ),
//            BoxShadow(
//              color: Colors.white,
//              //offset: Offset(-1.0, -1.0),
//              blurRadius: 1.0,
//              spreadRadius: 1.0,
//            ),
//          ],
//        ),
