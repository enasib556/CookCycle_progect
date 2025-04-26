import 'package:flutter/material.dart';
import 'package:university_graduate_project/widgets/cart_widgets/quanitity_counter.dart';

import '../../models/recipe_model.dart';
import 'name_price_Column.dart';

class CartItem extends StatelessWidget {
  final Ingredients ingredient;

  const CartItem({super.key, required this.ingredient});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        height: 135,
        child: Row(
          children: [
            // الصورة
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: ingredient.imageUrl != null
                    ? Image.network( // استخدم Network بدل Asset عشان API
                  ingredient.imageUrl!,
                  width: 98,
                  height: 113,
                  fit: BoxFit.cover,
                )
                    : const SizedBox(
                  width: 98,
                  height: 113,
                  child: Icon(Icons.image, size: 50),
                ),
              ),
            ),
            // العمود اللي فيه الاسم والسعر
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: NamePriceColumn(ingredient: ingredient),
              ),
            ),
            // العدادات
            QuanitityCounter(),
            const SizedBox(width: 17),
            // الأيقونات (المفضلة والحذف)
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.favorite_border,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    // هنا ممكن تضيف اللوجيك الخاص بالمفضلة
                  },
                ),
                IconButton(
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    // هنا ممكن تضيف اللوجيك الخاص بالحذف
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
