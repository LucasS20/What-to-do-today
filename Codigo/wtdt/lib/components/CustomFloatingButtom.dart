// ignore_for_file: file_names


import 'package:flutter/material.dart';
import 'package:wtdt/pages/AddTask.dart';

class CustomFloatingButtom extends StatefulWidget {
  const CustomFloatingButtom({
    super.key,
  });

  @override
  // ignore: no_logic_in_create_state
  State<CustomFloatingButtom> createState() => _CustomFloatingButtomState();
}

class _CustomFloatingButtomState extends State<CustomFloatingButtom> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const AddTask();
        }));
      },
      foregroundColor: Colors.brown[200],
      backgroundColor: Colors.brown,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: const Text(
        "+",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 40,
        ),
      ),
    );
  }
}
