import 'package:flutter/material.dart';

class ContatcPage extends StatefulWidget {
  @override
  _ContatcPageState createState() => _ContatcPageState();
}

class _ContatcPageState extends State<ContatcPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hive demo"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.send),
          )
        ],
      ),
    );
  }
}

