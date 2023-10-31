// ignore_for_file: file_names

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:wtdt/components/CustomButtom.dart';
import 'package:wtdt/components/CustomInputForm.dart';
import 'package:wtdt/components/CustomText.dart';
import 'package:wtdt/components/Header.dart';
import 'package:wtdt/db/DBHelperUser.dart';
import 'package:wtdt/main.dart';
import 'package:wtdt/models/User.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  saveUser() async {
    final String name = _nameController.text;
    final String email = _emailController.text;
    final String password = _passwordController.text;

    final User newUser = User(
      nome: name,
      email: email,
      senha: password
    );
    
    int id = await DBHelperUser.adicionarUsuario(newUser);
    print(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        toolbarHeight: 160,
        elevation: 0,
        backgroundColor: Colors.brown[100],
        title: const Header(firstPart: 'Criar', secondtPart: 'Conta'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Row(children: [
              Padding(
                  padding: EdgeInsets.fromLTRB(72.0, 0.0, 0.0, 8.0),
                  child: CustomText(textLabel: "User", size: 20)),
            ]),
            Padding(
                padding: const EdgeInsets.fromLTRB(64.0, 0.0, 64.0, 32.0),
                child: CustomInputForm(
                  primaryColor: Colors.black,
                  secondaryColor: Colors.grey,
                  controller: _nameController,
                )),
            const Row(children: [
              Padding(
                  padding: EdgeInsets.fromLTRB(72.0, 0.0, 0.0, 8.0),
                  child: CustomText(textLabel: "E-mail", size: 20)),
            ]),
            Padding(
                padding: const EdgeInsets.fromLTRB(64.0, 0.0, 64.0, 32.0),
                child: CustomInputForm(
                  primaryColor: Colors.black,
                  secondaryColor: Colors.grey,
                  controller: _emailController,
                )),
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(72.0, 0.0, 0.0, 8.0),
                  child: CustomText(textLabel: "Senha", size: 20),
                ),
              ],
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(64.0, 0.0, 64.0, 32.0),
                child: CustomInputForm(
                  primaryColor: Colors.black,
                  secondaryColor: Colors.grey,
                  controller: _passwordController,
                )),
            CustomButtom(
              textLabel: 'Criar',
              primaryColor: Colors.brown,
              onPressed: () {
                saveUser();
      
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const MainApp();
                }));
              },
            )
          ],
        ),
      ),
    );
  }
}
