// ignore_for_file: file_names

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:wtdt/components/CustomFloatingButtom.dart';
import 'package:wtdt/components/Footer.dart';
import 'package:wtdt/components/ProgressBar.dart';
import 'package:wtdt/components/checkBoxWeek/CheckBoxDay.dart';
import 'package:wtdt/utils/Month.dart';
import 'package:wtdt/components/Header.dart';
import 'package:wtdt/utils/Task.dart';

class DayDetails extends StatelessWidget {
  const DayDetails({super.key, required this.day, required this.month});
  final int day;
  final Month month;

  // final checkboxController = checkboxController();

  @override
  Widget build(BuildContext context) {
    int totalTask = listTask.length;
    int taskMade = Random().nextInt(listTask.length);
    double percent = (taskMade / totalTask);

    String mes = month.getNameMonth();
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        toolbarHeight: 160,
        elevation: 0,
        backgroundColor: Colors.brown[100],
        title: const Header(firstPart: 'What to do', secondtPart: 'Today?'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
            child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 5),
              child: Text(
                "$day de $mes",
                style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: ProgressBar(progress: percent),
            ),
            Column(
              children: List.generate(listTask.length, (index) {
                return SizedBox(
                  width: 300,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: CheckboxDay(
                        label: listTask[index].description,
                        isChecked: listTask[index].isChecked,
                        onChanged: (value) {
                          listTask[index].isChecked = value!;
                        }),
                  ),
                );
              }),
            )
          ],
        )),
      ),
      floatingActionButton: const CustomFloatingButtom(),
      bottomNavigationBar: BottomAppBar(
        color: Colors.brown[800],
        height: 70,
        child: Footer(),
      ),
    );
  }
}

List<Task> listTask = <Task>[
  Task("Terminar de fazer as telas", "", ["", ""], false),
  Task("Terminaro form de Add task", "", ["", ""], false),
  Task("Fazer o quiz de gerência", "", ["", ""], false),
];

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
