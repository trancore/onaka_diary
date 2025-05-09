import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalenderConstants {
  static DateTime firstDaay = DateTime.utc(2025, 1, 1);
}

enum Weekday { mon, tue, wed, thu, fri, sat, sun }

extension WeekdayExtension on Weekday {
  String get name {
    switch (this) {
      case Weekday.mon:
        return "月";
      case Weekday.tue:
        return "火";
      case Weekday.wed:
        return "水";
      case Weekday.thu:
        return "木";
      case Weekday.fri:
        return "金";
      case Weekday.sat:
        return "土";
      case Weekday.sun:
        return "日";
    }
  }
}

class CalenderCell extends StatelessWidget {
  const CalenderCell({
    super.key,
    this.width = 30,
    this.height = 30,
    required this.text,
    this.textFontSize = 16,
    this.textColor,
    this.decoretion,
  });

  final double width;
  final double height;
  final String text;
  final double textFontSize;
  final Color? textColor;
  final BoxDecoration? decoretion;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: decoretion,
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: textFontSize,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}

class Calender extends StatefulWidget {
  const Calender({super.key});

  @override
  State<Calender> createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {
  final DateTime _today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.89,
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(23, 0, 0, 0),
            blurRadius: 19,
            spreadRadius: 0,
            offset: Offset(2, 16),
          )
        ],
      ),
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(24),
        child: TableCalendar(
          focusedDay: _today,
          firstDay: CalenderConstants.firstDaay,
          lastDay: _today,
          rowHeight: 41.5,
          headerStyle: const HeaderStyle(
            titleCentered: true,
            formatButtonVisible: false,
          ),
          calendarBuilders: CalendarBuilders(
            dowBuilder: (context, day) {
              return CalenderCell(
                height: 7,
                text: Weekday.values[day.weekday - 1].name,
                textFontSize: 10,
              );
            },
            todayBuilder: (
              context,
              day,
              focusedDay,
            ) {
              return CalenderCell(
                text: day.day.toString(),
                decoretion: BoxDecoration(
                  borderRadius: BorderRadius.circular(999),
                  color: const Color.fromARGB(255, 255, 140, 111),
                ),
                textColor: Colors.white,
              );
            },
            defaultBuilder: (
              context,
              day,
              focusedDay,
            ) {
              return CalenderCell(
                text: day.day.toString(),
              );
            },
            outsideBuilder: (context, day, focusedDay) {
              return CalenderCell(
                text: day.day.toString(),
              );
            },
            disabledBuilder: (context, day, focusedDay) {
              return CalenderCell(
                text: day.day.toString(),
                textColor: Colors.grey,
              );
            },
          ),
        ),
      ),
    );
  }
}
