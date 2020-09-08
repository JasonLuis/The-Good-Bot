import 'package:ps_chatbot/model/mensagem_bot_model.dart';
import 'package:ps_chatbot/repository/mensagem_bot_repository.dart';
import 'package:ps_chatbot/screens/ordencao_conversa.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dialogflow/dialogflow_v2.dart';

class ConversaBotScreen extends StatefulWidget {
  @override
  _ConversaBotState createState() => _ConversaBotState();
}

class _ConversaBotState extends State<ConversaBotScreen> {
  
  final _controleTexto = new TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _controleTexto.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //MensagemBotRepository().findAll();
    
    
    return Scaffold(
      appBar: new AppBar(
        title: Text('The Good Bot'),
        backgroundColor: Color.fromRGBO(7, 168, 167, 66),
      ),
      body: Column(
        children: <Widget>[
          _preencheList(),       
          Divider(height: 1.0),
          _inputMensagem()
        ],
      ),
    );
  }

  Widget _preencheList(){
    return FutureBuilder<List<MensagemBotModel>>(
        future: MensagemBotRepository().findAll(),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.done){
            return _buildList(snapshot.data);
          }else{
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
    );
  }

  // Cria a lista de mensagens (de baixo para cima)
  Widget _buildList(List<MensagemBotModel> msg) {
    return Flexible(
      child: ListView.builder(
        padding: EdgeInsets.all(8.0),
        reverse: true,
        itemBuilder: (_, int index){
          return OrdenacaoConversa(mensagemBot: msg[index]);
        }, 
        itemCount: msg == null ? 0: msg.length, 
      ),
    );
  }

  void _enviarMensagem({String texto}) {
    _controleTexto.clear();
    _addMensagem(nome: 'Você', msg: texto, type: MensagemBotType.sent);
  }

  void _addMensagem({String nome, String msg, MensagemBotType type}) {
    var mensagem = MensagemBotModel(
        mensagem: msg, nome: nome, type: type);

    setState(() {
      MensagemBotRepository().create(mensagem);
    });
    
    if (type == MensagemBotType.sent) {
      // Envia a mensagem para o chatbot e aguarda sua resposta
      _dialogFlowRequest(query: mensagem.mensagem);  
    }
    
    
  }

  Future _dialogFlowRequest({String query}) async {
    // Adiciona uma mensagem temporária na lista
    _addMensagem(
        nome: 'The Good Bot',
        msg: 'Digitando...',
        type: MensagemBotType.received);

    AuthGoogle authGoogle = await AuthGoogle(fileJson: "assets/bot.json").build();
    Dialogflow dialogflow = Dialogflow(authGoogle: authGoogle, language: "pt-BR");
    AIResponse response = await dialogflow.detectIntent(query);
    
    setState(() {
      MensagemBotRepository().delete(MensagemBotRepository.id);
    });
    _addMensagem(
        nome: 'The Good Bot',
        msg: response.getMessage() ?? '',
        type: MensagemBotType.received);    
  }

  Widget _textoMensagem() {
    return new Flexible(
      child: new TextField(
        controller: _controleTexto,
        decoration: new InputDecoration.collapsed(
          hintText: "Escreva uma mensagem para The Good Bot",
        ),
      ),
    );
  }

  Widget _buttonEnviar() {
    return new Container(
      margin: new EdgeInsets.only(left: 8.0),
      child: new IconButton(
          icon: new Icon(Icons.send, color: Color.fromRGBO(7, 168, 167, 66),),
          onPressed: () {
            if (_controleTexto.text.isNotEmpty) {
              _enviarMensagem(texto: _controleTexto.text);
            }
          }),
    );
  }

  Widget _inputMensagem() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: new Row(
        children: <Widget>[
          _textoMensagem(),
          _buttonEnviar(),
        ],
      ),
    );
  }
  
}