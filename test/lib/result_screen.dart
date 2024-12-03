import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final List<double> investment1;
  final List<double> investment2;

  const ResultScreen({
    required this.investment1,
    required this.investment2,
  });

  Widget _buildInvestmentTab({
    required String title,
    required List<double> investmentData,
    required Color color,
    required IconData icon,
  }) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: color, size: 28),
              SizedBox(width: 10),
              Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView.separated(
              itemCount: investmentData.length,
              separatorBuilder: (context, index) => Divider(),
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: color.withOpacity(0.2),
                    child: Text(
                      (index + 1).toString(),
                      style: TextStyle(color: color),
                    ),
                  ),
                  title: Text('Mês ${index + 1}'),
                  subtitle: Text(
                    'Valor acumulado: R\$${investmentData[index].toStringAsFixed(2)}',
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Resultados'),
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(
                icon: Icon(Icons.trending_up, color: Colors.greenAccent),
                text: 'Investimento 1',
              ),
              Tab(
                icon: Icon(Icons.trending_up, color: Colors.blueAccent),
                text: 'Investimento 2',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildInvestmentTab(
              title: 'Relatório: Investimento 1',
              investmentData: investment1,
              color: Colors.greenAccent,
              icon: Icons.attach_money,
            ),
            _buildInvestmentTab(
              title: 'Relatório: Investimento 2',
              investmentData: investment2,
              color: Colors.blueAccent,
              icon: Icons.money_off,
            ),
          ],
        ),
      ),
    );
  }
}
