import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/usuario_model.dart';

class ApiService {
  // URL base do nosso backend Node.js
  // static const String baseUrl = 'http://localhost:3000/usuarios';
  static const String baseUrl = 'http://127.0.0.1:3000/usuarios';

  // Faz o GET e retorna uma lista de objetos Usuario
  Future<List<Usuario>> getUsuarios() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      return body.map((json) => Usuario.fromJson(json)).toList();
    } else {
      throw Exception('Falha ao carregar usuários');
    }
  }

  // Faz o POST enviando um objeto Usuario
  Future<Usuario> criarUsuario(Usuario usuario) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(usuario.toJson()),
    );

    if (response.statusCode == 201) {
      return Usuario.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Falha ao criar usuário');
    }
  }
}
