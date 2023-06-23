import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:planner/app/core/fonts_palette.dart';
import 'package:planner/app/features/screens/home/home%20page/task%20content/add/cubit/add_cubit.dart';
import 'package:planner/app/features/widget/background_gradient.dart';
import 'package:planner/app/features/widget/container_input_decoration_widget.dart';
import 'package:planner/app/features/widget/main_text_widget.dart';
import 'package:planner/app/repositories/items_repository.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  String? _title;
  String? _description;
  DateTime? _date;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      const BackgroundGradientWidget(),
      BlocProvider(
        create: (context) => AddCubit(ItemsRepository()),
        child: BlocConsumer<AddCubit, AddState>(
          listener: (context, state) {
            if (state.saved) {
              Navigator.of(context).pop();
            }
            if (state.errorMessage.isNotEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    state.errorMessage,
                    style: textMDboldwhite,
                  ),
                  backgroundColor: const Color.fromARGB(255, 148, 54, 54),
                ),
              );
            }
          },
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
                    : null,
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
    this.selectedDateFormatted,
  }) : super(key: key);

  final Function(String) onTitleChanged;
  final Function(String) onDescriptionChanged;
  final Function(DateTime?) onDateChanged;
  final String? selectedDateFormatted;

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
      ],
    );
  }
}
