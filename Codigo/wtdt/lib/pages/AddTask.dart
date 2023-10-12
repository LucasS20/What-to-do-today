// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:wtdt/components/CustomButtom.dart';
import 'package:wtdt/components/checkBoxWeek/CheckBoxWeek.dart';
import 'package:wtdt/components/Header.dart';
import 'package:wtdt/components/SelectInput.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {

  final TextEditingController _nameController = TextEditingController();
  final String value="";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        toolbarHeight: 160,
        elevation: 0,
        backgroundColor: Colors.brown[100],
        title: const Header(firstPart: 'Cadastrar', secondtPart: 'Afazer'),
      ),
      body:  SingleChildScrollView(
        child:   Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: <Widget>[
               Padding(
                padding: const EdgeInsets.all(15),
                child: SizedBox(
                  width: 340,
                  child: TextField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      focusColor: Colors.amberAccent,
                      labelText: 'Compremetimento',
                      hintText: 'Qual é o seu comprometimento?',
                    ),
                  ),
                ),
              ),
               Padding(
                padding: const EdgeInsets.all(15),
                child: SizedBox(
                   width: 440,
                  child: Column(
                    children: <Widget>[SelectInput(value: value)],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: <Widget>[CheckboxWeek()],
                ),
              ),
              CustomButtom(textLabel: "Criar", primaryColor: Colors.brown, onPressed: (){
                final String name = _nameController.text;
                // ignore: avoid_print
                print("$name olha o nome aqui");
                // ignore: avoid_print
                print("$value olha o value aqui");
                
              })
            ],
          ),
        ),
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
