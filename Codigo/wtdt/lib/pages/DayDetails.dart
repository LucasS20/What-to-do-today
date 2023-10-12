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

class DayDetails extends StatefulWidget {
  const DayDetails({super.key, required this.day, required this.month});
  final int day;
  final Month month;

  @override
  State<DayDetails> createState() => _DayDetailsState();
}

class _DayDetailsState extends State<DayDetails> {
  
  List<Task> listTask = <Task>[
    Task("Terminar de fazer as telas", "", ["", ""], false),
    Task("Terminaro form de Add task", "", ["", ""], false),
    Task("Fazer o quiz de gerência", "", ["", ""], false),
  ];

  @override
  Widget build(BuildContext context) {
    String mes = widget.month.getNameMonth();
    int totalTask = listTask.length;
    // int taskMade = Random().nextInt(listTask.length);
    int taskMade = listTask.where((task) => task.isChecked).length;
    double percent = (taskMade / totalTask);

    
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
                "${widget.day} de $mes",
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
                          setState(() {
                            listTask[index].isChecked = value!;
                            if(value){
                              taskMade++;
                              percent = (taskMade / totalTask);
                            }else{
                              taskMade--;
                              percent = (taskMade / totalTask);
                            }
                            // print("progress $taskMade $percent");
                          });
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
