import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';
import 'package:skillcart/models/item.dart';
import 'package:skillcart/models/response.dart';
import 'package:skillcart/services/api.dart';
import 'package:skillcart/widgets/cartItem_list.dart';
import 'package:skillcart/widgets/flutter_toast.dart';

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
    print(item);
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
                  return Column(
                    children: [
                      CartItemList(items: snapshot.data!),
                      MaterialButton(
                        minWidth: 300,
                        color: Colors.blue,
                        onPressed: () async {
                          print("Hello");
                          addItemToOrder(snapshot.data!);
                        },
                        child: Text(
                          "Order",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  );
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

  Future<void> addItemToOrder(List<Item> items) async {
    Response response = await Api.postOrder(items);
    if (response.status) {
      CustomToast.showToast("Ordered Successfully");
      final cartBox = Hive.box("cart");
      await cartBox.clear();
      Navigator.pop(context);
    } else {
      CustomToast.showToast(response.error.toString());
    }
  }
}
