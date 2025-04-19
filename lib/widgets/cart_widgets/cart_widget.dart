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
            SizedBox(height: 20,),
            CatListView(),
            SizedBox(height: 23,),
            SubtotalContainer(),
            SizedBox(height: 23,),
            SizedBox(
                width: 248,
                height: 60,
                child: CustomElevaterdButton(text: 'Place Order',onPress: () {},)),
            SizedBox(height: 23,),
          ],
        ),
      ),
    );
  }
}

