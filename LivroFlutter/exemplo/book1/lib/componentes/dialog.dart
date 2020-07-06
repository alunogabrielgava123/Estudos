import 'package:flutter/material.dart';

class Alert extends StatelessWidget {
  const Alert({Key key, this.controllerName, this.controllerAge, this.add})
      : super(key: key);

  final TextEditingController controllerName;
  final TextEditingController controllerAge;
  final VoidCallback add;

  TextFormField _getTextFormFIld(
      String title, TextEditingController controllerInput) {
    return TextFormField(
      controller: controllerInput,
      decoration: InputDecoration(hintText: title),
    );
  }

  @override
  Widget build(BuildContext context) {
    const String title = "Adicionar Familiar";
    return AlertDialog(
      title: Text(title),
      content: Container(
        height: 100,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Expanded(child: _getTextFormFIld("Name", controllerName)),
              Expanded(child: _getTextFormFIld("Age", controllerAge))
            ],
          ),
        ),
      ),
      actions: <Widget>[
        RaisedButton(
          onPressed: add,
          child: Text("Adicionar"),
          color: Colors.blue,
        ),
        RaisedButton(
          onPressed: () => {
            Navigator.of(context).pop(),
            controllerAge.clear(),
            controllerName.clear()
          },
          child: Text("Cancelar"),
          color: Colors.red,
        )
      ],
    );
  }
}
