import 'package:flutter/material.dart';
import 'package:planner/core/fonts_palette.dart';
import 'package:planner/core/gradient_palette.dart';
import 'package:planner/core/models.dart';
import 'package:planner/screens/home/add%20task/add_task_dialog.dart';
import 'package:table_calendar/table_calendar.dart';

import 'navy_blue_elevated_button_1_widget.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({super.key});

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  CalendarFormat calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();
  TaskManager taskManager = TaskManager();

  void addTaskToCalendar(String title, String description, DateTime date) {
    Task newTask = Task(
      id: UniqueKey().toString(),
      title: title,
      description: description,
      date: date,
    );
    taskManager.addTask(newTask);
  }

  List<dynamic> Function(DateTime) getEvents() {
    return (DateTime date) {
      return taskManager.tasks
          .where((task) =>
              task.date.year == date.year &&
              task.date.month == date.month &&
              task.date.day == date.day)
          .toList();
    };
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        NavyBlueElevatedButton1(
            buttonText: 'Add Task',
            buttonGradientColor: navyBlueGradient,
            buttonTextStyle: textMDboldwhite,
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => const AddTaskDialog(),
              );
            },
            buttonWidth: 100,
            buttonHeight: 30),
        TableCalendar(
          eventLoader: getEvents(),
          focusedDay: _focusedDay,
          firstDay: DateTime.utc(1992, 12, 4),
          lastDay: DateTime.utc(2113, 6, 13),
          calendarFormat: calendarFormat,
          daysOfWeekStyle: DaysOfWeekStyle(
              weekendStyle: textSMregulargrey500,
              weekdayStyle: textSMregulargrey500),
          calendarStyle: CalendarStyle(
            todayDecoration: const BoxDecoration(
              color: Color.fromARGB(121, 0, 15, 128),
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
            formatButtonVisible: false,
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
        ),
      ],
    );
  }
}
