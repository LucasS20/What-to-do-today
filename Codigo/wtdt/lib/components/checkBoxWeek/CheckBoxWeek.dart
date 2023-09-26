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
    

    return const Center(
      child:  SizedBox(
        width: 180,
        child: Column(
          children: [
            CheckboxDay(label: "Domingo"),
            CheckboxDay(label: "Segunda-feira"),
            CheckboxDay(label: "Terça-Feira"),
            CheckboxDay(label: "Quarta-Feira"),
            CheckboxDay(label: "Quinta-feira"),
            CheckboxDay(label: "Sexta-feira"),
            CheckboxDay(label: "Sábado"),
          ],
        ),
      ),
    );
  }
}
