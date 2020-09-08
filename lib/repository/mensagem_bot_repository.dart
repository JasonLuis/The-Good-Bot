import 'package:ps_chatbot/model/mensagem_bot_model.dart';
import 'package:ps_chatbot/repository/database_helper.dart';

class MensagemBotRepository{

  static int id;
  DatabaseHelper _databaseHelper;
  MensagemBotRepository(){
    _databaseHelper = new DatabaseHelper();
  }

  Future<List<MensagemBotModel>> findAll() async{
    var connection = await _databaseHelper.connection;
    var result = await connection.query(
    "MensagensBot",
     columns: [
      "id",
      "nome",
      "mensagem",
     ],
     orderBy: "id desc",
    );
    List<MensagemBotModel> listaMensagemBot = new List<MensagemBotModel>();
    for (Map i in result) {
      listaMensagemBot.add(MensagemBotModel.fromMap(i));
    }
    return listaMensagemBot;
  }

  Future<int> create(MensagemBotModel msgModel) async{
    var connection = await _databaseHelper.connection;
    var result = await connection.insert(
      "MensagensBot",
      msgModel.toMap(),
    );
    id = result;
    return result;
  }

  Future<void> delete(int id) async {
    var connection = await _databaseHelper.connection;
    var result = await connection.delete(
      "MensagensBot",
      where: "id = ?",
      whereArgs: [id],
    );
  }
}