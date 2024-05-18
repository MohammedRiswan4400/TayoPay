import 'package:flutter/material.dart';
import 'package:tayo_pay/screens/authentication/screen_login.dart/screen_login.dart';
import 'package:tayo_pay/screens/authentication/screen_signup_success/screen_signup_success.dart';
import 'package:tayo_pay/screens/home/screen_profile/screen_profile.dart';

import '../../screens/authentication/screen_sign_up/screen_sign_up.dart';
import '../../screens/home/botom_navigation/bottom_navigation.dart';

// Screen Navigations
class GotoScreenNavigations {
  // Going to Screen SignUp
  static gotoScreenSignUp(context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const ScreenSignUp(),
      ),
    );
  }

  //
  static gotoScreenSignUpReplacement(context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const ScreenSignUp(),
      ),
    );
  }

// Going to Screen SignUp Success
  static gotoScreenSignUpSuccess(context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const ScreenSignUpSuccess(),
      ),
    );
  }

  // Going to Screen SignIn Success
  static gotoScreenSignIn(context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return const ScreenLogin();
        },
      ),
    );
  }

  //
  static gotoScreenSignInReplacement(context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) {
          return const ScreenLogin();
        },
      ),
    );
  }

  static gotoBottomNavigation(context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => ScreenBottomNavigation()),
      (Route<dynamic> route) => false,
    );
  }

  static gotoScreenProfile(context, profileModle) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return ScreenProfile(
            profileModel: profileModle,
          );
        },
      ),
    );
  }
  // {
  //   Navigator.of(context).pushAndRemoveUntil(
  //     MaterialPageRoute(
  //       builder: (context) {
  //         return ScreenBottomNavigation();
  //       },
  //     )

  //   );
  // }
}

// gotoScreenSignUp() {
//   Get.to(
//     () => const ScreenSignUp(),
//     transition: Transition.fadeIn,
//     duration: const Duration(
//       seconds: 1,
//     ),
//   );
// }
