// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:wtdt/Header.dart';

class AddTask extends  StatefulWidget{
  const AddTask({super.key});


  @override
  // ignore: library_private_types_in_public_api
  _AddTaskState createState()=> _AddTaskState();
}

class _AddTaskState extends State<AddTask>{

  @override
  Widget build(BuildContext context){
    return  Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        toolbarHeight: 160,
        elevation: 0,
        backgroundColor: Colors.brown[100],
        title: const Header(firstPart: 'Cadastrar', secondtPart: 'Afazer'),
        
      ),
      body: const Column(
        children: <Widget>[
          Text("Aqui terá o formulário")
        ],
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