import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:planner/app/core/fonts_palette.dart';
import 'package:planner/app/features/screens/home/home%20page/task%20content/add/cubit/add_cubit.dart';
import 'package:planner/app/features/widget/background_gradient.dart';
import 'package:planner/app/features/widget/container_input_decoration_widget.dart';
import 'package:planner/app/features/widget/main_text_widget.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  String? _title;
  String? _description;
  DateTime? _date;
  // TimeOfDay? _time;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      const BackgroundGradientWidget(),
      BlocProvider(
        create: (context) => AddCubit(),
        child: BlocBuilder<AddCubit, AddState>(
          builder: (context, state) {
            return Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                backgroundColor: const Color.fromARGB(255, 206, 232, 254),
                iconTheme: const IconThemeData(
                  color: Color.fromARGB(255, 5, 4, 19),
                ),
                actions: [
                  IconButton(
                    onPressed: _title == null || _date == null
                        ? null
                        : () {
                            context.read<AddCubit>().add(
                                  _title!,
                                  _description!,
                                  _date!,
                                  // _time!,
                                );
                          },
                    icon: const Icon(Icons.check),
                  )
                ],
              ),
              body: _AddPageBody(
                  onTitleChanged: (newValue) {
                    setState(() {
                      _title = newValue;
                    });
                  },
                  onDescriptionChanged: (newValue) {
                    setState(() {
                      _description = newValue;
                    });
                  },
                  onDateChanged: (newValue) {
                    setState(() {
                      _date = newValue;
                    });
                  },
                  selectedDateFormatted: _date != null
                      ? DateFormat.MMMMEEEEd().format(_date!)
                      : null
                  //_date?.toIso8601String(),
                  // _date == null
                  //     ? null
                  //     : DateFormat.yMMMMEEEEd().format(_date!),
                  // onTimeChanged: (newValue) {
                  //   setState(() {
                  //     _time = newValue;
                  //   });
                  // },
                  // selectedTimeFormatted:
                  //     _time == null ? null : _time!.format(context),
                  ),
            );
          },
        ),
      ),
    ]);
  }
}

class _AddPageBody extends StatelessWidget {
  const _AddPageBody({
    Key? key,
    required this.onTitleChanged,
    required this.onDescriptionChanged,
    required this.onDateChanged,
    // required this.onTimeChanged,
    this.selectedDateFormatted,
    // this.selectedTimeFormatted,
  }) : super(key: key);

  final Function(String) onTitleChanged;
  final Function(String) onDescriptionChanged;
  final Function(DateTime?) onDateChanged;
  // final Function(TimeOfDay?) onTimeChanged;
  final String? selectedDateFormatted;
  // final String? selectedTimeFormatted;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 30,
        ),
        const MainText(
          mainText: 'Add Task',
        ),
        const SizedBox(
          height: 40,
        ),
        ContainerInputDecorationWidget(
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: TextField(
              onChanged: onTitleChanged,
              decoration: InputDecoration(
                hintText: 'Title',
                hintStyle: textMDregulargrey300,
                border: InputBorder.none,
                prefixIcon: const Icon(Icons.edit),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        ContainerInputDecorationWidget(
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: TextField(
              onChanged: onDescriptionChanged,
              decoration: InputDecoration(
                hintText: 'Description',
                hintStyle: textMDregulargrey300,
                border: InputBorder.none,
                prefixIcon: const Icon(Icons.edit),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        ContainerInputDecorationWidget(
          child: ListTile(
            title: Text(
              'Select Date:',
              style: textMDboldgrey300,
            ),
            subtitle: Text(
              selectedDateFormatted != null ? ' $selectedDateFormatted' : '',
              style: textMDregulargrey300,
            ),
            trailing: const Icon(Icons.calendar_today),
            onTap: () async {
              final selectedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1992),
                lastDate: DateTime(2113),
              );
              onDateChanged(selectedDate);
            },
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        // ContainerInputDecorationWidget(
        //   child: ListTile(
        //     title: Text(
        //       'Select Time:',
        //       style: textMDboldgrey300,
        //     ),
        //     subtitle: Text(
        //       selectedTimeFormatted != null ? ' $selectedTimeFormatted' : '',
        //       style: textMDregulargrey300,
        //     ),
        //     trailing: const Icon(Icons.access_time),
        //     onTap: () async {
        //       final selectedTime = await showTimePicker(
        //         context: context,
        //         initialTime: TimeOfDay.now(),
        //       );
        //       onTimeChanged(selectedTime);
        //     },
        //   ),
        // ),
      ],
    );
  }
}
