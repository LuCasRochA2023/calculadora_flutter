import 'package:flutter/material.dart';

import 'regras_negocio.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController controlador = TextEditingController();
  String? operacao;
  double? valor1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(Colors.white),
            foregroundColor: WidgetStateProperty.all(Colors.black),
            padding: WidgetStateProperty.all(EdgeInsets.symmetric(horizontal: 16, vertical: 12)),
            textStyle: WidgetStateProperty.all(TextStyle(fontSize: 12)),
          ),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Calculadora"),
          backgroundColor: Colors.grey,
        ),
        body: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => adicionarTexto(controlador, "1"),
                    child: Text("1"),
                  ),
                  ElevatedButton(
                    onPressed: () => adicionarTexto(controlador, "2"),
                    child: Text("2"),
                  ),
                  ElevatedButton(
                    onPressed: () => adicionarTexto(controlador, "3"),
                    child: Text("3"),
                  ),
                  ElevatedButton(
                    onPressed: () => definirOperacao(controlador, '+', setState, (op) => operacao = op, (val) => valor1 = val),
                    child: Text("+"),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => adicionarTexto(controlador, "4"),
                    child: Text("4"),
                  ),
                  ElevatedButton(
                    onPressed: () => adicionarTexto(controlador, "5"),
                    child: Text("5"),
                  ),
                  ElevatedButton(
                    onPressed: () => adicionarTexto(controlador, "6"),
                    child: Text("6"),
                  ),
                  ElevatedButton(
                    onPressed: () => definirOperacao(controlador, '-', setState, (op) => operacao = op, (val) => valor1 = val),
                    child: Text("-"),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => adicionarTexto(controlador, "7"),
                    child: Text("7"),
                  ),
                  ElevatedButton(
                    onPressed: () => adicionarTexto(controlador, "8"),
                    child: Text("8"),
                  ),
                  ElevatedButton(
                    onPressed: () => adicionarTexto(controlador, "9"),
                    child: Text("9"),
                  ),
                  ElevatedButton(
                    onPressed: () => definirOperacao(controlador, '*', setState, (op) => operacao = op, (val) => valor1 = val),
                    child: Text("X"),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => deletar(controlador),
                    child: Text("DEL"),
                  ),
                  ElevatedButton(
                    onPressed: () => adicionarTexto(controlador, "0"),
                    child: Text("0"),
                  ),
                  ElevatedButton(
                    onPressed: () => calcularResultado(controlador, operacao, valor1, setState),
                    child: Text("="),
                  ),
                  ElevatedButton(
                    onPressed: () => definirOperacao(controlador, '/', setState, (op) => operacao = op, (val) => valor1 = val),
                    child: Text("/"),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              TextField(
                readOnly: true,
                controller: controlador,
                style: TextStyle(fontSize: 32),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.black12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
