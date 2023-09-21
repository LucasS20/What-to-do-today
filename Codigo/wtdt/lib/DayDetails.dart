// ignore_for_file: file_names


import 'package:flutter/material.dart';
import 'package:wtdt/utils/Month.dart';


class DayDetails extends StatelessWidget{

  const DayDetails({super.key, required this.day ,required this.month });
  final int day;
  final Month month;
  
  @override
  Widget build(BuildContext context){
    String mes = month.name;
    return  Scaffold(
        backgroundColor: Colors.brown[100],
        appBar: AppBar(
        toolbarHeight: 160,
        elevation: 0,
        backgroundColor: Colors.brown[100],
        centerTitle: false,
       ),

      body: Center(
        
        child: Text("$day / $mes")
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.brown[800],
        height: 70,
        child: const Row(
          children: <Widget>[
            SizedBox(width: 30,),
              Icon(Icons.free_breakfast,
              color: Colors.white,
              size: 35),
          ],
        ),
      ),
    );
  }
}