import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planner/app/core/fonts_palette.dart';
import 'package:planner/app/features/screens/home/home%20page/user%20page/add%20name/cubit/add_name_cubit.dart';
import 'package:planner/app/features/screens/home/home%20page/user%20page/cubit/cubit/user_cubit.dart';
import 'package:planner/app/features/widget/background_gradient.dart';
import 'package:planner/app/features/widget/container_input_decoration_widget.dart';
import 'package:planner/app/features/widget/main_text_widget.dart';

import 'package:planner/app/repositories/names_repository.dart';

class AddNamePage extends StatefulWidget {
  const AddNamePage({
    super.key,
  });

  @override
  State<AddNamePage> createState() => _AddNamePageState();
}

class _AddNamePageState extends State<AddNamePage> {
  String? _title;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      const BackgroundGradientWidget(),
      BlocProvider(
        create: (context) => AddNameCubit(NamesRepository()),
        child: BlocConsumer<AddNameCubit, AddNameState>(
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
                    onPressed: _title == null
                        ? null
                        : () {
                            context.read<AddNameCubit>().add(
                                  _title!,
                                );
                            // context
                            //     .read<UserCubit>()
                            //     .remove(documentID: nameModel.id);
                          },
                    icon: const Icon(Icons.check),
                  )
                ],
              ),
              body: _AddNamePageBody(
                onTitleChanged: (newValue) {
                  setState(() {
                    _title = newValue;
                  });
                },
              ),
            );
          },
        ),
      ),
    ]);
  }
}

class _AddNamePageBody extends StatelessWidget {
  const _AddNamePageBody({
    Key? key,
    required this.onTitleChanged,
  }) : super(key: key);

  final Function(String) onTitleChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 30,
        ),
        const MainText(
          mainText: 'Add Your name',
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
                hintText: 'Name',
                hintStyle: textMDregulargrey300,
                border: InputBorder.none,
                prefixIcon: const Icon(Icons.edit),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
