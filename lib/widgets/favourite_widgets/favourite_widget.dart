import 'package:flutter/material.dart';
import 'package:university_graduate_project/widgets/favourite_widgets/favourite_list_view.dart';
import '../general_widgets/custom_appbar.dart';

class FavouriteWidget extends StatelessWidget {
  const FavouriteWidget ({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
      children: [
        CustomAppbar(
          title: 'Favourites',
          needDeleteButton: true,
        ),
        FavouriteListView()
      ],
    ),);
  }
}
