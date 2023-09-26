import 'package:flutter/material.dart';
import 'package:wtdt/components/CustomButtom.dart';
import 'package:wtdt/components/CustomInputForm.dart';
import 'package:wtdt/components/CustomText.dart';
import 'package:wtdt/pages/Homepage.dart';

class LoginPage extends StatelessWidget{

  const LoginPage({super.key});

  @override
  Widget build(BuildContext context){

    return Scaffold(
      backgroundColor: Colors.brown[100],
      body:  Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        
        children: [
          
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(72.0, 0.0 ,0.0, 8.0),
                child: CustomText(textLabel: "E-mail", size: 20)
              ),
            ]
          ),
          
          const Padding(
            padding: EdgeInsets.fromLTRB(64.0, 0.0, 64.0, 32.0),
            child: CustomInputForm(primaryColor: Colors.black, secondaryColor: Colors.grey)
          ),

          const Row(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(72.0, 0.0 ,0.0, 8.0),
                child: CustomText(textLabel: "Senha", size: 20),
              ),
            ],
          ),

          const Padding(
            padding: EdgeInsets.fromLTRB(64.0, 0.0, 64.0, 32.0),
            child: CustomInputForm(primaryColor: Colors.black, secondaryColor: Colors.grey)
          ),

          CustomButtom(textLabel: 'Entrar', primaryColor: Colors.brown, onPressed: () {
            Navigator.push(context, MaterialPageRoute(
            builder: (context) {
            return const HomePage();
          }
        ));
          },)
          
        ],
      ),
    );

  }

}

