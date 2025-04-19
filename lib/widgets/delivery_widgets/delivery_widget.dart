import 'package:flutter/material.dart';
import '../cart_widgets/cart_widget.dart';
import 'body_design.dart';

class DeliveryWidget extends StatefulWidget {
  const DeliveryWidget({super.key});

  @override
  State<DeliveryWidget> createState() => _DeliveryWidgetState();
}

class _DeliveryWidgetState extends State<DeliveryWidget> {
  bool showCart = false;

void toggleCart() {
  print("Button Pressed: Showing CartWidget");
  setState(() {
    showCart = true;
  });
}


  @override
  Widget build(BuildContext context) {
    return showCart
        ? const CartWidget()
        : BodyDesign(onOrderPressed: toggleCart);
  }
}
