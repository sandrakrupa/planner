import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:planner/app/core/fonts_palette.dart';
import 'package:planner/app/core/gradient_palette.dart';
import 'package:planner/app/features/screens/home/home%20page/task%20content/add/add_page.dart';
import 'package:planner/app/features/screens/home/home%20page/task%20content/cubit/task_cubit.dart';
import 'package:planner/app/features/widget/main_text_widget.dart';
import 'package:planner/app/features/widget/navy_blue_elevated_button_1_widget.dart';
import 'package:table_calendar/table_calendar.dart';

class TaskPageContent extends StatefulWidget {
  const TaskPageContent({
    super.key,
  });

  @override
  State<TaskPageContent> createState() => _TaskPageContentState();
}

class _TaskPageContentState extends State<TaskPageContent> {
  // String? _title;
  // String? _description;
  // DateTime? _date;

  CalendarFormat calendarFormat = CalendarFormat.week;
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();
  // List<Task> tasks = [];

  // final titleController = TextEditingController();
  // final descriptionController = TextEditingController();
  // final dateController = TextEditingController();
  // final timeController = TextEditingController();

  // String title = '';
  // String description = '';

  @override
  void initState() {
    super.initState();
    // _selectedDay = _focusedDay;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
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
                child: Container(
                  decoration: BoxDecoration(
                    gradient: navyBlueGradient,
                    shape: BoxShape.circle,
                    boxShadow: [
                      greyShadow,
                    ],
                  ),
                  child: const CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 30,
                    child: Icon(
                      Icons.add,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                )),
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
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const AddPage(),
                  ),
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
          // eventLoader: (day) {
          //   return tasks.where((task) => task.date == day).toList();
          // },
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
        BlocProvider(
          create: (context) => TaskCubit()..start(),
          child: BlocBuilder<TaskCubit, TaskState>(
            builder: (context, state) {
              final docs = state.tasks?.docs;
              if (docs == null) {
                return const SizedBox.shrink();
              }

              return Column(
                children: [
                  for (final doc in docs)
                    _ColumnItem(
                      document: doc,
                    ),
                ],
              );
            },
          ),
        )
      ],
    );
  }
}

class _ColumnItem extends StatelessWidget {
  const _ColumnItem({
    Key? key,
    required this.document,
  }) : super(key: key);

  final QueryDocumentSnapshot<Map<String, dynamic>> document;

  @override
  Widget build(BuildContext context) {
    final DateTime taskDateTime = (document['dateTime'] as Timestamp).toDate();
    final String formattedTime = DateFormat.Hm().format(taskDateTime);
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 101, 101, 101).withOpacity(0.3),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            SizedBox(
              height: 80,
              child: Column(
                children: [
                  Text(
                    document['title'],
                  ),
                  Text(
                    (DateFormat.yMMMMEEEEd().format(taskDateTime)),
                  ),
                  Text(formattedTime),
                  Text(document['description'])
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

// class Task {
//   String title;
//   String description;
//   DateTime date;
//   bool isSelected;
//   bool isCrossedOut;

//   Task({
//     required this.title,
//     required this.description,
//     required this.date,
//     this.isCrossedOut = true,
//     this.isSelected = false,
//   });
// }



//  ValueListenableBuilder<File?>(
//                 valueListenable: widget.imageNotifier,
//                 builder: (context, selectedImage, _) {
//                   return Container(
//                     decoration: BoxDecoration(
//                       gradient: navyBlueGradient,
//                       shape: BoxShape.circle,
//                       boxShadow: [
//                         greyShadow,
//                       ],
//                     ),
//                     child: CircleAvatar(
//                       backgroundColor: Colors.transparent,
//                       radius: 30,
//                       child: selectedImage != null
//                           ? ClipOval(
//                               child: Image.file(
//                                 selectedImage,
//                                 fit: BoxFit.cover,
//                                 width: 60,
//                                 height: 60,
//                               ),
//                             )
//                           : const Icon(
//                               Icons.add,
//                               size: 30,
//                               color: Colors.white,
//                             ),
//                     ),
//                   );
//                 },
//               ),




 // Expanded(
        //   child: ListView.builder(
        //     itemCount: tasks.length,
        //     itemBuilder: (context, index) {
        //       return ListTile(
        //         title: Text(
        //           tasks[index].title,
        //           style: textMDboldgrey700,
        //         ),
        //         subtitle: Text(
        //           tasks[index].description,
        //           style: textSMregulargrey400,
        //         ),
        //         trailing: Checkbox(
        //           value: tasks[index].isSelected,
        //           onChanged: (value) {
        //             setState(() {
        //               tasks[index].isSelected = value!;
        //               if (value) {
        //                 tasks[index].isCrossedOut = true;
        //                 List<Task> newTasks = tasks
        //                     .where((task) => task != tasks[index])
        //                     .toList();
        //                 newTasks.add(tasks[index]);
        //                 tasks = newTasks;
        //               } else {
        //                 tasks[index].isCrossedOut = false;
        //               }
        //             });
        //           },
        //         ),
        //       );
        //     },
        //   ),
        // ),