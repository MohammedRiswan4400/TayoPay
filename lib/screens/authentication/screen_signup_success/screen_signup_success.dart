import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tayo_pay/controller/functions/goto_functions.dart';
import 'package:tayo_pay/core/colors/colors.dart';

import '../../../core/constant/const.dart';
import '../screen_get_start/widgets/widgets.dart';

class ScreenSignUpSuccess extends StatelessWidget {
  const ScreenSignUpSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(mainBackgroundImage, fit: BoxFit.fill),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(),
                Column(
                  children: [
                    Image.asset(
                      loginSuccessImage,
                      scale: 3,
                    ),
                    const SizedBox(height: 40),
                    Text(
                      'Signup Success!!',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        textStyle: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                            color: kDarkBlue),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Your account has been\ncreated successfully',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: kMiddleBlue),
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () =>
                      GotoScreenNavigations.gotoScreenSignInReplacement(
                          context),
                  child: const GetStartButton(title: 'Login'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
