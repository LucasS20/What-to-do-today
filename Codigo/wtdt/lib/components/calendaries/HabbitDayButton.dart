// ignore_for_file: file_names

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:wtdt/pages/DayDetails.dart';
import 'package:wtdt/utils/Month.dart';

// ignore: use_key_in_widget_constructors
class HabbitDayButton extends StatefulWidget {

  HabbitDayButton({super.key, required this.day ,required this.month});

  final int day;
  final Month month;
  

  @override
  // ignore: library_private_types_in_public_api, no_logic_in_create_state
  _HabbitDayButtonState createState() => _HabbitDayButtonState(day: day, month: month);
}

class _HabbitDayButtonState extends State<HabbitDayButton> {

  _HabbitDayButtonState({required this.day ,required this.month});
  
  final int day;
  final Month month;
  
  final DateTime today = DateTime.now();


  @override
  Widget build(BuildContext context) {
    final bool disable = day < 1;
    String label = "";
    double strokeBorder = 0;
    int intensityColor =  (Random().nextInt(8) + 1) * 100;
    // 800 600 400 200
    if(month.numberOfMonth == today.month && day == today.day ){
      strokeBorder = 3.0;
    }

    if(!disable){
      label = "$day";
    }


    return SizedBox(
      width: 50,
      height: 50,
      child: ElevatedButton(onPressed: disable ? null : () {
        Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return DayDetails(day: day, month: month);
            }
        ));
      },
        
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.brown[intensityColor],
          side: BorderSide(color: Colors.white, width: strokeBorder),

          // padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
        ),
        child: Text(label, style: const TextStyle(
          fontSize: 8,
          fontWeight: FontWeight.bold
        ),)
      ),
    );
  }
}