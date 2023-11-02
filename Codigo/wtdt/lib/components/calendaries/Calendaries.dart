// ignore_for_file: file_names

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:wtdt/components/Calendaries/GridWeek.dart';
import 'package:wtdt/components/Calendaries/SummaryHabbitDay.dart';
import 'package:wtdt/utils/Month.dart';

class Calendaries extends StatelessWidget {
  const Calendaries({super.key});


  @override
  Widget build(BuildContext context) {
    final int currentMonth = DateTime.now().month;

    return Center(
      child: CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 1.0,
            height: 650.0, 
            initialPage: currentMonth - 1
          ),
          items: List.generate(months.length, (index) =>
              Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 5.0),
                child: SizedBox(
                  width: 400,
                  child: Column(
                    children:  <Widget>[
                      Text(months[index].getNameMonth(),
                          style: const TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.black45
                          )),
                      GridWeek(key: key),
                      SummaryHabbitDay(month: months[index])
                    ],
                  ),
                ),
              )
          )
      ),
    );
  }
}


const List<Month> months = <Month>[
  Month(numberOfMonth: 1, days: 31,),
  Month(numberOfMonth: 2, days: 28),
  Month(numberOfMonth: 3, days: 31),
  Month(numberOfMonth: 4, days: 30),
  Month(numberOfMonth: 5, days: 31),
  Month(numberOfMonth: 6, days: 30),
  Month(numberOfMonth: 7, days: 31),
  Month(numberOfMonth: 8, days: 31),
  Month(numberOfMonth: 9, days: 30),
  Month(numberOfMonth: 10, days: 31),
  Month(numberOfMonth: 11, days: 30),
  Month(numberOfMonth: 12, days: 31),
];