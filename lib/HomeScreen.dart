// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:symptoscan/api/index.dart' as api;
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'dart:convert';
import 'package:uuid/uuid.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _ChatPageState();
}

class _ChatPageState extends State<HomeScreen> {
  List<types.Message> _messages = [];
  final _user = const types.User(
    // id: '82091008-a484-4a89-ae75-a22bf8d6f3ac',
    id: '82091008-a484-4a89-ae75-a22bf8d6f3ac',
  );

  @override
  void initState() {
    super.initState();
    _loadMessages();
  }

  void _addMessage(types.Message message) async {
    setState(() {
      _messages.insert(0, message);
    });
  }

  void _handleSendPressed(types.PartialText message) async {
    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: const Uuid().v4(),
      text: message.text,
    );

    _addMessage(textMessage);
    List<api.Disease> res = await api.get_disease(message.text);
    // check if res is type array
    for (int i = 0; i < res.length; i++) {
      // print('${res[i].disease} ${res[i].score}');
      _addMessage(types.TextMessage(
        author: const types.User(
          id: 'system',
        ),
        createdAt: DateTime
            .now()
            .millisecondsSinceEpoch,
        id: const Uuid().v4(),
        text:
        'There is a possibility that you have ${res[i].disease}, around ${res[i]
            .score}% and you can check out the following link - ',
      ));
    }
  }

  void _loadMessages() async {
    final response = await rootBundle.loadString('assets/messages.json');
    final messages = (jsonDecode(response) as List)
        .map((e) => types.Message.fromJson(e as Map<String, dynamic>))
        .toList();

    setState(() {
      _messages = messages;
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Chat(
          messages: _messages,
          onSendPressed: _handleSendPressed,
          showUserAvatars: true,
          showUserNames: true,
          user: _user,
        ),
      );
}
