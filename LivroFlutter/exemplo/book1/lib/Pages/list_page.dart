import 'dart:convert';

import 'package:book1/componentes/dialog.dart';
import 'package:book1/componentes/list_item.dart';
import 'package:book1/componentes/search_text.dart';
import 'package:book1/data/person_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListPerson extends StatefulWidget {
  ListPerson({Key key, this.tile}) : super(key: key);

  List<Person> persons = [];

  final String tile;

  @override
  _ListPersonState createState() => _ListPersonState();
}

class _ListPersonState extends State<ListPerson> {
  final controllerName = TextEditingController();
  final controllerAge = TextEditingController();

  void _add() {
    setState(() {
      widget.persons
          .add(Person(name: controllerName.text, age: controllerAge.text));
      controllerAge.clear();
      controllerName.clear();
      _save();
    });
  }

  bool _direction;

  dismissPerson(person) {
    if (widget.persons.contains(person)) {
      //_personList is list of person shown in ListView
      setState(() {
        widget.persons.remove(person);
        _save();
      });
    }
  }


  Future _load() async {
    var prefs = await SharedPreferences.getInstance();
    var data = prefs.getString('data');

    if(data != null){
      Iterable decoded = jsonDecode(data);
      List<Person> result = decoded.map((x) => Person.fromJson(x)).toList();
      setState(() {
         widget.persons = result;
      });
    }

  }


  Future _save() async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString('data', jsonEncode(widget.persons));
  }



  _ListPersonState(){
    _load();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.00,
        backgroundColor: Colors.white,
        title: Text(
          widget.tile,
          style: TextStyle(
              color: Colors.black,
              fontStyle: FontStyle.italic,
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
        actions: [
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: IconButton(
                  icon: Icon(Icons.search),
                  color: Colors.black,
                  onPressed: () {
                    showSearch(
                        context: context, delegate: SearchData(widget.persons));
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Icon(
                  Icons.send,
                  color: Colors.black,
                ),
              )
            ],
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: widget.persons.length,
          itemBuilder: (context, index) {
            return Dismissible(
              onDismissed: (direction) {
                dismissPerson(widget.persons[index]);
              },
              child: PersonItem(
                name: "${widget.persons[index].name}",
                age: "${widget.persons[index].age}",
              ),
              key: UniqueKey(),
              background: Container(
                color: Colors.green,
                child: Icon(Icons.check),
              ),
              secondaryBackground: Container(
                alignment: Alignment.center,
                color: Colors.red,
                child: Icon(Icons.cancel),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) => Alert(
                    controllerName: controllerName,
                    controllerAge: controllerAge,
                    add: () => {
                      if (controllerName.text != "" && controllerAge.text != "")
                        {_add(), Navigator.of(context).pop()}
                    },
                  ));
        },
        backgroundColor: Colors.pink[600],
      ),
    );
  }
}
