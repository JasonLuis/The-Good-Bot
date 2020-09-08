import 'package:ps_chatbot/model/mensagem_bot_model.dart';
import 'package:ps_chatbot/screens/ordencao_conversa.dart';
import 'package:flutter/material.dart';

class TuturialBotScreen extends StatefulWidget {
  @override
  _TuturialBotState createState() => _TuturialBotState();
}

class _TuturialBotState extends State<TuturialBotScreen> {

  final _messageList = <MensagemBotModel>[];

  var mensagem = MensagemBotModel(
        mensagem: 'Olá Meu nome é The Good Bot',
        nome: 'The Good Bot',
        type: MensagemBotType.received);

  

  @override
  Widget build(BuildContext context) {
  
    _messageList.insert(0,mensagem);     
    
    mensagem = MensagemBotModel(
        mensagem: 'Veja algumas mensagens que podem ser enviadas a mim: \n'+
        '- Boa tarde!\n'+
        '- Qual a sinopse do filme Thor?\n'+
        '- Qual a sinopse de Naruto?\n'+
        '...',
        nome: 'The Good Bot',
        type: MensagemBotType.received);
    
    _messageList.insert(0,mensagem);     

    return Scaffold(
      appBar: new AppBar(
        title: Text('The Good Bot'),
        backgroundColor: Color.fromRGBO(7, 168, 167, 66),
      ),
      body: Column(
        children: <Widget>[
          _buildList(),       
          Divider(height: 1.0),
        ],
      ),
    );
  }


  // Cria a lista de mensagens (de baixo para cima)
  Widget _buildList() {
    return Flexible(
      child: ListView.builder(
        padding: EdgeInsets.all(8.0),
        reverse: true,
        itemBuilder: (_, int index){
          return ListTile(
            contentPadding: EdgeInsets.fromLTRB(8.0, 0.0, 64.0, 0.0),
            leading: CircleAvatar(child: Image.asset('bot.png'),radius: 50,),
            title: Text(_messageList[index].nome, textAlign: TextAlign.left),
            subtitle: Text(_messageList[index].mensagem, textAlign: TextAlign.left),
          );
        }, 
        itemCount: _messageList.length, 
      ),
    );
  }  
}

  
  
  
