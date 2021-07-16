import 'package:flutter/material.dart';
import 'package:skillcart/widgets/item_card.dart';

class OrdersList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        child: ListView(
          children: [
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 8),
              child: Text(
                "21 July",
                style: TextStyle(fontWeight: FontWeight.w700, color: Colors.black54),
              ),
            ),
            ItemCard(),
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 8),
              child: Text(
                "21 July",
                style: TextStyle(fontWeight: FontWeight.w700, color: Colors.black54),
              ),
            ),
            ItemCard(),
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 8),
              child: Text(
                "21 July",
                style: TextStyle(fontWeight: FontWeight.w700, color: Colors.black54),
              ),
            ),
            ItemCard(),
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 8),
              child: Text(
                "21 July",
                style: TextStyle(fontWeight: FontWeight.w700, color: Colors.black54),
              ),
            ),
            ItemCard(),
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 8),
              child: Text(
                "21 July",
                style: TextStyle(fontWeight: FontWeight.w700, color: Colors.black54),
              ),
            ),
            ItemCard(),
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 8),
              child: Text(
                "21 July",
                style: TextStyle(fontWeight: FontWeight.w700, color: Colors.black54),
              ),
            ),
            ItemCard(),
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 8),
              child: Text(
                "21 July",
                style: TextStyle(fontWeight: FontWeight.w700, color: Colors.black54),
              ),
            ),
            ItemCard(),
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 8),
              child: Text(
                "21 July",
                style: TextStyle(fontWeight: FontWeight.w700, color: Colors.black54),
              ),
            ),
            ItemCard(),
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 8),
              child: Text(
                "21 July",
                style: TextStyle(fontWeight: FontWeight.w700, color: Colors.black54),
              ),
            ),
            ItemCard(),
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 8),
              child: Text(
                "21 July",
                style: TextStyle(fontWeight: FontWeight.w700, color: Colors.black54),
              ),
            ),
            ItemCard(),
          ],
        ),
      ),
    );
  }
}
