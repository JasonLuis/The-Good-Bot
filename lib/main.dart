import 'package:flutter/material.dart';
import 'package:ps_chatbot/screens/conversa_bot_screen.dart';
import 'package:ps_chatbot/screens/tela_inicial_screen.dart';
import 'package:ps_chatbot/screens/tuturial_screen.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'The Good Bot',
      initialRoute: '/',
      routes: {
        '/':(context) => TelaInicialScreen(),
        '/ConversaBot':(context) => ConversaBotScreen(),
        '/TuturialBot':(context) => TuturialBotScreen(), 
      } 
    );
  }
}
