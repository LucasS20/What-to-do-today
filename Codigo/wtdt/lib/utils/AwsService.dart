import 'package:amazon_cognito_identity_dart_2/cognito.dart';

class AwsService{

  final String clientID = '';
  final String poolID = '';
  
  CognitoUserPool retornaPool(){
    return CognitoUserPool(poolID, clientID);
  }

  adicionaPoolUsuario(String email, String senha) async {

    final userPool = retornaPool();

    var data;

    try{

      data = await userPool.signUp(
        email, 
        senha, 
        userAttributes: List.empty()
        );
    }catch(e){
      print(e);
    }
  }

  autenticaUsuario(String email, String codigo) async {

    final userPool = retornaPool();

    final cognitoUser = CognitoUser(email, userPool);

    bool registrado = false;

    try{
      registrado = await cognitoUser.confirmRegistration(codigo);
    }catch(e){
      print(e);
    }

  }

}