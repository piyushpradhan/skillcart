import 'package:flutter/material.dart';
import 'package:skillcart/models/item.dart';
import 'package:skillcart/widgets/cartItem_card.dart';

class CartItemList extends StatelessWidget {
  CartItemList({required this.items});
  final List<Item> items;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: items.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return CartItemCard(
            item: items[index],
          );
        },
      ),
    );
  }
}
