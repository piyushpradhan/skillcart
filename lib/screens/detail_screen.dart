import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:skillcart/models/item.dart';
import 'package:skillcart/models/products.dart';
import 'package:skillcart/widgets/cart_icon.dart';
import 'package:skillcart/widgets/login_button.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({required this.product, Key? key}) : super(key: key);
  final Product product;  q

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  addItemToCart() async {
    final cartBox = Hive.box("cart");
    Item item = await cartBox.get(widget.product.id);
    if (item == null) {
      await cartBox.put(
        widget.product.id,
        Item(product: widget.product, quantity: 1),
      );
    } else {
      item.quantity += 1;
      await cartBox.put(widget.product.id, item);
    }
    Fluttertoast.showToast(
        msg: "Added To Cart",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
    Navigator.of(context).pop();
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              width: 400,
              image: NetworkImage(widget.product.image),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 48),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.product.name,
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                  Divider(),
                  Text(
                    widget.product.description,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: Colors.black54,
                    ),
                  ),
                  Divider(),
                  Text(
                    "\$${widget.product.price}",
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
                MaterialButton(
                  minWidth: 300,
                  color: Colors.blue,
                  onPressed: () async {
                    print("Hello");
                    addItemToCart();
                  },
                  child: Text(
                    "ADD TO CART",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                // LoginButton(
                //   "ADD TO CART",
                //   300,
                //   addItemToCart,
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
