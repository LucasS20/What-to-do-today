// ignore: file_names
import 'package:flutter/material.dart';
import 'package:wtdt/Day_Details.dart';
import 'package:wtdt/utils/Month.dart';

// ignore: use_key_in_widget_constructors
class HabbitDayButton extends StatefulWidget {

  const HabbitDayButton({super.key, required this.day ,required this.month});
  
  final int day;
  final Month month;

  @override
  // ignore: library_private_types_in_public_api, no_logic_in_create_state
  _HabbitDayButtonState createState() => _HabbitDayButtonState(day: day, month: month);
}

class _HabbitDayButtonState extends State<HabbitDayButton> {

  _HabbitDayButtonState({required this.day ,required this.month});
  final String _label = "";
  final int day;
  final Month month;
  final DateTime today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      height: 40,
      child: ElevatedButton(onPressed: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return DayDetails(day: day, month: month);
          }
        ));
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.brown[500],
        // padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      ), 
      child: Text(_label),
      ),
    );
  }
}
