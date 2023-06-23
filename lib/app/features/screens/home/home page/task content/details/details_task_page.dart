import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planner/app/core/fonts_palette.dart';
import 'package:planner/app/features/widget/background_gradient.dart';
import 'package:planner/app/models/task_model.dart';
import 'package:planner/app/repositories/tasks_repository.dart';

import 'cubit/details_task_cubit.dart';

class DetailsTaskPage extends StatelessWidget {
  const DetailsTaskPage({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundGradientWidget(),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 206, 232, 254),
            iconTheme: const IconThemeData(
              color: Color.fromARGB(255, 5, 4, 19),
            ),
          ),
          body: BlocProvider(
            create: (context) =>
                DetailsTaskCubit(TasksRepository())..getTaskWithID(id),
            child: BlocBuilder<DetailsTaskCubit, DetailsTaskState>(
              builder: (context, state) {
                final taskModel = state.taskModel;
                if (taskModel == null) {
                  return const Center(child: CircularProgressIndicator());
                }
                return _ListViewItem(
                  taskModel: taskModel,
                );
              },
            ),
          ),
        )
      ],
    );
  }
}

class _ListViewItem extends StatelessWidget {
  const _ListViewItem({Key? key, required this.taskModel}) : super(key: key);

  final TaskModel taskModel;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
      ),
      children: [
        const SizedBox(
          height: 30,
        ),
        Text(
          taskModel.title,
          style: displayXSbold,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          taskModel.dateFormated(),
          style: textSMboldgrey400,
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          taskModel.description,
          style: textMDregular,
        ),
      ],
    );
  }
}
