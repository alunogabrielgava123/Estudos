import 'package:flutter/material.dart';

typedef OnSelect(bool selectItem);

class PersonItem extends StatelessWidget {
  const PersonItem({
    Key key,
    this.name,
    this.age,
    this.size
  }) : super(key: key);

  final String name;
  final String age;
  final double size;

  CircleAvatar _getImagemAvatar(
      {BuildContext context,
      double size = 25,
      Color backgranudColor = Colors.black}) {
    return CircleAvatar(
      child: Icon(
        Icons.person,
        color: backgranudColor,
        size: size,
      ),
      backgroundColor: Colors.black,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: (){
        
      },
      title: Text(name),
      subtitle: Text(age.toString()),
      leading: _getImagemAvatar(
          context: context, 
          size: size, 
          backgranudColor: Colors.white),
      trailing: Icon(Icons.more_horiz),
      onTap: () {},
    );
  }
}
