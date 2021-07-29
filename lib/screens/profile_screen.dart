import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:skillcart/screens/login_screen.dart';
import 'package:skillcart/services/SharePrefs.dart';
import 'package:skillcart/widgets/login_button.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  User? user = FirebaseAuth.instance.currentUser;

  buttonFunction() async {
    if (user != null) {
      await FirebaseAuth.instance.signOut();
      await LocalSharedPreference.clearToken();
      setState(() {
        user = null;
      });
    } else {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => LoginScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Container(
          margin: const EdgeInsets.only(top: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.account_circle, size: 140, color: Colors.black54),
              user != null
                  ? Text("${user?.email.toString()}")
                  : Text("Not logged in"),
              LoginButton(
                user != null ? "Logout " : "Login",
                300,
                buttonFunction,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
