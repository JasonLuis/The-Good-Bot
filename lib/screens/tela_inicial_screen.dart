import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class TelaInicialScreen extends StatefulWidget{
  
  @override
  _TelaInicialState createState() => _TelaInicialState();
  
}
  
class _TelaInicialState extends State<TelaInicialScreen>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Color.fromRGBO(7, 168, 167, 66),
        title: Text(
          'The Good Bot',
            style: TextStyle(
              color: Colors.white
            ),
            
          ),
        ),
        body: Container(
          width: double.infinity,
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 10.0),
              height: 300,
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new AssetImage('robot.png'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Material(
              borderRadius: BorderRadius.circular(100.0),//Set this up for rounding corners.
              shadowColor: Colors.lightBlueAccent.shade100,
              child: MaterialButton(
                  minWidth: 300.0,
                  height: 50.0,
                  onPressed: (){
                    Navigator.pushNamed(context, '/ConversaBot');
                  },
                  color: Color.fromRGBO(7, 168, 167, 66),
                  child: Text('Conversar com Bot ', style: TextStyle(color: Colors.white, fontSize: 20),),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Material(
              borderRadius: BorderRadius.circular(100.0),//Set this up for rounding corners.
              shadowColor: Colors.lightBlueAccent.shade100,
              child: MaterialButton(
                  minWidth: 300.0,
                  height: 50.0,
                  onPressed: (){
                    Navigator.pushNamed(context, '/TuturialBot');
                  },
                  color: Color.fromRGBO(7, 168, 167, 66),
                  child: Text('Tuturial de conversa', style: TextStyle(color: Colors.white, fontSize: 20),),
                ),
              ),
            )
          ],)
        )
      );
  }
    
}

