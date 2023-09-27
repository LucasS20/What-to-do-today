// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ProgressBar extends StatefulWidget {
  const ProgressBar({super.key, this.progress});

  final double? progress;

  @override
  // ignore: no_logic_in_create_state
  State<ProgressBar> createState() => _ProgressBarState(progress: progress);

}

class _ProgressBarState extends State<ProgressBar> with TickerProviderStateMixin{

  _ProgressBarState({ this.progress});

  double? progress;
  

  @override
  Widget build(BuildContext context){
    
    double? currentProgress = progress;

    return Padding(
      padding:  const EdgeInsets.only(right: 50.0, left: 50.0),
      child:  LinearProgressIndicator(
        value: currentProgress ?? 0,
        minHeight: 8,
        borderRadius:const  BorderRadius.all(Radius.circular(5.0)),
        color: Colors.brown,
        backgroundColor: Colors.black54,
      ),
    );
  }
}