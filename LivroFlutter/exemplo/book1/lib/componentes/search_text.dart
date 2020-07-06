import 'package:book1/componentes/list_item.dart';
import 'package:flutter/material.dart';

class SearchData extends SearchDelegate<String> {
  final List lisPerson;

  SearchData(this.lisPerson);

  List<Sugestao> listSugestao = [
    Sugestao(name: "Pai"),
    Sugestao(name: "Mae"),
    Sugestao(name: "Filho")
  ];

  List isEmpyt = [];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {

    final sugestionList = query.isEmpty
        ? isEmpyt
        : lisPerson.where((element) => element.name.toLowerCase().startsWith(query)).toList();
    return ListView.builder(
      itemBuilder: (BuildContext, index) => PersonItem(
        name: sugestionList[index].name,
        age: sugestionList[index].age,
      ),
      itemCount: sugestionList.length,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final sugestionList = query.isEmpty
        ? isEmpyt
        : lisPerson.where((element) => element.name.toLowerCase().startsWith(query)).toList();
    return ListView.builder(
      itemBuilder: (BuildContext, index) => PersonItem(
        name: sugestionList[index].name,
        age: sugestionList[index].age,
      ),
      itemCount: sugestionList.length,
    );
  }
}

class Sugestao {
  final String name;

  Sugestao({this.name});
}
