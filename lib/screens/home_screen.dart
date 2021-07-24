import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:skillcart/constants/API_URL.dart';
import 'package:skillcart/models/products.dart';
import 'package:skillcart/models/response.dart';
import 'package:skillcart/widgets/items_grid.dart';
import 'package:skillcart/widgets/items_list.dart';
import 'package:skillcart/services/api.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isList = true;
  Api _api = new Api();
  var getData;

  @override
  void initState() {
    super.initState();
    // getData = _api.getProducts();
  }

  // Future getProductFromServer() async {
  //   var url = Uri.parse('$BASE_URI/product');
  //   var response = await http.get(url);
  //   print('Response status: ${response.statusCode}');
  //   print('Response body: ${response.body}');
  //   return response;
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<Response>(
          future: _api.getProducts(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              Response response = snapshot.data!;
              List<Product> products =
                  productFromJson(jsonEncode(response.data));
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
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
                    child: isList
                        ? ItemsList(
                            products: products,
                          )
                        : ItemsGrid(
                            products: products,
                          ),
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return new CircularProgressIndicator();
          }),
    );
  }
}
