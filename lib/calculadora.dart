import 'package:flutter/material.dart';
import 'package:expressions/expressions.dart'; // Import the expressions library

class Calculadora extends StatefulWidget {
  const Calculadora({super.key});

  @override
  State<Calculadora> createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  //expression
  String _expressao = '';
  String _resultado = ''; // Added a variable to store the result

  void _pressionarBotao(String valor) {
    setState(() {
      if (valor == 'Limpar') {
        _expressao = '';
        _resultado = ''; // Clear the result when 'Limpar' is pressed
      } else if (valor == '=') {
        _calcularResultado();
      } else {
        _expressao += valor;
      }
    });
  }

  void _calcularResultado() {
    try {
      _resultado = _calcularExpressao(_expressao).toString();
    } catch (e) {
      _resultado = 'Erro';
      //forma de fazer debug segundo o professor ariangelo, talento tech 2025
      //desenvolvimento web
      //debugPrint('Erro: $e');
    }
  }

  double _calcularExpressao(String expressao) {
    expressao = expressao.replaceAll('x', '*');
    expressao = expressao.replaceAll('÷', '/');
    // Avaliar a espressao com a biblioteca expressions
    const ExpressionEvaluator avaliador = const ExpressionEvaluator();
    double resultado = avaliador.eval(Expression.parse(expressao), {});
    return resultado;
  }

  Widget _botao(String valor) {
    return TextButton(
      child: Text(
        valor,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      onPressed: () => _pressionarBotao(valor),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //expressao
        Expanded(child: Text(_expressao, style: const TextStyle(fontSize: 24))),
        //resultado
        Expanded(child: Text(_resultado, style: const TextStyle(fontSize: 24))),

        Expanded(
          flex: 3,
          child: GridView.count(
            crossAxisCount: 4,
            childAspectRatio: 2,
            children: [
              _botao('7'),
              _botao('8'),
              _botao('9'),
              _botao('÷'),
              _botao('4'),
              _botao('5'),
              _botao('6'),
              _botao('x'),
              _botao('1'),
              _botao('2'),
              _botao('3'),
              _botao('-'),
              _botao('0'),
              _botao('.'),
              _botao('='),
              _botao('+'),
            ],
          ),
        ),
        Expanded(child: _botao('Limpar')),
      ],
    );
  }
}
