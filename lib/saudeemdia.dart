import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Contador de Água',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const WaterCounterPage(),
    );
  }
}

class WaterCounterPage extends StatefulWidget {
  const WaterCounterPage({super.key});

  @override
  _WaterCounterPageState createState() => _WaterCounterPageState();
}

class _WaterCounterPageState extends State<WaterCounterPage> {
  int _glassesCount = 0;
  final int _target = 8;

  void _addGlassOfWater() {
    setState(() {
      if (_glassesCount < _target) {
        _glassesCount++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double progress = _glassesCount / _target;
    if (progress > 1.0) progress = 1.0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Contador de Água'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Copos de Água Bebidos',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 150,
              width: 150,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  CircularProgressIndicator(
                    value: progress,
                    strokeWidth: 10,
                    backgroundColor: Colors.blue.shade100,
                    valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
                  ),
                  Center(
                    child: Text(
                      '$_glassesCount / $_target',
                      style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton.icon(
              onPressed: _addGlassOfWater,
              icon: const Icon(Icons.local_drink),
              label: const Text(
                'Adicionar Copo',
                style: TextStyle(fontSize: 18),
              ),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}