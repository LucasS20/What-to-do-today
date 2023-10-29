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
      {"label": "Domingo", "check": false},
      {"label": "Segunda-feira", "check": false},
      {"label": "Terça-Feira", "check": false},
      {"label": "Quarta-Feira", "check": false},
      {"label": "Quinta-Feira", "check": false},
      {"label": "Sexta-feira", "check": false},
      {"label": "Sábado", "check": false},
      {"label": "Domingo", "check": false},
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
                  saveWeekList(week[index]["label"], week[index]["check"]);
                });
          }),
        ),
      ),
    );
  }
}
// CheckboxDay(label: "Domingo"),

