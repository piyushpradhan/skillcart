import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:skillcart/models/item.dart';
import 'package:skillcart/widgets/cartItem_list.dart';

class CartScreen extends StatefulWidget {
  CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  Future<List<Item>> getItemFromCartBox() async {
    final cartBox = Hive.box("cart");
    // List<Item> itemList = [];
    List<Item> item = cartBox.values.cast<Item>().toList();
    // cartBox.values.forEach((element) {
    //   itemList.add(element);
    // });
    // List<Item> itemList = cartBox.values.toList() as List<Item>;
    return item;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart Screen"),
      ),
      body: Container(
        child: FutureBuilder<List<Item>>(
            future: getItemFromCartBox(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data!.isNotEmpty) {
                  return CartItemList(items: snapshot.data!);
                } else {
                  return Center(
                    child: Text("No Items in the Cart"),
                  );
                }
              } else if (snapshot.hasError) {
                return Center(
                  child: Text("${snapshot.error}"),
                );
              }
              return CircularProgressIndicator();
            }),
      ),
    );
  }
}
