// ignore_for_file: file_names


import 'package:flutter/material.dart';

class GridWeek extends StatelessWidget{

  // ignore: non_constant_identifier_names
  final int number_of_columns = 7;

  const GridWeek({super.key});

  @override
  Widget build(BuildContext context){

    return SizedBox(
      height: 30,
      width: 310,
      child: GridView.count(
          crossAxisCount: number_of_columns,
          crossAxisSpacing: 25,
          mainAxisSpacing: 15,
          children: List.generate(week.length, (index) {
            return Text(week[index],
                style: const TextStyle(
                    color: Colors.black26,
                    fontSize: 22,
                    fontWeight: FontWeight.w400
                ));
          })
      ),
    );

  }
}

const List<String> week = <String>['D','S','T','Q','Q','S','S'];