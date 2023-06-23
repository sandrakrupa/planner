import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planner/app/core/fonts_palette.dart';
import 'package:planner/app/core/gradient_palette.dart';
import 'package:planner/app/features/screens/home/home%20page/task%20content/add/add_page.dart';
import 'package:planner/app/features/screens/home/home%20page/task%20content/cubit/task_cubit.dart';
import 'package:planner/app/features/screens/home/home%20page/task%20content/details/details_task_page.dart';
import 'package:planner/app/features/widget/container_input_decoration_widget.dart';
import 'package:planner/app/features/widget/main_text_widget.dart';
import 'package:planner/app/features/widget/navy_blue_elevated_button_1_widget.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:planner/app/models/task_model.dart';
import 'package:planner/app/repositories/tasks_repository.dart';

class TaskPageContent extends StatefulWidget {
  const TaskPageContent({
    super.key,
  });

  @override
  State<TaskPageContent> createState() => _TaskPageContentState();
}

class _TaskPageContentState extends State<TaskPageContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
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
            const MainText(
              mainText: 'Your Tasks',
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
        const SizedBox(height: 10.0),
        DatePicker(
          DateTime.now(),
          selectionColor: const Color.fromARGB(255, 17, 28, 108),
        ),
        const SizedBox(height: 10.0),
        Expanded(
          child: SingleChildScrollView(
            child: BlocProvider(
              create: (context) => TaskCubit(TasksRepository())..start(),
              child: BlocBuilder<TaskCubit, TaskState>(
                builder: (context, state) {
                  final taskModels = state.tasks;
                  return Column(
                    children: [
                      for (final taskModel in taskModels)
                        Dismissible(
                          key: ValueKey(taskModel.id),
                          background: const DecoratedBox(
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 148, 54, 54),
                            ),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: EdgeInsets.only(right: 32.0),
                                child: Icon(
                                  Icons.delete,
                                ),
                              ),
                            ),
                          ),
                          confirmDismiss: (direction) async {
                            return direction == DismissDirection.endToStart;
                          },
                          onDismissed: (direction) {
                            context
                                .read<TaskCubit>()
                                .remove(documentID: taskModel.id);
                          },
                          child: _ColumnItem(
                            taskModel: taskModel,
                          ),
                        ),
                    ],
                  );
                },
              ),
            ),
          ),
        )
      ],
    );
  }
}

class _ColumnItem extends StatelessWidget {
  const _ColumnItem({
    Key? key,
    required this.taskModel,
  }) : super(key: key);

  final TaskModel taskModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DetailsTaskPage(id: taskModel.id),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(
          top: 10,
          bottom: 10,
        ),
        child: Column(
          children: [
            ContainerInputDecorationWidget(
              child: Column(
                children: [
                  SizedBox(
                    height: 110,
                    width: double.infinity,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.all(10),
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  taskModel.title,
                                  style: textSMboldblue,
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  taskModel.date.toString(),
                                  style: textSMregulargrey400,
                                ),
                                const SizedBox(
                                  height: 7,
                                ),
                                Flexible(
                                  child: SingleChildScrollView(
                                    child: Text(
                                      taskModel.description,
                                      style: textSMregular,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 3,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
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
