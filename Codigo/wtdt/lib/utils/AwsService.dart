import 'package:amazon_cognito_identity_dart_2/cognito.dart';

class AwsService{

  final String clientID = '1r8evd0606rlnsd4bp4aikrflq';
  final String poolID = 'us-east-2_qGsqWVEeg';
  
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

      //enviaEmailUsuario(email);

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

  enviaEmailUsuario(String email) async{

    final userPool = retornaPool();

    final cognitoUser = CognitoUser(email, userPool);
    
    final String status;
    
    try {
      status = await cognitoUser.resendConfirmationCode();
    } catch (e) {
      print(e);
    }
  }

  confirmaLoginUsuario(String email, String senha) async {

    final userPool = retornaPool();

    final cognitoUser = CognitoUser(email, userPool);
    final authDetails = AuthenticationDetails(
      username: email,
      password: senha,
    );

    CognitoUserSession? session;
    
    try {
      session = await cognitoUser.authenticateUser(authDetails);
    } on CognitoUserNewPasswordRequiredException catch (e) {
      print(e);
    } on CognitoUserMfaRequiredException catch (e) {
      print(e);
    } on CognitoUserSelectMfaTypeException catch (e) {
      print(e);
    } on CognitoUserMfaSetupException catch (e) {
      print(e);
    } on CognitoUserTotpRequiredException catch (e) {
      print(e);
    } on CognitoUserCustomChallengeException catch (e) {
      print(e);
    } on CognitoUserConfirmationNecessaryException catch (e) {
      print(e);
    } on CognitoClientException catch (e) {
      print(e);
    }catch (e) {
      print(e);
    }
    
    print(session?.getAccessToken().getJwtToken());

  }

}