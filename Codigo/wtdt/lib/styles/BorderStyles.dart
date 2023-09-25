import 'package:flutter/material.dart';

class BoderStyles{

  UnderlineInputBorder getUnderlineBorderInputWithBorderSideAndBorderRadius(Color primaryColor, double width, double borderRadius){
    
    return UnderlineInputBorder(
      borderSide: BorderSide(
        color: primaryColor,
        width: width
      ),
      borderRadius: BorderRadius.all(Radius.circular(borderRadius))
    );

  }


}