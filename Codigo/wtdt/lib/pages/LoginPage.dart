// ignore_for_file: no_leading_underscores_for_local_identifiers, file_names, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wtdt/components/CustomButtom.dart';
import 'package:wtdt/components/CustomInputForm.dart';
import 'package:wtdt/components/CustomDialog.dart';
import 'package:wtdt/components/CustomText.dart';
import 'package:wtdt/components/Header.dart';
import 'package:wtdt/db/DBHelperUser.dart';
import 'package:wtdt/main.dart';
import 'package:wtdt/pages/Homepage.dart';
import 'package:wtdt/pages/SignUpPage.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();

    Future<bool> validaLogin() async {
      final String email = _emailController.text;
      final String senha = _passwordController.text;
      
      if (email == "" || senha == "") {
        return true;
      } else {

        final prefs = await SharedPreferences.getInstance();
        bool authenticated = await DBHelperUser.realizaLogin(email, senha);
        prefs.setBool('authenticated', authenticated);
        return authenticated;

      }
    }

    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
          toolbarHeight: 160,
          elevation: 0,
          backgroundColor: Colors.brown[100],
          title: const Header(firstPart: 'What to do', secondtPart: 'Today?'),
          centerTitle: true,
        ),
      body: Padding(
        padding: const EdgeInsets.only(top: 60),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
                textLabel: 'Entrar',
                primaryColor: Colors.brown,
                onPressed: () async {
                  bool valido = await validaLogin();
                  if (valido) {
                    navigateToHomePage(context);
                  } else {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const CustomDialog(title: "Usuário inválido", body: "Favor Verificar",);
                      },
                    );
                  }
                },
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return SignUpPage();
                      }));
                    },
                    child: const Text(
                      "Criar conta",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.brown,
                          decoration: TextDecoration.underline),
                    )),
              )
            ],
          ),
        ),
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
    );

    
  }
  
}

void navigateToLoginPage(BuildContext context) {
  Navigator.popUntil(context, (route) => route.isFirst);
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => const MainApp()),
  );
}