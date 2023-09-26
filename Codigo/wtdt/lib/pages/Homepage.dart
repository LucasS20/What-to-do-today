// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:wtdt/components/Footer.dart';
import 'package:wtdt/components/Header.dart';
import 'package:wtdt/pages/AddTask.dart';
import 'package:wtdt/components/calendaries/Calendaries.dart';

class HomePage extends StatelessWidget{
  const HomePage({super.key});


  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
          toolbarHeight: 160,
          elevation: 0,
          backgroundColor: Colors.brown[100],
          title: const Header(firstPart: 'What to do', secondtPart: 'Today?'),
          centerTitle: true,
        ),
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
      bottomNavigationBar: BottomAppBar(
          color: Colors.brown[800],
          height: 70,
          child: Footer(),
        ),
    );
  }
}