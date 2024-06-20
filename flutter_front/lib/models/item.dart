// ignore_for_file: constant_identifier_names

class Item {
  Item({
    required this.id,
    required this.nome,
  });

  int id;
  String nome;
  int? qtd;
  String? description;
  List<Category>? categList = [];
  bool isOpen = false;

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id'],
      nome: map['nome'],
    );
  }

  _toggleOpen() {
    isOpen = !isOpen;
  }
}

enum Category { COMIDA, HIGIENE, PERECIVEL, NAO_PERECIVEL }
