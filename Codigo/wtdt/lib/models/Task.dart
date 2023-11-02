// ignore_for_file: file_names
class Task{

  final int? id;
  final String descricao;
  final String data;
  int? concluido;

  Task ({
    this.id,
    required this.descricao,
    required this.data,
    this.concluido
  });

  factory Task.fromMap(Map<String, dynamic> map){
    return Task(
      id: map['id'] as int,
      descricao: map['descricao'] as String,
      data: map['data'] as String,
      concluido: map['concluido'] as int
    );
  }
}