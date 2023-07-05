import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Get X',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final textController = TextEditingController();

  String definedValue = '';

  @override
  Widget build(BuildContext context) {
    print('construiu');
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Valor
            Text('Valor definido: $definedValue'),

            //Campo
            TextField(
              controller: textController,
            ),

            //Botão
            ElevatedButton(
              onPressed: () {
                String value = textController.text;

                setState(() {
                  //Problema do SetState é que carrega toda a página quando acionado e isso faz com que se perca performance
                  definedValue = value;
                });
              },
              child: const Text('Confirmar'),
            ),
          ],
        ),
      ),
    );
  }
}
