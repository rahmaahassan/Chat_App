import 'package:flutter/material.dart';

import 'chat.dart';

class MyCard extends StatefulWidget {
  String name, img;
  IconData icon;
  Color iconColor;

  MyCard({this.name, this.img, this.icon,this.iconColor});

  @override
  _MyCardState createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
       color: Colors.white70,
      ),
      child: ListTile(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (_)=> Chats(widget.name,widget.img)));
        },
        leading: CircleAvatar(backgroundImage: AssetImage('assets/images/${widget.img}',),radius: 30,),
        title: Text(widget.name),
        trailing: Icon(widget.icon,color: widget.iconColor,),
      ),
    );
  }
}
