import 'package:get/get.dart';

class ValueController extends GetxController {
  RxString definedValue = ''.obs;//variável observável.

  RxBool isLoading = false.obs;

  //criar uma função para apenas chamar o widget que precisamos
  Future<void> setValue(String newValue) async {
    isLoading.value = true;

    await Future.delayed(const Duration(seconds: 2));//Foi criado um delay para acompanhar o andamento da construção

    definedValue.value = newValue;

    isLoading.value = false;
  }
}