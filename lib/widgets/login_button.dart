import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final String buttonLabel;
  final double buttonMinWidth;
  final dynamic onPressedFunc;
  const LoginButton(this.buttonLabel, this.buttonMinWidth, this.onPressedFunc);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: buttonMinWidth,
      color: Colors.blue,
      onPressed: () {
        print("Hello");
        onPressedFunc();
      },
      child: Text(
        buttonLabel,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );
  }
}
