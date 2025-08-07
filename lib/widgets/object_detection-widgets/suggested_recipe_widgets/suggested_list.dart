import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:university_graduate_project/widgets/object_detection-widgets/suggested_recipe_widgets/suggested_card.dart';
import '../../../manager/detect_cubit/detect_cubit.dart';
import '../../../manager/detect_cubit/detect_state.dart';

class SuggestedList extends StatelessWidget {
  final String imagePath;
  const SuggestedList({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DetectCubit()..detectObjects(File(imagePath)),
      child: BlocBuilder<DetectCubit, DetectState>(
        builder: (context, state) {
          if (state is LoadingDetectState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is SuccessDetectState) {
            final recipes = state.model.recipes ?? [];
            return ListView.builder(
              itemCount: recipes.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: SuggestedCard(
                    recipe: recipes[index],
                    imagePath: imagePath,
                    rank: index+1,
                  ),
                );
              },
            );
          } else if (state is ErrorDetectState) {
            return Center(child: Text('Error: ${state.errorMessage}'));
          } else {
            return const Center(child: Text('No data yet.'));
          }
        },
      ),
    );
  }
}
