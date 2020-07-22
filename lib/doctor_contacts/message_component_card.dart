import 'package:flutter/material.dart';
import 'package:biocom2/doctor_contacts/doctor_info_page.dart';

class MessageComponentCard extends StatefulWidget {
  final String name;
  final String designation;
  final String hospitalTitle;
  final String image;
  final Function onTap;
  MessageComponentCard(
      {this.name,
      this.designation,
      this.hospitalTitle,
      this.image,
      @required this.onTap});

  @override
  _MessageComponentCardState createState() => _MessageComponentCardState();
}

class _MessageComponentCardState extends State<MessageComponentCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.0,
      padding: const EdgeInsets.only(
          left: 25.0, right: 25.0, top: 0.0, bottom: 20.0),
      child: InkWell(
        onTap: widget.onTap,
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color(0xFF35d0ba),
              Color(0xFF5fdde5),
            ]),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(widget.image),
                radius: 30,
              ),
              title: Text(
                widget.name,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 5.0),
                  Text(
                    widget.designation,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Text(
                    widget.hospitalTitle,
                    style: TextStyle(
                        color: Colors.black54, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
