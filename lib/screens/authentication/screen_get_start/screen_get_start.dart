import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controller/functions/goto_functions.dart';
import '../../../core/colors/colors.dart';
import '../../../core/constant/const.dart';
import 'widgets/widgets.dart';

class ScreenGetStart extends StatelessWidget {
  const ScreenGetStart({super.key});

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
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const SizedBox(height: 70),
                    Image.asset(logoTayoPay, scale: 6),
                    // const SizedBox(height: 20),
                    Opacity(
                      opacity: 0.6,
                      child: SizedBox(
                          height: MediaQuery.of(context).size.height / 2.9,
                          child: Image.asset(globelImage, scale: 1.5)),
                    ),
                    // const SizedBox(height: 30),
                    const CheckRatesButton(),
                  ],
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 2.6,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: kWhite,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 5,
                        offset: Offset(1, -5),
                        color: kLightGrey,
                      )
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height / 20),
                      Text(
                        'Send money\nwith just a few tabs',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          textStyle: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                              color: kMiddleBlue),
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height / 15),
                      GestureDetector(
                        onTap: () =>
                            // Navigator.of(context).push(
                            //   MaterialPageRoute(
                            //     builder: (context) {
                            //       return const ScreenSignUp();
                            //     },
                            //   ),
                            // ),
                            GotoScreenNavigations.gotoScreenSignUp(context),
                        child: const GetStartButton(title: 'Get Started'),
                      ),
                      const SizedBox(height: 10),
                      GestureDetector(
                          onTap: () =>
                              GotoScreenNavigations.gotoScreenSignIn(context),
                          child: const IhaveAccountButton()),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
