import 'package:CatuaShopping/Controller/listItem.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardListView extends StatefulWidget {
  CardListView({Key key}) : super(key: key);

  @override
  _CardListViewState createState() => _CardListViewState();
}

class _CardListViewState extends State<CardListView> {
  ListView _getListFavorit() {
    ListItem controller = Provider.of(context);
    return ListView.builder(
        itemCount: controller.listaFavoritcs.length,
        itemBuilder: (BuildContext context, index) {
          return ListTile(
            title: Text(controller.listaFavoritcs[index].name),
          );
        });
  }

  Text _getTextFavorito() {
    ListItem controller = Provider.of(context);
    int counterFavorit = controller.listaFavoritcs.length;
    return Text("${counterFavorit}");
  }

  FloatingActionButton _getFloating(BuildContext context) {
    ListItem controller = Provider.of(context);
    return FloatingActionButton(
      onPressed: () {
        clearAllListFavorit(controller);
      },
      child: Icon(Icons.clear),
    );
  }

  void clearAllListFavorit(ListItem listFavorit) {
    final controller = listFavorit.clear();
    return controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Carrinho"),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Consumer<ListItem>(
              builder: (context, listFavorit, wiget) {
                return _getTextFavorito();
              },
            ),
          )
        ],
      ),
      body: Consumer<ListItem>(
        builder: (context, listFavorit, widget) {
          return _getListFavorit();
        },
      ),
      floatingActionButton:_getFloating(context)
    );
  }
}
