import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:skillcart/models/products.dart';
import 'package:skillcart/models/response.dart';
import 'package:skillcart/services/api.dart';
import 'package:skillcart/widgets/item_card.dart';

class OrdersScreen extends StatefulWidget {
  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  Api _api = new Api();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<Response>(
          future: _api.getOrders(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              Response response = snapshot.data!;
              List<Product> products =
                  productFromJson(jsonEncode(response.data));
              return ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return ItemCard(product: products[index]);
                  });
            } else if (snapshot.hasError) {
              return Center(
                child: Text(
                  snapshot.error.toString(),
                ),
              );
            }
            return CircularProgressIndicator();
          }),
    );
  }
}
