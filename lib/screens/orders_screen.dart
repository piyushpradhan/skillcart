import 'package:flutter/material.dart';
import 'package:skillcart/widgets/orders_list.dart';

class OrdersScreen extends StatefulWidget {
  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OrdersList(),
      ],
    );
  }
}
