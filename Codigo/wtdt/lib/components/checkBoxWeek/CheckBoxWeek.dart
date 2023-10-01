// ignore_for_file: file_names

import 'package:flutter/material.dart';
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

    return Center(
      child: SizedBox(
        width: 180,
        child: Column(
          children: List.generate(week.length, (index) {
            return CheckboxDay(
                label: week[index]["label"],
                isChecked: week[index]["check"],
                onChanged: (value) {
                  setState(() {
                    week[index]["check"] = value;
                  });
                });
          }),
        ),
      ),
    );
  }
}
// CheckboxDay(label: "Domingo"),

