import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/user_controller.dart';
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

  final nameController = TextEditingController();
  final ageController = TextEditingController();

  TextStyle commonStyle() => const TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w500,
      );

  final userController = UserController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //Apresentação do nome
            Obx(
              () => Text(
                'Nome: ${userController.user.value.name}',
                style: commonStyle(),
              ),
            ),
            //Apresentação da idade
            Obx(
              () => Text(
                'Idade: ${userController.user.value.age}',
                style: commonStyle(),
              ),
            ),

            const Divider(
              thickness: 1.5,
              color: Colors.blue,
              height: 20,
            ),

            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                //Campo de nome
                Expanded(
                  child: TextField(
                    controller: nameController,
                    decoration: const InputDecoration(),
                  ),
                ),
                //Botão para salvar o nome
                ElevatedButton(
                  onPressed: () {
                    userController.setUserName(nameController.text);
                  },
                  child: const Text('Salvar'),
                ),
              ],
            ),

            //Espaçamento
            const SizedBox(
              height: 10,
            ),

            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                //Campo de idade
                Expanded(
                  child: TextField(
                    controller: ageController,
                    decoration: const InputDecoration(),
                  ),
                ),
                //Botão para salvar a idade
                ElevatedButton(
                  onPressed: () {
                    userController.setUserAge(int.parse(
                        ageController.text)); //converte o texto em inteiro
                  },
                  child: const Text('Salvar'),
                ),
              ],
            ),

            //Espaçamento
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
