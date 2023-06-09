import 'package:flutter/material.dart';
import 'package:planner/core/fonts_palette.dart';
import 'package:planner/core/gradient_palette.dart';
import 'package:planner/widget/background_gradient.dart';
import 'package:planner/widget/input_widget.dart';
import 'package:planner/widget/main_text_widget.dart';
import 'package:planner/widget/navy_blue_elevated_button_1_widget.dart';
import 'package:planner/widget/text_over_input_widget.dart';

class AddTaskPageContent extends StatelessWidget {
  const AddTaskPageContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundGradientWidget(),
        Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 206, 232, 254),
            elevation: 0.0,
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Color.fromARGB(255, 5, 4, 19),
              ),
            ),
          ),
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: ListView(
              children: [
                const SizedBox(
                  height: 16,
                ),
                const MainText(
                  mainText: 'Add Task',
                ),
                const SizedBox(
                  height: 15,
                ),
                const TextOverInputWidget(inputString: 'Title'),
                const InputWidget(
                  inputText: 'Enter your title',
                  inputIcon: Icons.arrow_circle_right,
                  inputSuffixIcon: Icons.clear,
                  showInputSuffixIcon: false,
                ),
                const SizedBox(
                  height: 8,
                ),
                const TextOverInputWidget(
                  inputString: 'Note',
                ),
                const InputWidget(
                  inputText: 'Enter your note',
                  inputIcon: Icons.arrow_circle_right,
                  inputSuffixIcon: Icons.clear,
                  showInputSuffixIcon: false,
                ),
                const TextOverInputWidget(inputString: 'Date'),
                const InputWidget(
                  inputText: '13/06/2023',
                  inputIcon: Icons.arrow_circle_right,
                  inputSuffixIcon: Icons.calendar_month_rounded,
                ),
                const SizedBox(
                  height: 8,
                ),
                const TextOverInputWidget(inputString: 'Start Date'),
                const InputWidget(
                  inputText: '07.00 AM',
                  inputIcon: Icons.arrow_circle_right,
                  inputSuffixIcon: Icons.access_time,
                ),
                const SizedBox(
                  height: 8,
                ),
                const TextOverInputWidget(inputString: 'End Date'),
                const InputWidget(
                  inputText: '01.00 PM',
                  inputIcon: Icons.arrow_circle_right,
                  inputSuffixIcon: Icons.access_time,
                ),
                const SizedBox(
                  height: 50,
                ),
                NavyBlueElevatedButton1(
                  buttonText: 'Create Task',
                  buttonGradientColor: navyBlueGradient,
                  buttonTextStyle: textMDboldwhite,
                  onPressed: () {},
                  buttonWidth: double.infinity,
                  buttonHeight: 50,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
