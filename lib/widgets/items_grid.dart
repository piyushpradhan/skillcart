import 'package:flutter/material.dart';
import 'package:skillcart/models/products.dart';
import 'package:skillcart/widgets/item_card_grid.dart';

class ItemsGrid extends StatelessWidget {
  ItemsGrid({required this.products});
  final List<Product> products;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
          child: GridView.builder(
        itemCount: products.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return ItemCardGrid(
            product: products[index],
          );
        },
      )),
    );
  }
}
