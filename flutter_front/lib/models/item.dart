// ignore_for_file: constant_identifier_names

class Item {
  Item({
    required this.id,
    required this.nome,
    this.qtd,
    this.description,
    this.categList,
  });

  int id;
  String nome;
  int? qtd;
  String? description;
  List<String>? categList = [];
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
