import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';

class LoginController extends GetxController {
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();
  RxBool valid = false.obs;

  void isValid() {
    valid.value = userName.text.length > 2 &&
        userName.text.length < 12 &&
        password.text.length > 2 &&
        password.text.length < 12;
  }
}
