import 'package:flutter/material.dart';

class GridDoctorsTile extends StatelessWidget {
  final String title;
  String image;
  final Function onPressed;
  GridDoctorsTile({this.title, this.image, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 153.0,
      height: 150.0,
      child: Card(
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        child: Wrap(
          children: <Widget>[
            Center(
              child: Image.asset(
                image,
                width: 90.0,
                height: 90.0,
              ),
            ),
            ListTile(
              // ToDo onTap
              title: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Sample Code
//class GridDoctorsTile extends StatelessWidget {
//  final String title;
//  final Image image;
//
//  GridDoctorsTile({this.title, this.image});
//
//  @override
//  Widget build(BuildContext context) {
//    return MaterialButton(
//      child: Column(
//        children: <Widget>[
//          Container(
//            height: 50.0,
//            width: 50.0,
//            padding: EdgeInsets.all(5.0),
//            decoration: BoxDecoration(
//              image: DecorationImage(
//                  fit: BoxFit.fill,
//                  image: NetworkImage('https://flaviocopes.com/svg/10.png')),
//              color: Colors.white,
//              borderRadius: BorderRadius.circular(3),
//              border: Border.all(width: 0.1),
//              boxShadow: [
//                BoxShadow(
//                  color: Colors.black38,
//                  //offset: Offset(1.0, 1.0),
//                  blurRadius: 1.0,
////              spreadRadius: 1.0,
//                ),
//                BoxShadow(
//                  color: Colors.white,
//                  //offset: Offset(-1.0, -1.0),
//                  blurRadius: 1.0,
////              spreadRadius: 1.0,
//                ),
//              ],
//            ),
//          ),
//          SizedBox(
//            height: 10.0,
//            child: Divider(
//              height: 60.0,
//            ),
//          ),
//          Text(
//            title,
//            textAlign: TextAlign.left,
//            style: TextStyle(
//              fontWeight: FontWeight.w900,
//              color: Colors.black,
//              fontSize: 20.0,
//            ),
//          ),
//        ],
//      ),
//    );
//  }
//}
