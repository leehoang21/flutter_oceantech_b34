import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../routes.dart';
import '../../widgets/text_button.dart';
import '../../widgets/text_filed_widget.dart';
import '../bloc/register_cubit.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    final TextEditingController controllerPassword = TextEditingController();
    final TextEditingController controllerAddress = TextEditingController();

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
              TextFieldWidget(
                controller: controllerAddress,
                hintText: "address",
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
                    await context.read<RegisterCubit>().register(
                          controller.text,
                          controllerPassword.text,
                          controllerAddress.text,
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
                            Navigator.of(context)
                                .pushNamed(RouteList.loginScreen);
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
