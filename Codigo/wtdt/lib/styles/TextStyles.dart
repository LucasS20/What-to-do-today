import 'package:flutter/material.dart';

class TextStyles{

  TextStyle getTextStyleBoldItalic(double size){

    return TextStyle(
      fontFamily: 'Inter',
      fontSize: size,  
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.italic
    );
  }
}