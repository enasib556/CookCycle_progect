import 'package:flutter/material.dart';

import '../../data.dart';
import 'favourite_card.dart';

class FavouriteListView extends StatelessWidget {
  const FavouriteListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: favouriteRecipes.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: FavouriteCard(recipe: favouriteRecipes[index]),
          );
        },
      ),
    );
  }
}
