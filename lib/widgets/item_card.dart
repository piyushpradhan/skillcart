import 'package:flutter/material.dart';
import 'package:skillcart/screens/detail_screen.dart';

class ItemCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16.0, left: 16, right: 16),
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 2,
            offset: Offset(4, 4),
          )
        ],
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => DetailScreen(),
            ),
          );
        },
        child: Row(
          children: [
            Image(
              width: 250,
              image:
                  NetworkImage("https://static.toiimg.com/photo/82907329.cms"),
            ),
            VerticalDivider(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Laptop",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w700),
                ),
                Divider(height: 2.0),
                Text("Zairza"),
                Divider(),
                Text(
                  "\$500",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.black54),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
