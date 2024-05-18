import 'package:flutter/material.dart';
import 'package:tayo_pay/screens/home/screen_account/screen_account.dart';
import 'package:tayo_pay/screens/home/screen_home/screen_home.dart';
import 'package:tayo_pay/screens/home/screen_transfer/screen_transfer.dart';
import 'navigation_screens.dart';

class ScreenBottomNavigation extends StatelessWidget {
  ScreenBottomNavigation({super.key});
  final _pages = [
    const ScreenHome(),
    const ScreenTransfer(),
    const ScreenAccount(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: indexChangeNotifier,
        builder: (context, int index, _) {
          return _pages[index];
        },
      ),
      bottomNavigationBar: const ScreenNavigation(),
    );
  }
}
