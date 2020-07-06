import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Contar(),
    );
  }
}
//Text contador Conta a quantidade de vezes que clicar no botao
class CounterDisplay extends StatelessWidget {
  const CounterDisplay({Key key, this.counter}) : super(key: key);
  
  final int counter;

  @override
  Widget build(BuildContext context) {
    return Text("Contagem: $counter");
  }
}

//Botao usado para chamar a funcao callback de contagem
class BottonCounter extends StatelessWidget {
  const BottonCounter({Key key, this.precione, this.title,this.size}) : super(key: key);
  
  @required final String title;
  @required final VoidCallback precione;
  final double size;
  
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: precione,
      child: Text(title,style: TextStyle(fontSize: size),),
    );
  }
}

 
class FraseDoDia extends StatelessWidget {
  const FraseDoDia({Key key,this.frase}) : super(key: key);  
  final String frase;
  @override
  Widget build(BuildContext context) {
    return Text(
      "Portaria:  $frase"
    );
   }
}


class Contar extends StatefulWidget {
  Contar({Key key}) : super(key: key);

  @override
  _ContarState createState() => _ContarState();
}

class _ContarState extends State<Contar> {
   
   int _counter = 0;
   String _frase = "";
   
   void _incremento(){
     setState(() {
       _counter++;
       if(_counter >= 4){
         _frase = "Voce pode entrar";
       }else{
         _frase = "Clique 4 vezes para entrar";
       }
     });
   }

   void _descrimento(){
     setState(() {
       _counter--;
       if(_counter < 4){
         _frase = "Clique 4 vezes para entrar";
       }else{
         _frase = "Voce pode entrar";
       }
     });
   }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contador componetisado",),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(child: CounterDisplay(counter: _counter)),
                Expanded(child: BottonCounter(precione: _incremento,title: "+",size: 18,)),
                Expanded(child: BottonCounter(precione: _descrimento,title: "-",size: 18,))
              ],
            ),
            SizedBox(height: 25,),
            Row(
              children: <Widget>[
                Expanded(child: FraseDoDia(frase: "$_frase"),)
              ],
            )
          ],
        ),
      ),
    );
  }
}
