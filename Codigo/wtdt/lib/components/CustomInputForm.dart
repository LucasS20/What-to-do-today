// ignore_for_file: no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:wtdt/styles/BorderStyles.dart';

class CustomInputForm extends StatefulWidget{
  
  const CustomInputForm({
    super.key,
    required this.primaryColor,
    required this.secondaryColor,
    required this.controller
  });

  final Color primaryColor;
  final Color secondaryColor;
  final TextEditingController controller;

  @override
  State<CustomInputForm> createState() => _CustomInputFormState(primaryColor: primaryColor, secondaryColor: secondaryColor, controller: controller);


}
class _CustomInputFormState extends State<CustomInputForm>{

  _CustomInputFormState({
    required this.primaryColor,
    required this.secondaryColor,
    required this.controller
  });

  final Color primaryColor;
  final Color secondaryColor;
  final TextEditingController controller;

  final GlobalKey<FormFieldState> _formKey = GlobalKey<FormFieldState>();

  BoderStyles boderStyles = BoderStyles();

  @override
  Widget build(BuildContext context){
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: controller,
            decoration: 
              InputDecoration(
                filled: true,
                fillColor: secondaryColor,
                enabledBorder: boderStyles.getUnderlineBorderInputWithBorderSideAndBorderRadius(primaryColor, 5.0, 10.0),
                focusedBorder: boderStyles.getUnderlineBorderInputWithBorderSideAndBorderRadius(primaryColor, 10.0, 10.0)
              ),
            cursorColor: primaryColor,
          ),
        ],
      ),
    );
  }

}