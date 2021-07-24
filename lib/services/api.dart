import 'dart:convert';

import 'package:skillcart/constants/API_URL.dart';
import 'package:http/http.dart' as http;
import 'package:skillcart/models/response.dart';

class Api {
  static const url = BASE_URI;

  Future<Response> getProducts() async {
    Uri endpoint = Uri.parse("$url/product");
    var response = await http.get(endpoint);
    print(response.body.toString());
    return responseFromJson(response.body);
  }

  Future<Response> getOrders() async {
    Uri endpoint = Uri.parse("$url/orders");
    var response = await http.get(endpoint);
    return responseFromJson(response.body);
  }

  Future postOrder() async {
    return '';
  }
}
