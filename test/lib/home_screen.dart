import 'package:flutter/material.dart';
import '../utils/calculator.dart';
import 'result_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormState>();

  // Controladores de texto
  final TextEditingController _capital1Controller = TextEditingController();
  final TextEditingController _monthly1Controller = TextEditingController();
  final TextEditingController _rate1Controller = TextEditingController();

  final TextEditingController _capital2Controller = TextEditingController();
  final TextEditingController _monthly2Controller = TextEditingController();
  final TextEditingController _rate2Controller = TextEditingController();

  final TextEditingController _monthsController = TextEditingController();

  void _calculateInvestments() {
    if (_formKey.currentState!.validate()) {
      final capital1 = double.parse(_capital1Controller.text);
      final monthly1 = double.parse(_monthly1Controller.text);
      final rate1 = double.parse(_rate1Controller.text) / 100;

      final capital2 = double.parse(_capital2Controller.text);
      final monthly2 = double.parse(_monthly2Controller.text);
      final rate2 = double.parse(_rate2Controller.text) / 100;

      final months = int.parse(_monthsController.text);

      final investment1 = calculateCompoundInterest(capital1, monthly1, rate1, months);
      final investment2 = calculateCompoundInterest(capital2, monthly2, rate2, months);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(
            investment1: investment1,
            investment2: investment2,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Simulador de Investimentos')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Investimento 1',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                TextFormField(
                  controller: _capital1Controller,
                  decoration: InputDecoration(labelText: 'Capital Inicial (R\$)'),
                  keyboardType: TextInputType.number,
                  validator: (value) =>
                      value!.isEmpty ? 'Informe o capital inicial' : null,
                ),
                TextFormField(
                  controller: _monthly1Controller,
                  decoration: InputDecoration(labelText: 'Aplicação Mensal (R\$)'),
                  keyboardType: TextInputType.number,
                  validator: (value) =>
                      value!.isEmpty ? 'Informe a aplicação mensal' : null,
                ),
                TextFormField(
                  controller: _rate1Controller,
                  decoration: InputDecoration(labelText: 'Taxa de Juros Mensal (%)'),
                  keyboardType: TextInputType.number,
                  validator: (value) =>
                      value!.isEmpty ? 'Informe a taxa de juros' : null,
                ),
                SizedBox(height: 20),
                Text(
                  'Investimento 2',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                TextFormField(
                  controller: _capital2Controller,
                  decoration: InputDecoration(labelText: 'Capital Inicial (R\$)'),
                  keyboardType: TextInputType.number,
                  validator: (value) =>
                      value!.isEmpty ? 'Informe o capital inicial' : null,
                ),
                TextFormField(
                  controller: _monthly2Controller,
                  decoration: InputDecoration(labelText: 'Aplicação Mensal (R\$)'),
                  keyboardType: TextInputType.number,
                  validator: (value) =>
                      value!.isEmpty ? 'Informe a aplicação mensal' : null,
                ),
                TextFormField(
                  controller: _rate2Controller,
                  decoration: InputDecoration(labelText: 'Taxa de Juros Mensal (%)'),
                  keyboardType: TextInputType.number,
                  validator: (value) =>
                      value!.isEmpty ? 'Informe a taxa de juros' : null,
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _monthsController,
                  decoration: InputDecoration(labelText: 'Período (meses)'),
                  keyboardType: TextInputType.number,
                  validator: (value) =>
                      value!.isEmpty ? 'Informe o período' : null,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _calculateInvestments,
                  child: Text('Calcular'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
