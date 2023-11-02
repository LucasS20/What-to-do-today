// ignore_for_file: file_names

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wtdt/components/CustomButtom.dart';
import 'package:wtdt/components/checkBoxWeek/CheckBoxWeek.dart';
import 'package:wtdt/components/Header.dart';
import 'package:wtdt/components/SelectInput.dart';
import 'package:wtdt/db/DBHelperTask.dart';
import 'package:wtdt/models/Task.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final TextEditingController _nameController = TextEditingController();
  final String value = "";

  saveTask() async {
    final prefs = await SharedPreferences.getInstance();

    List<String> futureDays = [];
    final String description = _nameController.text;
    final String frequency = prefs.getString("selectValue") ?? "hoje";
    final List<String> listWeek = prefs.getStringList('weekDaysList') ?? [];

    switch (frequency) {
      case 'hoje':
        futureDays.add(DateToStr(DateTime.now()));
        break;
      
      case '1 semana':
        futureDays.addAll(generateListOfFutureDates(listWeek, 1));
        break;

      case '2 semana':
        futureDays.addAll(generateListOfFutureDates(listWeek, 2));
        break;

      case '1 mês':
        futureDays.addAll(generateListOfFutureDates(listWeek, 4));
        break;

      case '3 meses':
        futureDays.addAll(generateListOfFutureDates(listWeek, 12));
        break;

      default:
    }


    DBHelperTask.adicionarTarefaRepetida(description, futureDays);
  }

  List<String> generateListOfFutureDates(List<String> listWeek, int frequency) {
    final DateTime today = DateTime.now();
    List<String> futureDays = [];
    int daysToSum =0;

    for (var dayWeek in listWeek) {

      int temp = int.parse(dayWeek);

      for (int i = 0; i < frequency; i++) {
        if (temp > today.weekday) {
    
          daysToSum = (temp - today.weekday) + (7 * i);
    
        } else if (temp < today.weekday) {
          
          daysToSum = (7 - today.weekday +  temp) + (7 * i);

        } else {
          daysToSum = (7 + (7 * i));
        }

        futureDays.add(DateToStr(today.add(Duration(days: daysToSum))));
      }


    }

    return futureDays;
  }

  String DateToStr(DateTime date) {
    int day = date.day;
    int month = date.month;
    int year = date.year;

    return "$year-$month-$day ";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        toolbarHeight: 160,
        elevation: 0,
        backgroundColor: Colors.brown[100],
        title: const Header(firstPart: 'Cadastrar', secondtPart: 'Afazer'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(15),
                child: SizedBox(
                  width: 340,
                  child: TextField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      focusColor: Colors.amberAccent,
                      labelText: 'Compremetimento',
                      hintText: 'Qual é o seu comprometimento?',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: SizedBox(
                  width: 440,
                  child: Column(
                    children: <Widget>[SelectInput(value: value)],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: <Widget>[CheckboxWeek()],
                ),
              ),
              CustomButtom(
                  textLabel: "Criar",
                  primaryColor: Colors.brown,
                  onPressed: () {
                    saveTask();
                  })
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.brown[800],
        height: 70,
        child: const Row(
          children: <Widget>[
            SizedBox(
              width: 30,
            ),
            Icon(Icons.free_breakfast, color: Colors.white, size: 35),
          ],
        ),
      ),
    );
  }
}
