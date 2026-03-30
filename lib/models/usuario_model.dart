class Usuario {
  final int? id; // Pode ser nulo antes de salvar no banco
  final String nome;
  final String email;

  Usuario({this.id, required this.nome, required this.email});

  // Converte o JSON que vem do Node.js para um Objeto Dart
  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(id: json['id'], nome: json['nome'], email: json['email']);
  }

  // Converte o Objeto Dart para JSON antes de enviar para o Node.js
  Map<String, dynamic> toJson() {
    return {'nome': nome, 'email': email};
  }
}
