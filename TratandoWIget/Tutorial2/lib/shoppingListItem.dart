import 'package:Tutorial2/Product.dart';
import 'package:flutter/material.dart';

typedef void CarrinhoChamadaMudandoCor(Product product, bool inCard);


class ShoppingListItem extends StatelessWidget {
  const ShoppingListItem({Key key, this.product,this.inCard,this.onCartChange}) : super(key: key);
  
  final Product product;
  final bool inCard;
  final CarrinhoChamadaMudandoCor onCartChange;


  //Definindo nossa cor no contexto de aplicao 
  Color _getColor(BuildContext context){
    return inCard ? Colors.black54 : Colors.blue;
  }


  //Definir Estilo de texto dentro do tempo de aplicacao
  TextStyle _getTextStyle(BuildContext context){
    if(!inCard)return null;
    return TextStyle(
        color: Colors.black54,
        decoration: TextDecoration.lineThrough 
    );
  }


  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (){
        onCartChange(product,inCard);
      },
      leading: CircleAvatar(
        backgroundColor: _getColor(context),
        child: Text(product.name[0]),
      ),
      title: Text(product.name,style: _getTextStyle(context),)
      ,
    );
  }
}
