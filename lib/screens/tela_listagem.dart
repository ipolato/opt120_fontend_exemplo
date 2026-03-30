import 'package:flutter/material.dart';
import '../models/usuario_model.dart';
import '../services/api_service.dart';

class TelaListagem extends StatefulWidget {
  const TelaListagem({super.key});

  @override
  State<TelaListagem> createState() => _TelaListagemState();
}

class _TelaListagemState extends State<TelaListagem> {
  final ApiService _apiService = ApiService();
  late Future<List<Usuario>> _futureUsuarios;

  @override
  void initState() {
    super.initState();
    // Inicia a requisição GET assim que a tela é aberta
    _futureUsuarios = _apiService.getUsuarios();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Usuários Cadastrados'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      // O FutureBuilder constrói a tela baseado no estado da requisição HTTP
      body: FutureBuilder<List<Usuario>>(
        future: _futureUsuarios,
        builder: (context, snapshot) {
          // Estado 1: Carregando
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          // Estado 2: Ocorreu um erro (ex: backend desligado)
          else if (snapshot.hasError) {
            return Center(
              child: Text(
                'Erro ao buscar usuários.\nVerifique se o servidor Node.js está rodando.',
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.red, fontSize: 16),
              ),
            );
          }
          // Estado 3: Sem dados (Lista vazia)
          else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text(
                'Nenhum usuário cadastrado ainda.',
                style: TextStyle(fontSize: 18),
              ),
            );
          }
          // Estado 4: Dados recebidos com sucesso!
          else {
            final usuarios = snapshot.data!;
            return ListView.builder(
              itemCount: usuarios.length,
              itemBuilder: (context, index) {
                final usuario = usuarios[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: Text(
                        usuario.id.toString(),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    title: Text(
                      usuario.nome,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(usuario.email),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
