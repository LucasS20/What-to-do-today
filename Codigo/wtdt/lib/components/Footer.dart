// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Footer extends StatelessWidget{
  const Footer({super.key});


  @override
  Widget build(BuildContext context) {
    return const Row(
          children: <Widget>[
            SizedBox(
              width: 30,
            ),
            Icon(Icons.free_breakfast, color: Colors.white, size: 35),
          ],
        );
  }
  
}