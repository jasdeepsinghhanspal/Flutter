import 'package:flutter/material.dart';
void main(){
  runApp(const day1());
}
class MyApp extends StatelessWidget{
  const day1({Key key}):super (Key key);//optional until function not used
  @override
  Widget build(BuildContext context){
    return MaterialApp{
      home:Material(
        child:Center(
          child:Container(
            child:Text("Welcome Guys");
            ),
          ),
        ),
      );
    }
  }
