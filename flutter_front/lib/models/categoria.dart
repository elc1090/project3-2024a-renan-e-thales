class Categoria {
  Categoria({
    required this.id,
    required this.nome,
  });

  String nome;
  int id;

  factory Categoria.fromMap(Map<String, dynamic> map, int id) {
    return Categoria(
      id: id,
      nome: map['name'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': nome,
    };
  }
}
