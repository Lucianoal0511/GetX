import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/user_controller.dart';
import 'package:getx/value_controller.dart';

void main() {
  // Get.put<UserController>(UserController());//Injeção de dependência diretamente na memória

  //Essa injeção de dependência só acontece quando requisitada
  Get.lazyPut<UserController>(() => UserController());

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

  final userController = Get.find<UserController>(); //instanciou o objeto
  //outra forma de instanciar
  // final UserController userController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                //Campo de nome
                Expanded(
                  child: TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      labelText: 'Nome',
                    ),
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
                    decoration: const InputDecoration(
                      labelText: 'Idade',
                    ),
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

            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return DataScreen(
                        // controller: userController,
                        );
                  },
                ));
              },
              child: const Text('Tela de dados'),
            ),
          ],
        ),
      ),
    );
  }
}

class DataScreen extends GetView<UserController> {
  DataScreen({
    super.key,
  });

  // final UserController controller = Get.find();

  TextStyle commonStyle() => const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dados'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Obx(() => Text(
                  'Nome: ${controller.user.value.name}',
                  style: commonStyle(),
                )),
            Obx(() => Text(
                  'Idade: ${controller.user.value.age}',
                  style: commonStyle(),
                )),
          ],
        ),
      ),
    );
  }
}
