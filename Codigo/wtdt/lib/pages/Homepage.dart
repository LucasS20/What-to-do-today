// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:wtdt/components/CustomFloatingButtom.dart';
import 'package:wtdt/components/Footer.dart';
import 'package:wtdt/components/Header.dart';
import 'package:wtdt/components/calendaries/Calendaries.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        toolbarHeight: 160,
        elevation: 0,
        backgroundColor: Colors.brown[100],
        title: const Header(firstPart: 'What to do', secondtPart: 'Today?'),
        centerTitle: true,
      ),
      body: const SingleChildScrollView(
        child: Center(
          child: Calendaries(),
        ),
      ),
      floatingActionButton: const CustomFloatingButtom(),
      bottomNavigationBar: BottomAppBar(
        color: Colors.brown[800],
        height: 70,
        child: const Footer(),
      ),
    );
  }
}

void navigateToHomePage(BuildContext context) {
  Navigator.popUntil(context, (route) => route.isFirst);
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => const HomePage()),
  );
}
