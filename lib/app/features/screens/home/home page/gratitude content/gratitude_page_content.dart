import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planner/app/core/fonts_palette.dart';
import 'package:planner/app/core/gradient_palette.dart';
import 'package:planner/app/features/screens/home/home%20page/gratitude%20content/add%20gratitude/add_gratitude_page.dart';
import 'package:planner/app/features/screens/home/home%20page/gratitude%20content/cubit/gratitude_cubit.dart';
import 'package:planner/app/features/widget/main_text_widget.dart';
import 'package:planner/app/features/widget/navy_blue_elevated_button_1_widget.dart';
import 'package:planner/app/models/item_model.dart';
import 'package:timeline_tile/timeline_tile.dart';

class GratitudePageContent extends StatefulWidget {
  final ValueNotifier<File?> imageNotifier;
  const GratitudePageContent({
    required this.imageNotifier,
    super.key,
  });

  @override
  State<GratitudePageContent> createState() => _GratitudePageContentState();
}

class _GratitudePageContentState extends State<GratitudePageContent> {
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
                'WELCOME',
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
            const MainText(
              mainText: 'Gratitude',
            ),
            NavyBlueElevatedButton1(
              buttonText: 'Add',
              buttonGradientColor: navyBlueGradient,
              buttonTextStyle: textMDboldwhite,
              buttonWidth: 100,
              buttonHeight: 30,
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const AddGratitudePage(),
                  ),
                );
              },
            )
          ],
        ),
        const SizedBox(height: 30.0),
        Expanded(
          child: SingleChildScrollView(
            child: BlocProvider(
              create: (context) => GratitudeCubit()..start(),
              child: BlocBuilder<GratitudeCubit, GratitudeState>(
                builder: (context, state) {
                  final itemModels = state.items;
                  return Column(
                    children: [
                      for (final itemModel in itemModels)
                        Dismissible(
                            key: ValueKey(itemModel.id),
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
                                  .read<GratitudeCubit>()
                                  .remove(documentID: itemModel.id);
                            },
                            child: _GratitudeItem(
                              itemModel: itemModel,
                            ))
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

class _GratitudeItem extends StatelessWidget {
  const _GratitudeItem({
    Key? key,
    required this.itemModel,
  }) : super(key: key);

  final ItemModel itemModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
      ),
      child: Column(
        children: [
          TimelineTile(
            alignment: TimelineAlign.manual,
            lineXY: 0.3,
            beforeLineStyle: const LineStyle(
              color: Color.fromARGB(255, 222, 224, 255),
            ),
            indicatorStyle: IndicatorStyle(
              width: 30,
              indicator: Container(
                decoration: BoxDecoration(
                  gradient: navyBlueGradient,
                  boxShadow: [greyShadow],
                  shape: BoxShape.circle,
                ),
              ),
            ),
            endChild: Container(
              constraints: const BoxConstraints(
                minHeight: double.infinity,
              ),
              color: Colors.transparent,
              child: Expanded(
                child: Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        itemModel.title,
                        style: textSMboldblue,
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Flexible(
                        child: SingleChildScrollView(
                          child: Text(
                            itemModel.description,
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
            ),
            startChild: Container(
              color: Colors.transparent,
              child: Text(
                itemModel.date.toString.toString(),
                style: textSMregulargrey400,
              ),
            ),
          )
        ],
      ),
    );
  }
}






//  Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: ValueListenableBuilder<File?>(
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
//             ),