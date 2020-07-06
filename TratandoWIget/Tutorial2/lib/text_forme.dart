import 'package:flutter/material.dart';

class SearchInput extends StatelessWidget {
  const SearchInput({Key key,this.color,this.legenda,this.size,this.controller}) : super(key: key);

  @required final Color color; 
  @required final String legenda;
  @required final double size;
  final TextEditingController controller;
  
  Color _getColor(BuildContext context){
     return color;
  }

  TextStyle _getTextStyle(BuildContext context, double size){
    return TextStyle(
      color: _getColor(context),
      fontSize:size 
    );
  }


  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        decoration: InputDecoration(
          fillColor: _getColor(context),
          labelText: legenda,
          labelStyle: _getTextStyle(context, size), 
          border: OutlineInputBorder()
        ),
    );
  }
}