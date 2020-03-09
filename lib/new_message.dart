import 'package:flutter/material.dart';


class NewMessage extends StatelessWidget {
  Function addMessage;
  NewMessage({this.addMessage});

  var _controller = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
      TextField(
      cursorColor: Colors.blue,
        controller: _controller,
        decoration:
        InputDecoration(labelText: 'Enter your message...',labelStyle: TextStyle(color: Colors.blue),),
      ),
          RaisedButton(
            highlightColor: Colors.white,
            color: Colors.blue,
            child: Text('Add Message',style: TextStyle(fontFamily: 'Josefin_Sans'),),
            onPressed: () {
              if (_controller.text.isNotEmpty) {
                  addMessage(_controller.text);
                  //_controller.clear();
              }
            },
          )
        ],
      ),
    );
  }
}
