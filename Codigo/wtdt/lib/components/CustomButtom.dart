import 'package:flutter/material.dart';
import 'package:wtdt/styles/TextStyles.dart';

class CustomButtom extends StatefulWidget{
  
  const CustomButtom({
    super.key,
    required this.textLabel,
    required this.primaryColor
  });

  final String textLabel;
  final Color primaryColor;

  @override
  State<CustomButtom> createState() => _CustomButtomState(textLabel: textLabel, primaryColor: primaryColor);
}

class _CustomButtomState extends State<CustomButtom>{

  _CustomButtomState({
    required this.textLabel,
    required this.primaryColor
  });

  final String textLabel;
  final Color primaryColor;

  //final GlobalKey<ScaffoldState> _formKey = GlobalKey<ScaffoldState>();
  
  @override
  Widget build(BuildContext context) {
    
    const Size min = Size(325.0, 100.0);
    const Size max = Size(475.0, 100.0);

    TextStyles styles = TextStyles();

    return ElevatedButton(
      onPressed: () {}, 
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        minimumSize: min,
        maximumSize: max,
        textStyle: styles.getTextStyleBoldItalic(42),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0)
        )
      ),
      child: Text(
        textLabel
      ),
    );

  
  }



}