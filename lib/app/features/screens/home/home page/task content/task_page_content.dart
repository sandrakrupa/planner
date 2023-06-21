import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:planner/app/core/fonts_palette.dart';
import 'package:planner/app/core/gradient_palette.dart';
import 'package:planner/app/features/widget/main_text_widget.dart';
import 'package:planner/app/features/widget/navy_blue_elevated_button_1_widget.dart';
import 'package:table_calendar/table_calendar.dart';

class TaskPageContent extends StatefulWidget {
  final ValueNotifier<File?> imageNotifier;

  const TaskPageContent({
    required this.imageNotifier,
    super.key,
  });

  @override
  State<TaskPageContent> createState() => _TaskPageContentState();
}

class _TaskPageContentState extends State<TaskPageContent> {
  CalendarFormat calendarFormat = CalendarFormat.week;
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();
  List<Task> tasks = [];

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final dateController = TextEditingController();

  String title = '';
  String description = '';

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'WELCOME, ',
                style: textMDregulargrey700,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ValueListenableBuilder<File?>(
                valueListenable: widget.imageNotifier,
                builder: (context, selectedImage, _) {
                  return Container(
                    decoration: BoxDecoration(
                      gradient: navyBlueGradient,
                      shape: BoxShape.circle,
                      boxShadow: [
                        greyShadow,
                      ],
                    ),
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 30,
                      child: selectedImage != null
                          ? ClipOval(
                              child: Image.file(
                                selectedImage,
                                fit: BoxFit.cover,
                                width: 60,
                                height: 60,
                              ),
                            )
                          : const Icon(
                              Icons.add,
                              size: 30,
                              color: Colors.white,
                            ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(
              height: 70,
              child: MainText(
                mainText: 'Your Tasks',
              ),
            ),
            NavyBlueElevatedButton1(
              buttonText: 'Add Task',
              buttonGradientColor: navyBlueGradient,
              buttonTextStyle: textMDboldwhite,
              buttonWidth: 100,
              buttonHeight: 30,
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(
                        'Add Task',
                        style: displayXSbold,
                      ),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextField(
                            controller: titleController,
                            decoration: InputDecoration(
                              labelText: 'Title',
                              labelStyle: textMDregulargrey300,
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 3,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextField(
                            controller: descriptionController,
                            decoration: InputDecoration(
                              labelText: 'Description',
                              labelStyle: textMDregulargrey300,
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 3,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          ListTile(
                            title: Text(
                              'Selected Date: ${DateFormat('yyyy-MM-dd').format(_selectedDay)}',
                              style: textMDregulargrey300,
                            ),
                            trailing: const Icon(Icons.calendar_today),
                            onTap: () async {
                              final newDate = await showDatePicker(
                                context: context,
                                initialDate: _selectedDay,
                                firstDate: DateTime(1992),
                                lastDate: DateTime(2113),
                              );
                              if (newDate != null) {
                                setState(() {
                                  _selectedDay = newDate;
                                  dateController.text =
                                      DateFormat('yyyy-MM-dd').format(newDate);
                                });
                              }
                            },
                          ),
                        ],
                      ),
                      actions: [
                        NavyBlueElevatedButton1(
                          buttonText: 'Save',
                          buttonGradientColor: navyBlueGradient,
                          buttonTextStyle: textMDboldwhite,
                          buttonWidth: 100,
                          buttonHeight: 30,
                          onPressed: () {
                            if (titleController.text.isNotEmpty &&
                                dateController.text.isNotEmpty) {
                              setState(() {
                                tasks.add(Task(
                                  title: titleController.text,
                                  description: descriptionController.text,
                                  date: DateTime.parse(dateController.text),
                                ));
                              });

                              titleController.clear();
                              descriptionController.clear();
                              dateController.clear();

                              Navigator.pop(context);
                            }
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
        TableCalendar(
          focusedDay: _focusedDay,
          firstDay: DateTime.utc(1992, 12, 4),
          lastDay: DateTime.utc(2113, 6, 13),
          calendarFormat: calendarFormat,
          startingDayOfWeek: StartingDayOfWeek.monday,
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
          eventLoader: (day) {
            return tasks.where((task) => task.date == day).toList();
          },
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
        const SizedBox(height: 8.0),
        Expanded(
          child: ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  tasks[index].title,
                  style: textMDboldgrey700,
                ),
                subtitle: Text(
                  tasks[index].description,
                  style: textSMregulargrey400,
                ),
                trailing: Checkbox(
                  value: tasks[index].isSelected,
                  onChanged: (value) {
                    setState(() {
                      tasks[index].isSelected = value!;
                      if (value) {
                        tasks[index].isCrossedOut = true;
                        List<Task> newTasks = tasks
                            .where((task) => task != tasks[index])
                            .toList();
                        newTasks.add(tasks[index]);
                        tasks = newTasks;
                      } else {
                        tasks[index].isCrossedOut = false;
                      }
                    });
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class Task {
  String title;
  String description;
  DateTime date;
  bool isSelected;
  bool isCrossedOut;

  Task({
    required this.title,
    required this.description,
    required this.date,
    this.isCrossedOut = true,
    this.isSelected = false,
  });
}
