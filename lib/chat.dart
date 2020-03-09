import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'new_message.dart';

class Chats extends StatefulWidget {
  String name,img;
  Chats(this.name,this.img);
  @override
  _ChatsState createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  List<String> msg = [];

  _addNewMessage(String ms){
    setState(() {
      msg.add(ms);
      saveData();
    });
  }

  saveData()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('${widget.name}', msg);
  }

  getData()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      msg = prefs.getStringList('${widget.name}')??[];
    });
  }
  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
          appBar: AppBar(title: Text('${widget.name}',style: TextStyle(),),centerTitle: true,),
          body: Column(
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                  reverse: true,
                  itemCount: msg.length??0,
                  itemBuilder: (_,index){
                    return InkWell(
                      onLongPress: (){
                        setState(() {
                          msg.removeAt(msg.length - 1 - index);
                          saveData();
                        });},
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 8,
                          margin: EdgeInsets.all(5),
                          color: Colors.brown.shade400,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(msg[msg.length - 1 - index],style: TextStyle(fontFamily: 'Josefin_Sans',fontSize: 20),),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              NewMessage(addMessage: _addNewMessage),
            ],
          ),
    );
  }
}
