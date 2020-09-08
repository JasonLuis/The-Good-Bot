import 'dart:convert';

enum MensagemBotType {sent, received}

class MensagemBotModel{
  int id;
  String nome;
  String mensagem;
  MensagemBotType type;

  MensagemBotModel({
    this.id,
    this.nome,
    this.mensagem,
    this.type = MensagemBotType.sent,
  });

  factory MensagemBotModel.fromJson(String str) => MensagemBotModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory MensagemBotModel.fromMap(Map<String, dynamic> json) => MensagemBotModel(
        id: json["id"],
        nome: json["nome"],
        mensagem: json["mensagem"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "nome": nome,
        "mensagem": mensagem,
    };
}

