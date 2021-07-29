import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:skillcart/constants/API_URL.dart';
import 'package:http/http.dart' as http;
import 'package:skillcart/models/item.dart';
import 'package:skillcart/models/response.dart';
import 'package:skillcart/models/responseAuth.dart';
import 'package:skillcart/services/SharePrefs.dart';

class Api {
  static const url = BASE_URI;

  static Future<Response> getProducts() async {
    Uri endpoint = Uri.parse("$url/product");
    var response = await http.get(endpoint);
    print(response.body.toString());
    return responseFromJson(response.body);
  }

  static Future<Response> getOrders() async {
    Uri endpoint = Uri.parse("$url/orders");
    String token = await LocalSharedPreference.getToken();
    if (token.isEmpty) {
      return Future.error('User is not Logged In.');
    }
    var response = await http.get(
      endpoint,
      headers: {
        "authorization": token,
      },
    );
    print("orders: " + response.body.toString());
    return responseFromJson(response.body);
  }

  static Future<Response> postOrder(List<Item> items) async {
    Uri endpoint = Uri.parse("$url/orders");
    String token = await LocalSharedPreference.getToken();
    if (token.isEmpty) return Future.error('User is not Logged In.');
    Map bodyMap = {
      "products": json.decode(itemToJson(items)),
    };
    String body = json.encode(bodyMap);
    print(body);
    var response = await http.post(
      endpoint,
      headers: {"authorization": token, "content-type": "application/json"},
      body: body,
    );
    print(response.body.toString());
    return responseFromJson(response.body);
  }

  static Future<void> loginUser(User user) async {
    Uri endpoint = Uri.parse("$url/user");
    Map body = {
      "name": user.displayName ?? 'Hello',
      "email": user.email,
      "firebaseUid": user.uid
    };
    var response =
        await http.post(endpoint, body: jsonDecode(jsonEncode(body)));
    ResponseAuth responseAuth = responseAuthFromJson(response.body);
    LocalSharedPreference.setToken(responseAuth.token);
    return;
  }
}
