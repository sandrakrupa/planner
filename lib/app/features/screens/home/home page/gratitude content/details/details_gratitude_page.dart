import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planner/app/core/fonts_palette.dart';
import 'package:planner/app/features/widget/background_gradient.dart';
import 'package:planner/app/models/item_model.dart';
import 'package:planner/app/repositories/items_repository.dart';

import 'cubit/details_gratitude_cubit.dart';

class DetailsGratitudePage extends StatelessWidget {
  const DetailsGratitudePage({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
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
                GratitudeDetailsCubit(ItemsRepository())..getItemWithID(id),
            child: BlocBuilder<GratitudeDetailsCubit, GratitudeDetailsState>(
              builder: (context, state) {
                final itemModel = state.itemModel;
                if (itemModel == null) {
                  return const Center(child: CircularProgressIndicator());
                }
                return _ListViewItem(
                  itemModel: itemModel,
                );
              },
            ),
          )),
    ]);
  }
}

class _ListViewItem extends StatelessWidget {
  const _ListViewItem({
    Key? key,
    required this.itemModel,
  }) : super(key: key);

  final ItemModel itemModel;

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
          itemModel.title,
          style: displayXSbold,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          itemModel.dateFormated(),
          style: textSMboldgrey400,
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          itemModel.description,
          style: textMDregular,
        ),
      ],
    );
  }
}
