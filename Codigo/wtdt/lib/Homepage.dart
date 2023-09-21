// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:wtdt/AddTask.dart';
import 'package:wtdt/Calendaries.dart';

class HomePage extends StatelessWidget{
  const HomePage({super.key});


  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.brown[100],
      body: const Center(
        child: Calendaries(),
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
    );
  }
}