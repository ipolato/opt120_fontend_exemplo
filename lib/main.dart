import 'package:flutter/material.dart';
import 'screens/tela_principal.dart';

void main() {
  runApp(const AppTeste());
}

class AppTeste extends StatelessWidget {
  const AppTeste({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App de Usuários',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      // Aponta para a tela principal que ficará na pasta screens
      home: const TelaPrincipal(),
    );
  }
}
