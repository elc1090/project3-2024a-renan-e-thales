class User {
  User({this.id, this.email, this.nome});

  String? id;
  String? email;
  String? nome;

  factory User.fromMap(Map<String, dynamic> map, String id) {
    return User(
      id: id,
      email: map['email'],
      nome: map['name'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'nome': nome,
    };
  }
}
