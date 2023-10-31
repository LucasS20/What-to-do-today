class User{

  final int? id;
  final String email;
  final String senha;
  final String nome;

  const User ({
    this.id,
    required this.nome,
    required this.email,
    required this.senha,
  });

}