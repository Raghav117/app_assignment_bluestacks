import 'package:app_assignment_bluestacks/controllers/login_controller.dart';
import 'package:app_assignment_bluestacks/modals/global_variables.dart';
import 'package:app_assignment_bluestacks/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreeen extends StatefulWidget {
  const LoginScreeen({Key? key}) : super(key: key);

  @override
  State<LoginScreeen> createState() => _LoginScreeenState();
}

class _LoginScreeenState extends State<LoginScreeen> {
  final LoginController _loginController = Get.put(LoginController());

  @override
  void initState() {
    super.initState();
    getUser();
  }

  getUser() async {
    bool userExists = await _loginController.readData();
    if (userExists == true) {
      Get.to(const HomeScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: [
          Row(
            children: [
              InkWell(
                child: const Icon(Icons.menu),
                onTap: () {
                  Get.defaultDialog(
                      title: "language".tr,
                      middleText: "",
                      actions: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("japan".tr),
                            Checkbox(
                                value: japan,
                                onChanged: (v) {
                                  japan = !japan;
                                  Locale locale;
                                  if (japan == true) {
                                    locale = const Locale('ja', 'JP');
                                  } else {
                                    locale = const Locale('en', 'US');
                                  }
                                  Get.updateLocale(locale);
                                  Navigator.pop(context);
                                }),
                          ],
                        )
                      ]);
                },
              ),
              const Spacer(),
              Text(
                "login".tr,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const Spacer(),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Image.asset(
            "assets/game.tv-logo.png",
            color: Colors.blue,
          ),
          const SizedBox(
            height: 20,
          ),
          textField("name".tr, _loginController.userName),
          const SizedBox(
            height: 20,
          ),
          textField("password".tr, _loginController.password,
              hidePassword: true),
          const SizedBox(
            height: 20,
          ),
          Obx(() {
            return _loginController.valid.value == false
                ? const SizedBox()
                : InkWell(
                    onTap: () {
                      if ((_loginController.userName.text == "9898989898" &&
                              _loginController.password.text ==
                                  "password123") ||
                          (_loginController.userName.text == "9876543210" &&
                              _loginController.password.text ==
                                  "password123")) {
                        _loginController.saveData();
                        Get.to(const HomeScreen());
                      } else {
                        Get.snackbar("user_not_valid".tr, "");
                      }
                    },
                    child: Card(
                      color: Colors.blue,
                      elevation: 10,
                      shadowColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "submit".tr,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ));
          }),
        ],
      )),
    );
  }

  Card textField(String tilte, TextEditingController controller,
      {bool hidePassword = false}) {
    return Card(
      elevation: 10,
      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      shadowColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: controller,
          onChanged: (value) {
            _loginController.isValid();
          },
          obscureText: hidePassword,
          decoration: InputDecoration(
              border: InputBorder.none, hintText: tilte, counterText: tilte),
        ),
      ),
    );
  }
}
