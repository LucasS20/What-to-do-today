// ignore_for_file: file_names

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:wtdt/components/Footer.dart';
import 'package:wtdt/components/ProgressBar.dart';
import 'package:wtdt/components/checkBoxWeek/CheckBoxDay.dart';
import 'package:wtdt/pages/AddTask.dart';
import 'package:wtdt/utils/Month.dart';
import 'package:wtdt/components/Header.dart';

class DayDetails extends StatelessWidget {
  const DayDetails({super.key, required this.day, required this.month});
  final int day;
  final Month month;

  

  @override
  Widget build(BuildContext context) {
    int totalTask = 10;
    int taskMade = Random().nextInt(10);
    double percent = (taskMade / totalTask);
    

    int numberMonth = month.numberOfMonth;
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
                return  SizedBox(
                  width: 300,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: CheckboxDay(label: listTask[index], onChecked: ()=>{}),
                  ),
                );
              }),
            )
          ],
        )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const AddTask();
          }));
        },
        foregroundColor: Colors.brown[200],
        backgroundColor: Colors.brown,
        child: const Text(
          "+",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 40,
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.brown[800],
        height: 70,
        child: Footer(),
      ),
    );
  }
}

const List<String> listTask = <String>[
  "Terminar de fazer as telas",
  "Terminar o crud de Usuários",
  "Fazer o quiz de gerência",
];
