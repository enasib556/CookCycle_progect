import 'package:flutter/material.dart';
import '../../models/recipe_model.dart';
import 'name_price_column.dart';
import 'quanitity_counter.dart';
import '../../utilis/color.dart'; // تأكد إن عندك ملف الألوان

class CartItem extends StatelessWidget {
  final Ingredient ingredient;
  final Function loadShoppingList; // الدالة التي ستقوم بتحميل قائمة التسوق بعد التعديل


  const CartItem({super.key, required this.ingredient, required this.loadShoppingList,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
      child: Container(
        height: 135,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            // ✅ صورة المنتج
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: ingredient.imageUrl != null && ingredient.imageUrl!.isNotEmpty
                    ? Image.network(
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

            // ✅ العمود الخاص بالاسم والسعر والأيقونات
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // الاسم
                    SizedBox(
                      width: 150,
                      child: Text(
                        ingredient.name ?? '',
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(height: 5),
                    // السعر
                    Text(
                      'Price: ${ingredient.price}',

                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black.withOpacity(0.36),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const Spacer(),
                    // الأيقونات: مفضلة وحذف
                    Row(
                      children: [
                        Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            color: colorCard,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(
                            Icons.favorite_border,
                            size: 24,
                            color: colorIconCart,
                          ),
                        ),
                        const SizedBox(width: 20),
                        Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            color: colorCard,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(
                            Icons.delete,
                            size: 24,
                            color: colorIconCart,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // ✅ العداد
            const QuanitityCounter(),
            const SizedBox(width: 17),
          ],
        ),
      ),
    );
  }
}
