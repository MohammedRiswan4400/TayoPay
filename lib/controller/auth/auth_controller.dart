import 'package:get/get.dart';
import 'package:tayo_pay/screens/authentication/screen_get_start/screen_get_start.dart';

import '../../core/constant/const.dart';
import '../../screens/home/botom_navigation/bottom_navigation.dart';

class AuthController extends GetxController {
  @override
  void onInit() {
    if (storage.read(isLogged) ?? false) {
      // log(storage.read(isLoggedin));
      /////////////
      Get.offAll(() => ScreenBottomNavigation());
      ////////////
    } else {
      Get.off(const ScreenGetStart());
    }

    super.onInit();
  }
}
