import 'package:get/get.dart';
import 'package:getx/user_model.dart';

class UserController extends GetxController {
  Rx<UserModel> user = UserModel().obs;

  void setUserName(String userName) {
    // Primeira forma
    // user.update((obj) {
    //   obj?.name = userName;
    // });

    // Segunda forma
    user.value.name = userName;
    user.refresh();
  }

  void setUserAge(int userAge) {
    user.update((obj) {
      obj?.age = userAge;
    }) ;
  }

}