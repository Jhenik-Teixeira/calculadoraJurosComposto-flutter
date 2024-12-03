import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'home_screen.dart'; // Certifique-se de criar/importar esta classe.

void main() => runApp(
      DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => InvestmentSimulatorApp(), // Corrigido o nome da classe.
      ),
    );

class InvestmentSimulatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Simulador de Investimentos',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(), // Certifique-se de implementar HomeScreen.
    );
  }
}

