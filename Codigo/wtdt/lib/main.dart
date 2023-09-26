import 'package:flutter/material.dart';
import 'package:wtdt/components/Header.dart';
import 'package:wtdt/pages/Homepage.dart';



void main() {
  runApp(const MainApp());
}

// ignore: must_be_immutable
class MainApp extends StatelessWidget {
  
  final String title = "What to do today?";

  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // localizationsDelegates: const [
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate
      // ],
      // supportedLocales: const [Locale('pt', 'BR')],
      title: "What to do Today",
      theme: ThemeData(
        primaryColor: Colors.transparent,
        secondaryHeaderColor: Colors.brown[200],
      ),
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 160,
          elevation: 0,
          backgroundColor: Colors.brown[100],
          title: const Header(firstPart: 'What to do', secondtPart: 'Today?'),
          centerTitle: true,
        ),
        body: const Center(
          child: HomePage(),
          // child: DayDetails(day: 1, month: Month(numberOfMonth: 1, days: 31)),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.brown[800],
          height: 70,
          child: const Row(
            children: <Widget>[
              SizedBox(width: 30,),
               Icon(Icons.free_breakfast,
               color: Colors.white,
               size: 35),
            ],
          ),
        ),
      ),
    );
  }
}
