import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

main(){
  runApp(MyChat());
}

class MyChat extends StatefulWidget {
  @override
  _MyChatState createState() => _MyChatState();
}

class _MyChatState extends State<MyChat> {
  List<String> msg = [];

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

  var _controller = new TextEditingController();

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
                itemCount: msg.length??0,
                itemBuilder: (_,index){
                  return InkWell(
                  onLongPress: (){
                  setState(() {
                  msg.removeAt(msg.length - 1 - index);
                  saveData();
                  });},
                    child: Card(
                      elevation: 2,
                      margin: EdgeInsets.all(5),
                      color: Colors.brown.shade400,
                      child: Text(msg[index],style: TextStyle(fontFamily: 'Josefin_Sans',fontSize: 20),),
                    ),
                  );
                },
              ),
            ),
            Card(
                color: Colors.black12,
                elevation: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    TextField(
                      cursorColor: Colors.white,
                      controller: _controller,
                      decoration:
                      InputDecoration(labelText: 'Enter your message...',labelStyle: TextStyle(color: Colors.white,fontFamily: 'Josefin_Sans'),),
                    ),
                    RaisedButton(
                      highlightColor: Colors.grey,
                      color: Colors.black54,
                      child: Text('Add Message',style: TextStyle(fontFamily: 'Josefin_Sans'),),
                      onPressed: () {
                        if (_controller.text.isNotEmpty) {
                          setState(() {
                            msg.add(_controller.text);
                            _controller.clear();
                            saveData();
                          });
                        }
                      },
                    )
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
