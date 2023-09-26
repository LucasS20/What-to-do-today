// ignore_for_file: file_names

import 'package:flutter/material.dart';

class HeaderSignUp extends StatelessWidget {
  const HeaderSignUp(
      {super.key, required this.firstPart, required this.secondtPart});

  final String firstPart;
  final String secondtPart;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Text(
              firstPart,
              style: const TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.black45),
            ),
            SizedBox(width: 16), // Espaço entre os Textos
            Text(
              secondtPart,
              style: const TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown),
            ),
          ],
        )
      ],
    );
  }
}
