import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:planner/core/fonts_palette.dart';
import 'package:planner/core/gradient_palette.dart';
import 'package:planner/core/models.dart';
import 'package:planner/widget/navy_blue_elevated_button_1_widget.dart';

class AddTaskDialog extends StatefulWidget {
  const AddTaskDialog({super.key});

  @override
  State<AddTaskDialog> createState() => _AddTaskDialogState();
}

class _AddTaskDialogState extends State<AddTaskDialog> {
  final titleController = TextEditingController();
  final descpController = TextEditingController();
  final dateController = TextEditingController();

  String title = '';
  String description = '';
  DateTime selectedDate = DateTime.now();
  TaskManager taskManager = TaskManager();

  void saveTask() {
    if (title.isNotEmpty) {
      Task newTask = Task(
        id: UniqueKey().toString(),
        title: title,
        description: description,
        date: selectedDate,
      );
      taskManager.addTask(newTask);

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Add Task',
        style: displayXSbold,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            onChanged: (value) => setState(() => title = value),
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
            onChanged: (value) => setState(() => description = value),
            controller: descpController,
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
              'Selected Date: ${DateFormat('yyyy-MM-dd').format(selectedDate)}',
              style: textMDregulargrey300,
            ),
            trailing: const Icon(Icons.calendar_today),
            onTap: () async {
              final newDate = await showDatePicker(
                context: context,
                initialDate: selectedDate,
                firstDate: DateTime(1992),
                lastDate: DateTime(2113),
              );
              if (newDate != null) {
                setState(() {
                  selectedDate = newDate;
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
            onPressed: saveTask,
            buttonWidth: 100,
            buttonHeight: 30),
      ],
    );
  }
}











// import 'package:flutter/material.dart';
// import 'package:planner/core/fonts_palette.dart';
// import 'package:planner/core/gradient_palette.dart';
// import 'package:planner/widget/background_gradient.dart';
// import 'package:planner/widget/input_widget.dart';
// import 'package:planner/widget/main_text_widget.dart';
// import 'package:planner/widget/navy_blue_elevated_button_1_widget.dart';
// import 'package:planner/widget/text_over_input_widget.dart';

// class AddTaskPageContent extends StatelessWidget {
//   const AddTaskPageContent({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         const BackgroundGradientWidget(),
//         Scaffold(
//           appBar: AppBar(
//             backgroundColor: const Color.fromARGB(255, 206, 232, 254),
//             elevation: 0.0,
//             leading: IconButton(
//               onPressed: () {},
//               icon: const Icon(
//                 Icons.arrow_back_ios,
//                 color: Color.fromARGB(255, 5, 4, 19),
//               ),
//             ),
//           ),
//           backgroundColor: Colors.transparent,
//           body: SafeArea(
//             child: ListView(
//               children: [
//                 const SizedBox(
//                   height: 16,
//                 ),
//                 const MainText(
//                   mainText: 'Add Task',
//                 ),
//                 const SizedBox(
//                   height: 15,
//                 ),
//                 const TextOverInputWidget(inputString: 'Title'),
//                 const InputWidget(
//                   inputText: 'Enter your title',
//                   inputIcon: Icons.arrow_circle_right,
//                   inputSuffixIcon: Icons.clear,
//                   showInputSuffixIcon: false,
//                 ),
//                 const SizedBox(
//                   height: 8,
//                 ),
//                 const TextOverInputWidget(
//                   inputString: 'Note',
//                 ),
//                 const InputWidget(
//                   inputText: 'Enter your note',
//                   inputIcon: Icons.arrow_circle_right,
//                   inputSuffixIcon: Icons.clear,
//                   showInputSuffixIcon: false,
//                 ),
//                 const TextOverInputWidget(inputString: 'Date'),
//                 const InputWidget(
//                   inputText: '13/06/2023',
//                   inputIcon: Icons.arrow_circle_right,
//                   inputSuffixIcon: Icons.calendar_month_rounded,
//                 ),
//                 const SizedBox(
//                   height: 8,
//                 ),
//                 const TextOverInputWidget(inputString: 'Start Date'),
//                 const InputWidget(
//                   inputText: '07.00 AM',
//                   inputIcon: Icons.arrow_circle_right,
//                   inputSuffixIcon: Icons.access_time,
//                 ),
//                 const SizedBox(
//                   height: 8,
//                 ),
//                 const TextOverInputWidget(inputString: 'End Date'),
//                 const InputWidget(
//                   inputText: '01.00 PM',
//                   inputIcon: Icons.arrow_circle_right,
//                   inputSuffixIcon: Icons.access_time,
//                 ),
//                 const SizedBox(
//                   height: 50,
//                 ),
//                 NavyBlueElevatedButton1(
//                   buttonText: 'Create Task',
//                   buttonGradientColor: navyBlueGradient,
//                   buttonTextStyle: textMDboldwhite,
//                   onPressed: () {},
//                   buttonWidth: double.infinity,
//                   buttonHeight: 50,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
