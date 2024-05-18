import 'package:flutter/material.dart';

import '../../../../core/colors/colors.dart';
import '../../screen_home/widgets/widgets.dart';

// ignore: must_be_immutable
class AccountsListTile extends StatelessWidget {
  AccountsListTile({super.key, required this.title, this.isTrail});
  final String title;
  bool? isTrail;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: kWhite,
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidgetWithInterFont(
                  title: title,
                  color: kDarkGrey,
                  size: 13,
                  weight: FontWeight.w500,
                ),
                isTrail != true
                    ? const Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: kGrey,
                        size: 20,
                      )
                    : const SizedBox()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
