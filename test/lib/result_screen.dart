import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final List<double> investment1;
  final List<double> investment2;

  const ResultScreen({
    required this.investment1,
    required this.investment2,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Resultados')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Comparação de Investimentos',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: investment1.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Mês ${index + 1}'),
                    subtitle: Text(
                        'Investimento 1: R\$${investment1[index].toStringAsFixed(2)} | '
                        'Investimento 2: R\$${investment2[index].toStringAsFixed(2)}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
