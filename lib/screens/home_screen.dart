import 'package:flutter/material.dart';
import 'package:skillcart/widgets/items_grid.dart';
import 'package:skillcart/widgets/items_list.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isList = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "View",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Container(
                  padding: const EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1.0),
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isList = false;
                          });
                        },
                        child: Icon(Icons.grid_view_rounded, size: 24),
                      ),
                      VerticalDivider(),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isList = true;
                          });
                        },
                        child: Icon(Icons.list, size: 30),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: isList ? ItemsList() : ItemsGrid(),
          ),
        ],
      ),
    );
  }
}
