// ignore_for_file: file_names, no_logic_in_create_state
import 'package:flutter/material.dart';
import 'package:wtdt/components/CustomFloatingButtom.dart';
import 'package:wtdt/components/Footer.dart';
import 'package:wtdt/components/checkBoxWeek/CheckBoxDay.dart';
import 'package:wtdt/db/DBHelperTask.dart';
import 'package:wtdt/pages/Homepage.dart';
import 'package:wtdt/utils/Month.dart';
import 'package:wtdt/components/Header.dart';
import 'package:wtdt/models/Task.dart';

class DayDetails extends StatefulWidget {
  const DayDetails({super.key, required this.day, required this.month});
  final int day;
  final Month month;

  @override
  State<DayDetails> createState() => _DayDetailsState(day: day, month: month);
}

class _DayDetailsState extends State<DayDetails> {
  _DayDetailsState({required this.day, required this.month});

  final int day;
  final Month month;
  List<Task> listTask = <Task>[];

  int totalTask = 0;
  int taskMade = 0;
  double percent = 0;

  @override
  void initState() {
    super.initState();
    startConfig();
  }

  startConfig() async {
    final int year = DateTime.now().year;
    final datefilter = "$year-${month.numberOfMonth}-$day";
    final data = await DBHelperTask.retornatarefaPeloData(datefilter);

    for (var map in data) {
      Task task = Task.fromMap(map);
      setState(() {
        listTask.add(task);
      });
    }

    totalTask = listTask.length;
    taskMade = listTask.where((task) => task.concluido == 1).length;
    percent = (taskMade / totalTask);

  }

  toggleTask(Task task, bool value) async {
    setState(() {
      if (value) {
        task.concluido = 1;
        taskMade++;
      } else {
        task.concluido = 0;
        taskMade--;
      }
      percent = (taskMade / totalTask);
    });

    await DBHelperTask.atualizatarefa(task);
    // await DBHelperTask.toggleTarefa(task.id!, value);
  }

  @override
  Widget build(BuildContext context) {
    String mes = widget.month.getNameMonth();

    // int taskMade = Random().nextInt(listTask.length);

    // startConfig(); Aqui dá ruim

    return WillPopScope(

      onWillPop: () async {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
        );
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.brown[100],
        appBar: AppBar(
          toolbarHeight: 160,
          elevation: 0,
          backgroundColor: Colors.brown[100],
          title: const Header(firstPart: 'What to do', secondtPart: 'Today?'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Center(
              child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 5),
                child: Text(
                  "${widget.day} de $mes",
                  style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20, right: 30.0, left: 30.0),
                child: LinearProgressIndicator(
                  value: percent,
                  minHeight: 8,
                  borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                  color: Colors.brown,
                  backgroundColor: Colors.black54,
                ),
              ),
              Column(
                children: List.generate(listTask.length, (index) {
                  return SizedBox(
                    width: 300,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: CheckboxDay(
                          label: listTask[index].descricao,
                          isChecked: listTask[index].concluido == 1,
                          onChanged: (value) {
                            toggleTask(listTask[index], value!);
                          }),
                    ),
                  );
                }),
              )
            ],
          )),
        ),
        floatingActionButton: const CustomFloatingButtom(),
        bottomNavigationBar: BottomAppBar(
          color: Colors.brown[800],
          height: 70,
          child: Footer(),
        ),
      ),
    );
  }
}
