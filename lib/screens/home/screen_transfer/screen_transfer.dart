import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tayo_pay/core/colors/colors.dart';

class ScreenTransfer extends StatelessWidget {
  const ScreenTransfer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
        child: Lottie.network(
          "https://assets9.lottiefiles.com/packages/lf20_ydo1amjm.json",
        ),
      ),
    );
  }
}
