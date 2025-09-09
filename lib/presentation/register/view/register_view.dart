import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_oceantech_b34/presentation/register/controller/register_controller.dart';
import 'package:get/get.dart';

import '../../routes.dart';
import '../../widgets/text_button.dart';
import '../../widgets/text_filed_widget.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    final TextEditingController controllerPassword = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              TextFieldWidget(
                controller: controller,
                hintText: "email",
              ),
              const SizedBox(
                height: 10,
              ),
              SecurityTextFieldWidget(
                controller: controllerPassword,
                keyboardType: TextInputType.text,
                hintText: "password",
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                ),
                child: TextButtonWidget(
                  onPressed: () async {
                    await Get.find<RegisterController>().register(
                      controller.text,
                      controllerPassword.text,
                    );
                  },
                  title: "Register",
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: RichText(
                      text: TextSpan(
                    text: 'Đã có tài khoản? ',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                    children: [
                      TextSpan(
                        text: "Đăng nhập",
                        style: const TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.toNamed(RouteList.loginScreen);
                          },
                      ),
                    ],
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
