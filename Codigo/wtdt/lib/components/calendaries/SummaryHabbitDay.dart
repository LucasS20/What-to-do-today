// ignore_for_file: file_names, non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wtdt/components/calendaries/HabbitDayButton.dart';
import 'package:wtdt/db/DBHelperTask.dart';
import 'package:wtdt/utils/Month.dart';

class SummaryHabbitDay extends StatefulWidget {
  const SummaryHabbitDay({super.key, required this.month});

  final Month month;

  @override
  // ignore: library_private_types_in_public_api, no_logic_in_create_state
  _SummaryHabbitDayState createState() => _SummaryHabbitDayState(month: month);
}

class _SummaryHabbitDayState extends State<SummaryHabbitDay> {
  _SummaryHabbitDayState({required this.month});

  Month month;
  final int number_of_columns = 7;

  Map<String, Map<String, dynamic>> bigData = {};

  @override
  initState() {
    super.initState();
    getDatas();
  }

  Future<Map<String, Map<String, dynamic>>> getDatas() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getInt('userId') ?? -1;
    final data = await DBHelperTask.getData(userId);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    getDatas();
    return FutureBuilder(
      future: getDatas(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          bigData = snapshot.data as Map<String, Map<String, dynamic>>;
          final int startWeekDay =
              DateTime(DateTime.now().year, month.numberOfMonth, 1).weekday;
          int dayRegulador = startWeekDay;
          if (startWeekDay == 7) {
            dayRegulador = 0;
          }
          return SizedBox(
            height: 400,
            width: 380,
            child: GridView.count(
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              crossAxisCount: number_of_columns,
              children: List.generate(month.days + dayRegulador, (index) {
                return Center(
                  child: HabbitDayButton(
                      month: month, day: index + 1 - dayRegulador, bigData: bigData),
                );
              }),
            ),
          );
        } else {
          return const CircularProgressIndicator(
            color: Colors.brown,
          ); // Exibe um indicador de carregamento enquanto espera os dados.
        }
      },
    );
  }
}



// children: List.generate(week.length, (index) => 
//                     Text(week[index])
//                   ),