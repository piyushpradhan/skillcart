import 'package:flutter/material.dart';
import 'package:skillcart/screens/home_screen.dart';
import 'package:skillcart/screens/orders_screen.dart';
import 'package:skillcart/screens/profile_screen.dart';
import 'package:skillcart/widgets/cart_icon.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentTab = 0;
  List pages = [HomeScreen(), OrdersScreen(), ProfileScreen()];
  var titles = ["SkillCart", "Your Orders", "Profile"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          titles[_currentTab],
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        actions: [
          _currentTab == 0 ? CartIcon() : Container(),
        ],
      ),
      body: pages[_currentTab],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _currentTab,
        onTap: (index) {
          setState(() {
            _currentTab = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            label: "",
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: Icon(Icons.history),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: Icon(Icons.account_circle),
          ),
        ],
      ),
    );
  }
}
