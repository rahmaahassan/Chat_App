import 'package:flutter/material.dart';
import 'package:tete2/my_list.dart';

class MyChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Josefin_Sans'),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('Chats')),
        body: MyList(),
      ),
    );
  }
}
