import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'new_message.dart';

main(){
  runApp(MyChat());
}

class MyChat extends StatefulWidget {
  @override
  _MyChatState createState() => _MyChatState();
}

class _MyChatState extends State<MyChat> {
  List<String> msg = [];

  _addNewMessage(String ms){
    setState(() {
      msg.add(ms);
      saveData();
    });
  }

  saveData()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('message', msg);
  }

  getData()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    msg = prefs.getStringList('message')??0;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(title: Text('Ohana',style: TextStyle(),),centerTitle: true,),
        body: Column(
          children: <Widget>[
            Container(
              height: 90,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Colors.red,Colors.black]
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/images/ahmed.jpg'),
                    radius: 40,
                  ),
                ],
              ),
            ),
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
      ),
    );
  }
}
