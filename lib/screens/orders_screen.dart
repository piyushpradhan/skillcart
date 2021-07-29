import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:skillcart/models/order.dart';
import 'package:skillcart/models/response.dart';
import 'package:skillcart/services/api.dart';
import 'package:skillcart/widgets/cartItem_list.dart';

class OrdersScreen extends StatefulWidget {
  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: FutureBuilder<Response>(
            future: Api.getOrders(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                Response response = snapshot.data!;
                if (response.status) {
                  print(response.data!);
                  List<Order> orders = orderFromJson(jsonEncode(response.data));
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: orders.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 4),
                              child: Text(
                                'Order Id: ${orders[index].id}',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Text(
                                'Created At: ${orders[index].createdAt.toLocal()}',
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            CartItemList(items: orders[index].products),
                            Divider(),
                          ],
                        );
                      });
                } else {
                  return Center(
                    child: Text(
                      response.error.toString(),
                    ),
                  );
                }
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(
                    snapshot.error.toString(),
                  ),
                );
              }
              return CircularProgressIndicator();
            }),
      ),
    );
  }
}
