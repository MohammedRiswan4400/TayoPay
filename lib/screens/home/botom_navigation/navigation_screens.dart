import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';

ValueNotifier<int> indexChangeNotifier = ValueNotifier(0);

class ScreenNavigation extends StatelessWidget {
  const ScreenNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: indexChangeNotifier,
      builder: (BuildContext context, int newIndex, _) {
        return BottomNavigationBar(
          onTap: (index) {
            indexChangeNotifier.value = index;
          },
          currentIndex: newIndex,
          elevation: 0,
          backgroundColor: kWhite,
          iconSize: 24,
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 15,
          unselectedFontSize: 14,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
          unselectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w400,
          ),
          selectedItemColor: kMiddleBlue,
          unselectedItemColor: kDarkGrey,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_filled, size: 30), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.list_alt_rounded, size: 30),
                label: 'Transfers'),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined, size: 30),
              label: 'Account',
            ),
          ],
        );
      },
    );
  }
}
