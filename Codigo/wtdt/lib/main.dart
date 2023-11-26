import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wtdt/pages/LoginPage.dart';
import 'package:wtdt/pages/Homepage.dart';

void main() {
  runApp(const MainApp());
}

// ignore: must_be_immutable
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  final String title = "What to do today?";

  // ignore: unused_element
  _isAuthenticated() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('userId');
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "What to do Today",
        theme: ThemeData(
          primaryColor: Colors.transparent,
          secondaryHeaderColor: Colors.brown[200],
        ),
        home: FutureBuilder(
            future: _isAuthenticated(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator( color: Colors.brown,);
              } else if (snapshot.hasError) {
                return Text('Erro: ${snapshot.error}');
              } else {
                int? result = snapshot.data as int?;
                return result != null ? const HomePage() : const LoginPage();
              }
            }));
  }
}
