import 'package:ps_chatbot/model/mensagem_bot_model.dart';
import 'package:flutter/material.dart';
import 'package:ps_chatbot/repository/mensagem_bot_repository.dart';
//Classe para ordenar a mensagem
/*As Mensagens do Bot vão ficar na esquerda e
as do usuario a direita*/
class OrdenacaoConversa extends StatelessWidget {
  
  MensagemBotModel mensagemBot;
  
  OrdenacaoConversa({this.mensagemBot});

  @override
  Widget build(BuildContext context) {
    
    /*return mensagemBot.type == MensagemBotType.sent
        ? _showEnvioMensagem()
        : _showMensagemRecebida();*/
    if(mensagemBot.nome == "Você"){
      return _showEnvioMensagem();
    }else{
      return _showMensagemRecebida();
    }    
  }

  Widget _showEnvioMensagem({EdgeInsets padding, TextAlign textAlign}) {
    return ListTile(
      contentPadding: EdgeInsets.fromLTRB(64.0, 0.0, 8.0, 0.0),
      trailing: CircleAvatar(child: Image.asset('user.png'),radius: 50,),
      title: Text(mensagemBot.nome, textAlign: TextAlign.right),
      subtitle: Text(mensagemBot.mensagem, textAlign: TextAlign.right),
    );

  }

    Widget _showMensagemRecebida() {
    return ListTile(
      contentPadding: EdgeInsets.fromLTRB(8.0, 0.0, 64.0, 0.0),
      leading: CircleAvatar(child: Image.asset('bot.png'),radius: 50,),
      title: Text(mensagemBot.nome, textAlign: TextAlign.left),
      subtitle: Text(mensagemBot.mensagem, textAlign: TextAlign.left),
    );
  }
}