import 'package:Tutorial2/Product.dart';
import 'package:Tutorial2/shoppingListItem.dart';
import 'package:Tutorial2/text_forme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.black,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ShoppingList(
        products: [
          Product(name: "Bike"),
          Product(name: "Geladeira"),
          Product(name: "Ovo"),
          Product(name: "Geladeira"),
          Product(name: "Geladeira"),
          Product(name: "Bike"),
          Product(name: "Geladeira"),
          Product(name: "Ovo"),
          Product(name: "Geladeira"),
          Product(name: "Geladeira"),
          Product(name: "Bike"),
          Product(name: "Geladeira"),
          Product(name: "Ovo"),
          Product(name: "Geladeira"),
          Product(name: "Geladeira"),
        ],
      ),
    );
  }
}

class ShoppingList extends StatefulWidget {
  ShoppingList({Key key, this.products}) : super(key: key);

  final List<Product> products;

  @override
  _ShoppingListState createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  Set<Product> _shoppingCart = Set<Product>();
  TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  void _handlerCartChanged(Product product, bool inCard) {
    setState(() {
      if (!inCard)
        _shoppingCart.add(product);
      else
        _shoppingCart.remove(product);
    });
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping List"),
      ),
      body: Column(
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.all(10.0),
              child: SearchInput(
                color: Colors.blue,
                legenda: "Nova atividade",
                size: 15,
                controller: _controller,
              )),
          Expanded(
            child: Container(
              child: Scrollbar(
                child: ListView(
                  children: widget.products.map((Product product) {
                    return ShoppingListItem(
                      product: product,
                      inCard: _shoppingCart.contains(product),
                      onCartChange: _handlerCartChanged,
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext contex) {
                return AlertDialog(
                  title: Text(
                    "Adicionar Na lista",
                    style: TextStyle(fontSize: 25),
                  ),
                  actions: <Widget>[
                    Icon(Icons.add),
                    FlatButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.exit_to_app),
                    )
                  ],
                );
              });
        },
        backgroundColor: Colors.black,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
