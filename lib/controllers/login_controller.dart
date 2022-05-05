import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  readData() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool("Is User Exists") ?? false;
  }

  saveData() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setBool("Is User Exists", true);
  }
}
