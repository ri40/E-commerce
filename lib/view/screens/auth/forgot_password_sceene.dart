import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myproject/logic/controllers/auth_controller.dart';
import 'package:myproject/view/widgets/auth/auth_button.dart';
import 'package:myproject/view/widgets/auth/auth_text_from_field.dart';
import '../../../utils/my_string.dart';
import '../../../utils/theme.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({Key? key}) : super(key: key);

  final fromKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white,
          centerTitle: true,
          elevation: 0,
          title: Text(
            'Forget Password',
            style: TextStyle(
              color: Get.isDarkMode ? pinkColor : mainColor,
            ),
          ),
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Get.isDarkMode ? Colors.white : Colors.black,
            ),
          ),
        ),
        body: Form(
          key: fromKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(Icons.close_rounded),
                      color:Get.isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'If you want to recover yuor account, then plasse provide your emil ID blelow..',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Image.asset(
                    'assets/images/forgetpass copy.png',
                    width: 250,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  AuthTextFromField(
                    controller: emailController,
                    obscureText: false,
                    validator: (value) {
                      if (!RegExp(validationEmail).hasMatch(value)) {
                        return 'Invalid email';
                      } else {
                        return null;
                      }
                    },
                    prefixIcon: Get.isDarkMode
                        ? const Icon(
                            Icons.email,
                            color: pinkColor,
                            size: 30,
                          )
                        : Image.asset('assets/images/email.png'),
                    suffixIcon: const Text(""),
                    hintText: 'Email',
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  GetBuilder<AuthController>(builder: (_) {
                    return AuthButton(
                      text: 'SEND',
                      onPressed: () {
                        if (fromKey.currentState!.validate()) {
                          controller.resetPassword(emailController.text.trim());
                        }
                      },
                    );
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
