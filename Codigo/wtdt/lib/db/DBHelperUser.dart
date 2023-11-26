import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:wtdt/models/User.dart';

class DBHelperUser {
  static const String nomeTabela = "usuario";

  static Future<void> criaTabela(sql.Database database) async {
    await database.execute("""CREATE TABLE usuario(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        nome TEXT,
        email TEXT,
        senha TEXT,
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
      )
      """);
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'usuario.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await criaTabela(database);
      },
    );
  }

  static Future<int> adicionarUsuario(User user) async {
    final db = await DBHelperUser.db();

    final dados = {'nome': user.nome, 'email': user.email, 'senha': user.senha};
    final id = await db.insert(nomeTabela, dados,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  static Future<List<Map<String, dynamic>>> listaUsuarios() async {
    final db = await DBHelperUser.db();
    return db.query(nomeTabela, orderBy: "id");
  }

  static Future<List<Map<String, dynamic>>> retornaUsuarioPeloId(int id) async {
    final db = await DBHelperUser.db();
    return db.query(nomeTabela, where: "id = ?", whereArgs: [id], limit: 1);
  }

  static Future<int> atualizaUsuario(User user) async {
    final db = await DBHelperUser.db();

    final dados = {
      'nome': user.nome,
      'email': user.email,
      'senha': user.senha,
      'createdAt': DateTime.now().toString()
    };

    final result = await db
        .update(nomeTabela, dados, where: "id = ?", whereArgs: [user.id]);
    return result;
  }

  static Future<void> apagaUsuario(int id) async {
    final db = await DBHelperUser.db();
    try {
      await db.delete(nomeTabela, where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Erro ao apagar o item item: $err");
    }
  }

  static Future<int?> realizaLogin(String email, String senha) async {
    final db = await DBHelperUser.db();
    final result = await db.query(
      nomeTabela,
      columns: ['id'],
      where: "email = ? AND senha = ?",
      whereArgs: [email, senha],
      limit: 1,
    );

    return result.isNotEmpty ? result[0]['id'] as int : null;
  }
}
