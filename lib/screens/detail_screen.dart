import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:skillcart/models/item.dart';
import 'package:skillcart/screens/home_page.dart';
import 'package:skillcart/widgets/cart_icon.dart';
import 'package:skillcart/widgets/login_button.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  addItemToCart() async {
    final cartBox = Hive.box("cart");
    await cartBox.add(
      Item(itemName: "Laptop", price: 500, seller: "Zairza"),
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "SkillCart",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        actions: [
          CartIcon(),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
            width: 400,
            image: NetworkImage("https://static.toiimg.com/photo/82907329.cms"),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Laptop",
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
                Divider(),
                Text(
                  "Zairza",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: Colors.black54,
                  ),
                ),
                Divider(),
                Text(
                  "\$500",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LoginButton(
                "ADD TO CART",
                300,
                () {
                  addItemToCart();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
