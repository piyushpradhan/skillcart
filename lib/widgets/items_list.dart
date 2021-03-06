import 'package:flutter/material.dart';
import 'package:skillcart/models/products.dart';
import 'package:skillcart/widgets/item_card.dart';

class ItemsList extends StatelessWidget {
  ItemsList({required this.products});
  final List<Product> products;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        child: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            return ItemCard(
              product: products[index],
            );
          },
        ),
      ),
    );
  }
}
