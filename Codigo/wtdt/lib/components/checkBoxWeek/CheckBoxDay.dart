// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CheckboxDay extends StatefulWidget {
  const CheckboxDay({super.key, required this.label});

  final String label;

  @override
  // ignore: no_logic_in_create_state
  State<CheckboxDay> createState() => _CheckboxDayState(label: label);
}

class _CheckboxDayState extends State<CheckboxDay> {
  _CheckboxDayState({required this.label});

  bool isChecked = false;
  final String label;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
        MaterialState.selected
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.brown.shade700;
      }
      return Colors.transparent;
    }

    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(5),
          child: Transform.scale(
            scale: 1.6,
            child: Checkbox(
              checkColor: Colors.white,
              fillColor: MaterialStateProperty.resolveWith(getColor),
              value: isChecked,
              onChanged: (bool? value) {
                setState(() {
                  isChecked = value!;
                });
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(label, 
          style:  TextStyle(
            color: isChecked ? Colors.black54 : Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            decoration: isChecked ? TextDecoration.lineThrough : null

          ),),
        )
      ],
    );
  }
}
