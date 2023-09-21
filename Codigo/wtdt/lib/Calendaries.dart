// ignore: file_names

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:wtdt/GridWeek.dart';
import 'package:wtdt/SummaryHabbitDay.dart';
import 'package:wtdt/utils/Month.dart';

class Calendaries extends StatelessWidget {
  const Calendaries({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CarouselSlider(
        options: CarouselOptions(height: 400.0),
        items: List.generate(months.length, (index) => 
           SizedBox(
            child: Column(
              children:  <Widget>[
                Text(months[index].name,
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey
                )),
                GridWeek(key: key),
                SummaryHabbitDay(month: months[index])
              ],
            ),
          )
        )
      ),
    );
  }
}


const List<Month> months = <Month>[
  Month(name: "Janeiro", days: 31,),
  Month(name: "Fevereiro", days: 28),
  Month(name: "Março", days: 31),
  Month(name: "Abril", days: 30),
  Month(name: "Maio", days: 31),
  Month(name: "Junho", days: 30),
  Month(name: "Julho", days: 31),
  Month(name: "Agosto", days: 31),
  Month(name: "Setembro", days: 30),
  Month(name: "Outubro", days: 31),
  Month(name: "Novembro", days: 30),
  Month(name: "Dezembro", days: 31),
];
