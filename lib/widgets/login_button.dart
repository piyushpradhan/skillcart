import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final double buttonMinWidth;
  final Function onPressedFunc;
  const LoginButton(this.buttonMinWidth, this.onPressedFunc);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: buttonMinWidth,
      color: Colors.blue,
      onPressed: () {
        onPressedFunc();
      },
      child: Text(
        "Login",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );
  }
}
