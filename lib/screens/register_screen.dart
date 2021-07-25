import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:skillcart/screens/home_page.dart';
import 'package:skillcart/services/api.dart';
import 'package:skillcart/widgets/login_button.dart';
import 'package:skillcart/widgets/flutter_toast.dart';

import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  checkUser() async {
    if (emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        confirmPasswordController.text.isNotEmpty) {
      print(passwordController.text + '  ' + confirmPasswordController.text);
      if (passwordController.text == confirmPasswordController.text) {
        print("Hello 2");
        registerUser();
      } else {
        CustomToast.showToast("Password and Confirm password didn't match");
      }
    } else {
      CustomToast.showToast("All the fields are required");
    }
  }

  registerUser() async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    try {
      _auth
          .createUserWithEmailAndPassword(
              email: emailController.text, password: passwordController.text)
          .then((value) async {
        await Api.loginUser(value.user!);

        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) => HomePage(),
          ),
        );
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') print("Email exists");
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Column(
              children: [
                Text(
                  "SkillCart",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Divider(),
                Text(
                  "Register",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Email",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                      Divider(),
                      TextField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 8),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 1),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 1),
                          ),
                        ),
                        controller: emailController,
                      ),
                    ],
                  ),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Password",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                      Divider(),
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 8),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 1),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 1),
                          ),
                        ),
                        controller: passwordController,
                      ),
                    ],
                  ),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Confirm Password",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                      Divider(),
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 8),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 1),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 1),
                          ),
                        ),
                        controller: confirmPasswordController,
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 30,
                ),
                LoginButton(
                  "Register",
                  330,
                  checkUser,
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?"),
                    GestureDetector(
                      child: Text(
                        "Login",
                        style: TextStyle(color: Colors.blue),
                      ),
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (_) => LoginScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
