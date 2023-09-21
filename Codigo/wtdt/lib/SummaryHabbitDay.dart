// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:wtdt/HabbitDayButton.dart';
import 'package:wtdt/utils/Month.dart';

const List<String> week = <String>['D','S','T','Q','Q','S','S'];

class SummaryHabbitDay extends StatefulWidget {

  const SummaryHabbitDay({super.key, required this.month});
  
  final Month month;
  
  @override
  // ignore: library_private_types_in_public_api, no_logic_in_create_state
  _SummaryHabbitDayState createState() => _SummaryHabbitDayState(month: month);
}


class _SummaryHabbitDayState extends State<SummaryHabbitDay>{
  
  _SummaryHabbitDayState({required this.month});

  Month month;
  // ignore: non_constant_identifier_names
  final int number_of_columns = 7; 
  @override
  Widget build(BuildContext context){
    return SizedBox(
      height: 320,
      width: 320,
      child: GridView.count(
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        crossAxisCount: number_of_columns,
        children: List.generate(month.days, (index) {
          return Center(
            child: HabbitDayButton(month: month, day: index + 1),
          );
        }),
        )
      );
  }
}



// children: List.generate(week.length, (index) => 
//                     Text(week[index])
//                   ),