import 'package:flutter/material.dart';
import 'calculator.dart';
import 'result_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormState>();

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

  Widget _buildInvestmentSection({
    required String title,
    required TextEditingController capitalController,
    required TextEditingController monthlyController,
    required TextEditingController rateController,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 3,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: capitalController,
              decoration: InputDecoration(labelText: 'Capital Inicial (R\$)'),
              keyboardType: TextInputType.number,
              validator: (value) =>
                  value!.isEmpty ? 'Informe o capital inicial' : null,
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: monthlyController,
              decoration: InputDecoration(labelText: 'Aplicação Mensal (R\$)'),
              keyboardType: TextInputType.number,
              validator: (value) =>
                  value!.isEmpty ? 'Informe a aplicação mensal' : null,
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: rateController,
              decoration: InputDecoration(labelText: 'Taxa de Juros Mensal (%)'),
              keyboardType: TextInputType.number,
              validator: (value) =>
                  value!.isEmpty ? 'Informe a taxa de juros' : null,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simulador de Investimentos'),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildInvestmentSection(
                  title: 'Investimento 1',
                  capitalController: _capital1Controller,
                  monthlyController: _monthly1Controller,
                  rateController: _rate1Controller,
                ),
                Divider(),
                _buildInvestmentSection(
                  title: 'Investimento 2',
                  capitalController: _capital2Controller,
                  monthlyController: _monthly2Controller,
                  rateController: _rate2Controller,
                ),
                Divider(),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 3,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextFormField(
                      controller: _monthsController,
                      decoration: InputDecoration(labelText: 'Período (meses)'),
                      keyboardType: TextInputType.number,
                      validator: (value) =>
                          value!.isEmpty ? 'Informe o período' : null,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _calculateInvestments,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    backgroundColor: Colors.blueAccent,
                  ),
                  child: Text(
                    'Calcular',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
