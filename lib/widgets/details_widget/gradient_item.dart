import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/recipe_model.dart';

class GradientItem extends StatefulWidget {
  final Ingredient ingredients;
  final Function(int, bool) onSelectionChanged;

  const GradientItem({
    super.key,
    required this.ingredients,
    required this.onSelectionChanged,
  });

  @override
  State<GradientItem> createState() => _GradientItemState();
}

class _GradientItemState extends State<GradientItem> {
  bool isSelected = false;

  @override
  void initState() {
    super.initState();
    loadSelectionState();
  }

  void loadSelectionState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool savedState = prefs.getBool('ingredient_${widget.ingredients.ingredientId}') ??
        widget.ingredients.isSelected;
    setState(() {
      isSelected = savedState;
    });
  }

  void saveSelectionState(bool isSelected) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('ingredient_${widget.ingredients.ingredientId}', isSelected);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                isSelected = !isSelected;
                widget.ingredients.isSelected = isSelected;

                // ✅ التأكد من وجود recipeId
                if (widget.ingredients.recipeId == null) {
                  widget.ingredients.recipeId = 0; // ← ضع هنا ID الوصفة الحقيقي إن توفر
                }

                saveSelectionState(isSelected);
                widget.onSelectionChanged(widget.ingredients.ingredientId!, isSelected);
              });
            },
            child: Icon(
              Icons.check_outlined,
              color: isSelected ? const Color(0xFF00643A) : const Color(0xFFC6C6C6),
              size: 30,
            ),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.ingredients.name ?? '',
                style: const TextStyle(
                  fontSize: 17,
                  color: Color(0xFF2A2C2C),
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                widget.ingredients.quantity ?? '',
                style: TextStyle(
                  fontSize: 16,
                  color: const Color(0xFF5B5D5E).withOpacity(0.8),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
