import 'package:flutter/material.dart';
import 'package:planner/core/fonts_palette.dart';
import 'package:planner/core/gradient_palette.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({super.key});

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  CalendarFormat calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      focusedDay: _focusedDay,
      firstDay: DateTime.utc(1992, 12, 4),
      lastDay: DateTime.utc(2113, 6, 13),
      calendarFormat: calendarFormat,
      daysOfWeekStyle: DaysOfWeekStyle(
          weekendStyle: textSMregulargrey500,
          weekdayStyle: textSMregulargrey500),
      calendarStyle: CalendarStyle(
        todayDecoration: const BoxDecoration(
          color: Color.fromARGB(186, 144, 157, 255),
          shape: BoxShape.circle,
        ),
        selectedDecoration: BoxDecoration(
          gradient: navyBlueGradient,
          shape: BoxShape.circle,
        ),
        defaultTextStyle: textSMregulardate,
        selectedTextStyle: textMDboldwhite,
        todayTextStyle: textSMregularwhite,
        outsideTextStyle: textSMregulargrey400,
      ),
      headerStyle: HeaderStyle(
        titleTextStyle: textMDbold,
        formatButtonTextStyle: textSMboldblue,
      ),
      selectedDayPredicate: (day) {
        return isSameDay(_selectedDay, day);
      },
      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          _selectedDay = selectedDay;
          _focusedDay = focusedDay;
        });
      },
      onPageChanged: (focusedDay) {
        _focusedDay = focusedDay;
      },
      onFormatChanged: (format) {
        setState(() {
          calendarFormat = format;
        });
      },
    );
  }
}
