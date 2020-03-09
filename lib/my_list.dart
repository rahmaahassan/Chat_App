import 'package:flutter/material.dart';

import 'my_card.dart';

class MyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        MyCard(name: 'Ahmed Mokhtar',img: 'ahmed.jpg',iconColor: Colors.blue,),
        MyCard(name: 'Shrouk Ashraf',img: 'shrouk.jpg',iconColor: Colors.blue,),
        MyCard(name: 'GDG Team',img: 'gdg.jpg',iconColor: Colors.blue,),
        MyCard(name: 'Friends',img: 'ssaarr.jpg',iconColor: Colors.blue,),
      ],
    );
  }
}
