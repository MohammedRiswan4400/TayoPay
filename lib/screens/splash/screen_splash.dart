import 'package:flutter/material.dart';
import '../../controller/functions/goto_functions.dart';
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
