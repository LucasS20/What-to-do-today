// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Header extends StatelessWidget{
  const Header({super.key, required this.firstPart , required this.secondtPart});

  final String firstPart;
  final String secondtPart;

  @override
  Widget build(BuildContext context){
    return  Column(
      children: [
      const SizedBox(
        height: 20,
      ),
      Text(firstPart,
        style: const TextStyle(
          fontSize: 50,
          fontWeight: FontWeight.bold,
          color: Colors.black45
        ),
      ),
      Text(secondtPart,
        style: const TextStyle(
          fontSize: 60,
          fontWeight: FontWeight.bold,
          color: Colors.brown
        ),
      ),
      ],
    );
  }
}