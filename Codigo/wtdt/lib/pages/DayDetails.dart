// ignore_for_file: file_names

import 'package:flutter/material.dart';
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
      body:  Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding:  const EdgeInsets.only(top: 20, bottom: 5),
              child: Text("$day de $mes", 
                style:  const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown
                ),
              ),
            ),
            const Padding(
              padding:   EdgeInsets.only(bottom: 20),
              child: ProgressBar(),
            ),
            const SizedBox(
              width: 300, 
              child:  Padding(
                padding:   EdgeInsets.only(bottom: 20),
                child: CheckboxDay(label: "Terminar de fazer as telas"),
              ),
            ),
          ],
        )
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,  MaterialPageRoute(
          builder: (context) {
            return const AddTask();
          }
        ));
        },
        foregroundColor: Colors.brown[200],
        backgroundColor: Colors.brown,
        
        child: const Text("+", 
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 40,
        ),),
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
