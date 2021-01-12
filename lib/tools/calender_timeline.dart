import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';

class CalenderTimeline extends StatefulWidget {
  Function onDateSelected;

  CalenderTimeline({this.onDateSelected});

  @override
  _CalenderTimelineState createState() => _CalenderTimelineState();
}

class _CalenderTimelineState extends State<CalenderTimeline> {
  DateTime _selectedValue = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return CalendarTimeline(
      initialDate: DateTime.now(),
      firstDate: DateTime(2020, 1, 1),
      lastDate: DateTime(2020, 12, 31),
      onDateSelected: (date) => widget.onDateSelected,
      leftMargin: 50,
      monthColor: Color(0xFF414956),
      dayColor: Color(0xFF414956),
      activeDayColor: Color(0xFFF99878),
      activeBackgroundDayColor: Color(0xFF414956),
      locale: 'en_US',
    );
  }
}
//monthColor: Color(0xFF414956),
//dayColor: Color(0xFF414956),
//activeDayColor: Color(0xFFF99878),
//activeBackgroundDayColor: Color(0xFF414956),
//dotsColor: Colors.white,
