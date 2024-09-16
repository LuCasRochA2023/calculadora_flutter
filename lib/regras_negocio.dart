
import 'package:flutter/material.dart';

void adicionarTexto(TextEditingController controlador, String texto) {
  controlador.text += texto;
}

void deletar(TextEditingController controlador) {
  if (controlador.text.isNotEmpty) {
    controlador.text = controlador.text.substring(0, controlador.text.length - 1);
  }
}

void definirOperacao(TextEditingController controlador, String operacao, StateSetter setState,
    ValueSetter<String?> operacaoSetter, ValueSetter<double?> valor1Setter) {
  setState(() {
    operacaoSetter(operacao);
    valor1Setter(double.tryParse(controlador.text));
    controlador.text = '';
  });
}

void calcularResultado(TextEditingController controlador, String? operacao, double? valor1, StateSetter setState) {
  double? valor2 = double.tryParse(controlador.text);
  if (valor1 != null && valor2 != null && operacao != null) {
    double resultado = 0;
    switch (operacao) {
      case '+':
        resultado = valor1 + valor2;
        break;
      case '-':
        resultado = valor1 - valor2;
        break;
      case '*':
        resultado = valor1 * valor2;
        break;
      case '/':
        resultado = valor1 / valor2;
        break;
    }
    controlador.text = resultado.toString();
    operacao = null;
    valor1 = null;
  }
}
