import 'package:amazon_cognito_identity_dart_2/cognito.dart';

class AwsService{

  final String clientID = '';
  final String poolID = '';
  
  CognitoUserPool retornaPool(){
    return CognitoUserPool(poolID, clientID);
  }

  adicionaPoolUsuario(String username, String senha, String email) async {

    final userPool = retornaPool();

    var data;

    final userAttributes = [
      AttributeArg(name: 'email', value: email)
    ];

    try{

      data = await userPool.signUp(
        username, 
        senha, 
        userAttributes: userAttributes
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