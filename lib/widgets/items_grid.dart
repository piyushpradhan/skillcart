import 'package:flutter/material.dart';
import 'package:skillcart/widgets/item_card_grid.dart';

class ItemsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        child: GridView.count(
          crossAxisCount: 2,
          children: [
            ItemCardGrid(),
            ItemCardGrid(),
            ItemCardGrid(),
            ItemCardGrid(),
            ItemCardGrid(),
            ItemCardGrid(),
            ItemCardGrid(),
            ItemCardGrid(),
            ItemCardGrid(),
          ],
        ),
      ),
    );
  }
}
