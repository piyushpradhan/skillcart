import 'package:flutter/material.dart';

class ItemCardGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16.0, left: 16, right: 16),
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
      child: Image(
        width: 300,
        image: NetworkImage("https://static.toiimg.com/photo/82907329.cms"),
      ),
    );
  }
}
