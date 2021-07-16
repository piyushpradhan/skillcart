import 'package:flutter/material.dart';
import 'package:skillcart/widgets/item_card.dart';

class ItemsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        child: ListView(
          children: [
            ItemCard(),
            ItemCard(),
            ItemCard(),
            ItemCard(),
            ItemCard(),
            ItemCard(),
            ItemCard(),
            ItemCard(),
            ItemCard(),
            ItemCard(),
          ],
        ),
      ),
    );
  }
}
