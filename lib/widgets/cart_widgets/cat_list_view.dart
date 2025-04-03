import 'package:flutter/material.dart';

import '../../data.dart';
import 'cart_item.dart';

class CatListView extends StatelessWidget {
  const CatListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => CartItem(recipe: recipes[0].ingredients![index],),
      itemCount: 3,
      shrinkWrap: true,
    );
  }
}

