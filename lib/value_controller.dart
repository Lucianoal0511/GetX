import 'package:get/get.dart';

class ValueController extends GetxController {
  String definedValue = '';

  bool isLoading = false;

  //criar uma função para apenas chamar o widget que precisamos
  Future<void> setValue(String value) async {
    isLoading = true;
    update();

    await Future.delayed(const Duration(seconds: 2));//Foi criado um delay para acompanhar o andamento da construção

    definedValue = value;

    isLoading = false;
    update();//Aqui que atualiza.
  }
}