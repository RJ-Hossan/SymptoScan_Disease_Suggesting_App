// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:symptoscan/Methods.dart';
import 'package:symptoscan/LoginScreen.dart';
import 'package:symptoscan/api/index.dart' as api;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final text_controller = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    text_controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text("Home Screen"),
      ),
      body: Container(),
      bottomNavigationBar: Container(
        height: size.height / 10,
        width: size.width,
        alignment: Alignment.center,
        child: Container(
          height: size.height / 12,
          width: size.width / 1.1,
          child: Row(
            children: [
              Container(
                height: size.height / 12,
                width: size.width / 1.27,
                child: TextField(
                  controller: text_controller,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  )),
                ),
              ),
              IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () async {
                    print(text_controller.text);
                    final res = await api.get_disease(text_controller.text);
                    for (int i = 0; i < res.length; i++) {
                      print('${res[i].disease} ${res[i].score}');
                    }
                    print("Send Button Pressed");
                  })
            ],
          ),
        ),
      ),
    );
  }
}
