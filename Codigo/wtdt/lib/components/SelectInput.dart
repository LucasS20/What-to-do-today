// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// const List<String> options = <String>['hoje', '1 semana', '2 semanas', '1 mês', '3 meses'];

const Map<String, int> options = {'hoje': 0, '1 semana': 1, '2 semanas' : 2, '1 mês': 4, '3 meses': 12};

class SelectInput extends StatefulWidget{
  const SelectInput({super.key, required this.value});

  final String value;

  

   @override
  // ignore: no_logic_in_create_state
  State<SelectInput> createState() => _SelectInputState();
}

class _SelectInputState extends State<SelectInput>{

  _SelectInputState();
  final String label = "Recorrência";
  String value = options['hoje'].toString();
  
  _saveData(String saveValue) async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("selectValue", saveValue);
  }

  @override
  Widget build(BuildContext context){
    return DropdownMenu<String>(
      width: 340,
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
          print(value);
        });
        _saveData(select!);

      },
      dropdownMenuEntries: options.keys.map<DropdownMenuEntry<String>>((String key) {
        return DropdownMenuEntry<String>(value: options[key].toString(), label: key);
      }).toList(),
    );
  }
}