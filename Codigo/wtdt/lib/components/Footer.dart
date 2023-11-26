// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:wtdt/pages/LoginPage.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const SizedBox(
          width: 30,
        ),
        PopupMenuButton<String>(
          onSelected: (value) {
            if (value == 'logout') {
              navigateToLoginPage(context);
            }
          },
          itemBuilder: (BuildContext context) {
            return [
              const PopupMenuItem<String>(
                value: 'logout',
                child: ListTile(
                  leading: Icon(Icons.exit_to_app),
                  title: Text('Logout'),
                ),
              ),
            ];
          },
          offset: const Offset(0, -100), 
          child: const Icon(Icons.free_breakfast, color: Colors.white, size: 35),
        ),
      ],
    );
  }
}

