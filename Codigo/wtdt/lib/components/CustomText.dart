// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:wtdt/styles/TextStyles.dart';

class CustomText extends StatelessWidget{
  
  const CustomText({
    super.key,
    required this.textLabel,
    required this.size
  });

  final String textLabel;
  final double size;
  
  @override
  Widget build(BuildContext context) {
    
    TextStyles styles = TextStyles();

    return Text(
      textLabel,
      style: styles.getTextStyleBoldItalic(size),
    );

  }


}