import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class CartIcon extends StatelessWidget {
  const CartIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Hive.openBox("cart"),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final cartBox = Hive.box("cart");
          return Stack(
            children: [
              cartBox.length > 0
                  ? Container(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Text(
                        cartBox.length.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    )
                  : Container(),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.shopping_cart),
                color: Colors.black,
              ),
            ],
          );
        }
        return Container();
      },
    );
  }
}
