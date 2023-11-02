// ignore_for_file: no_leading_underscores_for_local_identifiers, file_names, use_build_context_synchronously


import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';
import 'package:wtdt/models/Task.dart';


class DBHelperTask{

  static const String nomeTabela = "tarefa";

  static Future<void> criaTabela(sql.Database database) async {
    await database.execute("""CREATE TABLE tarefa(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        descricao TEXT,
        data TEXT,
        concluido Integer,
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
      )
      """);
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'tarefa.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await criaTabela(database);
      },
    );
  }

  static Future<int> adicionarTarefa(Task task) async {
    final db = await DBHelperTask.db();

    final dados = {
      'descricao': task.descricao, 
      'data': task.data,
      'concluido': 0,
    };

    debugPrint("dados salvos $dados");

    final id = await db.insert(nomeTabela, dados,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  static Future<void> adicionarTarefaRepetida(String descricao, List<String> datas) async {
    final db = await DBHelperTask.db();
    final Batch batch = db.batch();

    for (var srt_data in datas) {

      dynamic dados = {
        'descricao': descricao, 
        'data': srt_data,
        'concluido': 0,
      };

      batch.insert(nomeTabela, dados);
      
    }

    try {
      await  batch.commit();
      debugPrint("Success, A lot of Insert");  
    } catch (e) {
      String message = e.toString();
      debugPrint("dados salvos $message");  
    }
    
  }

  static Future<List<Map<String, dynamic>>> listaTarefas() async {
    final db = await DBHelperTask.db();
    return db.query(nomeTabela, orderBy: "id");
  }

  static Future<List<Map<String, dynamic>>> retornatarefaPeloId(int id) async {
    final db = await DBHelperTask.db();
    return db.query(nomeTabela, where: "id = ?", whereArgs: [id], limit: 1);
  }

  static Future<int> atualizatarefa(
      Task task) async {
    final db = await DBHelperTask.db();

    final dados = {
      'descricao': task.descricao, 
      'data': task.data,
      'concluido': task.concluido,
    };

    final result =
    await db.update(nomeTabela, dados, where: "id = ?", whereArgs: [task.id]);
    return result;
  }

  static Future<void> apagatarefa(int id) async {
    final db = await DBHelperTask.db();
    try {
      await db.delete(nomeTabela, where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Erro ao apagar o item item: $err");
    }
  }

  static Future<int> toggleTarefa(int id, bool value) async{

    final db = await DBHelperTask.db();
    return  db.rawUpdate('UPDATE $nomeTabela SET concluido = ? WHERE id = ?', [value, id]);
  } 

}