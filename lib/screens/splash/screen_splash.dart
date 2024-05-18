import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tayo_pay/screens/authentication/screen_get_start/screen_get_start.dart';
import '../../controller/auth/auth_controller.dart';
import '../../core/constant/const.dart';

class ScreenSplash extends StatelessWidget {
  const ScreenSplash({super.key});

  @override
  Widget build(BuildContext context) {
    gotoMainScreen();
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(splashScreenImage, fit: BoxFit.fill),
          ),
          Center(
            child: Image.asset(
              logoTayoPay,
              scale: 4,
            ),
          ),
        ],
      ),
    );
  }
}

Future gotoScreens(context) async {
  await Future.delayed(const Duration(seconds: 3));
  Navigator.of(context).pushReplacement(
    MaterialPageRoute(
      builder: (context) {
        return const ScreenGetStart();
      },
    ),
  );
}

gotoMainScreen() async {
  Future.delayed(
    const Duration(
      seconds: 3,
    ),
  ).then(
    (value) {
      Get.put(AuthController());
    },
  );
}

gotoMainScreenWithoutDelay() async {
  Future.delayed(
    const Duration(
      seconds: 2,
    ),
  ).then(
    (value) {
      Get.offAll(const ScreenGetStart());
    },
  );
}
