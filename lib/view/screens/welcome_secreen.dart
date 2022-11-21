import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../routes/routes.dart';
import '../../utils/theme.dart';
import '../widgets/text_utils.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(
                'assets/images/background.png',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              color: Colors.black.withOpacity(0.2),
              width: double.infinity,
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Container(
                    height: 60,
                    width: 190,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: TextUtils(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        txet: 'welcome',
                        color: Colors.white,
                        underline: TextDecoration.none,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 60,
                    width: 230,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextUtils(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            txet: 'Asroo',
                            color: mainColor,
                            underline: TextDecoration.none,
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          TextUtils(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            txet: 'SHOP',
                            color: Colors.white,
                            underline: TextDecoration.none,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 250,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: mainColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 12,
                        )),
                    onPressed: () {
                      Get.offNamed(Routes.loginScreen);
                    },
                    child: TextUtils(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      txet: 'Get Start',
                      color: Colors.white,
                      underline: TextDecoration.none,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextUtils(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        txet: "Don't have an Account?",
                        color: Colors.white,
                        underline: TextDecoration.none,
                      ),
                      TextButton(
                        onPressed: () {
                          Get.offNamed(Routes.signUpScreen);                        },
                        child: TextUtils(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          txet: 'Sigun Up ',
                          color: Colors.white,
                          underline: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
