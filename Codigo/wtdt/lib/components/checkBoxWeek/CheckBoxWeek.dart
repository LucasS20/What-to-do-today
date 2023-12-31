// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wtdt/components/checkBoxWeek/CheckBoxDay.dart';

class CheckboxWeek extends StatefulWidget {
  const CheckboxWeek({super.key});

  @override
  State<CheckboxWeek> createState() => _CheckboxWeekState();
}

class _CheckboxWeekState extends State<CheckboxWeek> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    final week = <Map>[
      {"label": "Domingo", "check": false, "value": '0'},
      {"label": "Segunda-feira", "check": false, "value": '1'},
      {"label": "Terça-Feira", "check": false, "value": '2'},
      {"label": "Quarta-Feira", "check": false, "value": '3'},
      {"label": "Quinta-Feira", "check": false, "value": '4'},
      {"label": "Sexta-feira", "check": false, "value": '5'},
      {"label": "Sábado", "check": false, "value": '6'},
    ];

    saveWeekList(String weekDay, bool staus) async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      List<String> weekDaysList = prefs.getStringList("weekDaysList") ?? [];

      if(staus){
        weekDaysList.add(weekDay);
      }else{
        weekDaysList.remove(weekDay);
      }

      await prefs.setStringList("weekDaysList", weekDaysList);
      // print(List.from(week));
    }

    return Center(
      child: SizedBox(
        width: 200,
        child: Column(
          children: List.generate(week.length, (index) {
            return CheckboxDay(
                label: week[index]["label"],
                isChecked: week[index]["check"],
                onChanged: (value){
                  setState(() {
                    week[index]["check"] = value;
                  });
                  saveWeekList(week[index]["value"], week[index]["check"]);
                });
          }),
        ),
      ),
    );
  }
}
// CheckboxDay(label: "Domingo"),

