// ignore_for_file: file_names

import 'package:flutter/material.dart';


class CheckboxDay extends Checkbox {
  const CheckboxDay({super.key, required this.label,required this.isChecked ,required this.onChanged}) 
  : super(value: isChecked, onChanged: onChanged);

  final String label;

  final bool isChecked;
  @override
  // ignore: overridden_fields
  final Function(bool?) onChanged;


  @override
  // ignore: no_logic_in_create_state
  State<CheckboxDay> createState() => _CheckboxDayState(label: label, onChanged: onChanged, isChecked: isChecked);
}

class _CheckboxDayState extends State<CheckboxDay> {
  _CheckboxDayState({required this.label, required this.isChecked, required this.onChanged});

  final String label;
  bool isChecked;
  final Function(bool?) onChanged;

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
              onChanged: (bool? value){
                setState(() {
                  isChecked = value!;
                  onChanged(value);
                });
                
              }, 
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Text(label, 
          style:  TextStyle(
            color: isChecked ? Colors.brown.shade400 : Colors.brown,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            decoration: isChecked ? TextDecoration.lineThrough : null

          ),),
        )
      ],
    );
  }
}
