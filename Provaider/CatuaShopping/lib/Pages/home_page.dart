import 'package:CatuaShopping/Controller/listItem.dart';
import 'package:CatuaShopping/Model/item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ListView _getListView(ListItem controllerItem) {
    return ListView.builder(
        itemCount: controllerItem.listaProducts.length,
        itemBuilder: (context, index) {
          return _getListTile(
              controllerItem.listaProducts[index], controllerItem);
        });
  }

  ListTile _getListTile(Item itens, ListItem controllerItem) {
    return ListTile(
      title: Text(itens.name),
      trailing: _getIconsTraling(itens),
      subtitle: Text("R\$ ${itens.price}"),
    );
  }

  Container _getIconsTraling(Item itens) {
    ListItem controller = Provider.of(context);
    return Container(
      width: 125,
      height: 50,
      child: Row(
        children: <Widget>[
          IconButton(
            icon: _getCountItensFavorit(itens),
            onPressed: () {
              controller.isFavorit(itens);
              controller.addListFavorit(itens);
            },
          ),
          Text(controller.getItemCountList),
          IconButton(
            icon: _getDeleteCountFavorit(itens),
            onPressed: () {},
          )
        ],
      ),
    );
  }

  Icon _getCountItensFavorit(Item itens) {
    if (itens.isSelect) {
      return Icon(Icons.add_circle_outline, color: Colors.blue);
    } else {
      return Icon(Icons.add_circle_outline);
    }
  }

  Icon _getDeleteCountFavorit(Item itens) {
    if (itens.isSelect) {
      return Icon(Icons.remove_circle_outline, color: Colors.red);
    } else {
      return Icon(Icons.remove_circle_outline);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Shopping Car"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add_shopping_cart),
              onPressed: () {
                Navigator.pushNamed(context, 'CardListView');
              },
            ),
          ],
        ),
        body: Consumer<ListItem>(
          builder: (context, listView, wiget) {
            return _getListView(listView);
          },
        ));
  }
}
