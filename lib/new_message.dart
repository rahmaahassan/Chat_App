import 'package:flutter/material.dart';


class NewMessage extends StatelessWidget {
  Function addMessage;
  NewMessage({this.addMessage});

  var _controller = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Card(
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
                  addMessage(_controller.text);
                  _controller.clear();

              }
            },
          )
        ],
      ),
    );
  }
}
