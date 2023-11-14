import 'package:flutter/material.dart';
import 'package:symptoscan/Methods.dart';
import 'package:symptoscan/LoginScreen.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 300.0, horizontal: 95.0),
        child: TextButton(
          onPressed: () => logOut(context),
          child: Text("You have successfully logged out",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          ),
        ),
      ),
    );
  }
}
