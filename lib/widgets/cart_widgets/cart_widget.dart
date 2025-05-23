import 'package:flutter/material.dart';
import 'package:university_graduate_project/widgets/cart_widgets/subtotal_container.dart';
import 'package:university_graduate_project/widgets/details_widget/custom_elevaterd_button.dart';
import '../general_widgets/custom_appbar.dart';
import 'cat_list_view.dart';

class CartWidget extends StatelessWidget {
  const CartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            CustomAppbar(title: 'Shopping list', needDeleteButton: false),
            const SizedBox(height: 20),
            const CatListView(),
            const SizedBox(height: 23),
            const SubtotalContainer(),
            const SizedBox(height: 23),
            SizedBox(
              width: 248,
              height: 60,
              child: CustomElevatedButton(
                text: 'Place Order',
                onPress: () {},
              ),
            ),
            const SizedBox(height: 23),
          ],
        ),
      ),
    );
  }
}