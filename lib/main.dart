import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/value_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Get X',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final textController = TextEditingController();

  final valueController = ValueController();

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
            GetX<ValueController>(
                init: valueController,
                builder: (controller) {
                  print('Construiu GetX');
                  return Text('Valor definido: ${controller.definedValue}');
                }),

            //Campo
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32.0),
              child: TextField(
                controller: textController,
              ),
            ),

            //Botão
            GetX<ValueController>(
                init: valueController,
                builder: (ctrl) {
                  return ctrl.isLoading.value
                      ? const CircularProgressIndicator()
                      : ElevatedButton(
                          onPressed: () {
                            String value = textController.text;

                            valueController.setValue(value);
                          },
                          child: const Text('Confirmar'),
                        );
                }),
          ],
        ),
      ),
    );
  }
}
