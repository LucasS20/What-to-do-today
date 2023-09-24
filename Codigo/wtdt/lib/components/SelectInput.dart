// ignore_for_file: file_names

import 'package:flutter/material.dart';

const List<String> options = <String>["Nenhuma",'1 semana', '2 semanas', '1 mês', '3 meses'];

class SelectInput extends StatefulWidget{
  const SelectInput({super.key});



   @override
  State<SelectInput> createState() => _SelectInputState();
}

class _SelectInputState extends State<SelectInput>{

  final String label = "Recorrência";
  String value = options.first;

  @override
  Widget build(BuildContext context){
    return DropdownMenu<String>(
      width: 440,
      label: Text(label, 
        style: const TextStyle(
          fontSize: 18,
        ),),
      hintText: "Com qual recorrência?",
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder()
      ),
      
      // initialSelection: options.first,
      onSelected: (String? select) {
        // This is called when the user selects an item.
        setState(() {
          value = select!;
        });
      },
      dropdownMenuEntries: options.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(value: value, label: value);
      }).toList(),
    );
  }
}