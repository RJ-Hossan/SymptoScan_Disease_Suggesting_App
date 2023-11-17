import 'package:flutter/material.dart';
import 'package:symptoscan/Methods.dart';
import 'package:symptoscan/LoginScreen.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
      ),

      body: Container(),
      bottomNavigationBar: Container(
        height: size.height / 10,
        width: size.width,
        alignment: Alignment.center,
        child: Container(
          height: size.height/12,
          width: size.width/1.1,
          child: Row(
            children: [
              Container(
                height: size.height/12,
                width: size.width/1.27,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    )
                  ),
                ),
              ),
              IconButton(icon: Icon(Icons.send), onPressed: () {})
            ],
          ),
        ),
      ),

    );
  }
}
