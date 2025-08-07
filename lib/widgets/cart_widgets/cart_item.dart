import 'package:flutter/material.dart';
import '../../models/recipe_model.dart'; // تأكد أن هنا Ingredient موجود
import 'quanitity_counter.dart';

class CartItem extends StatefulWidget {
  final Ingredient ingredient;
  final Function loadShoppingList;
  final Function(int) onQuantityChanged; // جديد
  final VoidCallback onDelete; // جديد

  const CartItem({
    Key? key,
    required this.ingredient,
    required this.loadShoppingList,
    required this.onQuantityChanged, // جديد
    required this.onDelete, // جديد
  }) : super(key: key);

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  int quantity = 1;

  @override
  void initState() {
    super.initState();
    quantity = int.tryParse(widget.ingredient.quantity ?? "1") ?? 1;
  }

  void updateQuantity(int newQuantity) {
    setState(() {
      quantity = newQuantity;
    });
  }

  double calculateTotalPrice(String? price, int quantity) {
    final unitPrice =
        double.tryParse(price?.replaceAll(RegExp(r'[^\d.]'), '') ?? "0") ?? 0;
    return unitPrice * quantity;
  }

  @override
  Widget build(BuildContext context) {
    double totalPrice = calculateTotalPrice(widget.ingredient.price, quantity);

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
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: -5,
              right: 0,
              child: IconButton(
                onPressed: widget.onDelete,
                icon: const Icon(Icons.clear, color: Color(0xFF00643A),
                size: 16,
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child:
                        widget.ingredient.imageUrl != null &&
                                widget.ingredient.imageUrl!.isNotEmpty
                            ? Image.network(
                              widget.ingredient.imageUrl!,
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
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(width: 17),
                        SizedBox(
                          width: 350,
                          child: Text(
                            widget.ingredient.name ?? '',
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "\$${totalPrice.toStringAsFixed(2)}",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black.withOpacity(0.7),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                QuanitityCounter(
                  quantity: quantity,
                  onQuantityChanged: (newQuantity) {
                    updateQuantity(newQuantity);
                    widget.onQuantityChanged(
                      newQuantity,
                    );
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
