// ignore_for_file: file_names

class Task{

  final int? id;
  final String descricao;
  final String data;
  final int? concluido;

  const Task ({
    this.id,
    required this.descricao,
    required this.data,
    this.concluido
  });

}