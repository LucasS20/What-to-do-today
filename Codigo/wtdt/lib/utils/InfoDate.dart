// ignore_for_file: file_names
import 'dart:convert';

class InfoDate{

  final String date;
  final int totalTask;
  final int completedTasks;

  InfoDate ({
    required this.date,
    required this.totalTask,
    required this.completedTasks
  });

  factory InfoDate.fromMap(Map<String, dynamic> map){
    return InfoDate(
      date: map['date'] as String,
      totalTask: map['totalTask'] as int,
      completedTasks: map['completedTasks'] as int,
    );
  }

  static List<String> mapToList(Map<String, Map<String, dynamic>> inputMap) {
  List<String> outputList = [];

  inputMap.forEach((key, value) {
    Map<String, dynamic> innerMap = value;
    String innerMapAsString = innerMap.toString();
    outputList.add(innerMapAsString);
  });

  return outputList;
}

static Map<String, InfoDate> listToMap(List<String> inputList) {
  Map<String, InfoDate> outputMap = {};

  for (var item in inputList) {
    try {
      print(item);
      Map<String, dynamic> map = jsonDecode(item);
      InfoDate temp = InfoDate.fromMap(map);
      outputMap[temp.date] = temp ;
    } catch (e) {
      print('Erro na conversão: $e');

    }
  }

  return outputMap;
}


}