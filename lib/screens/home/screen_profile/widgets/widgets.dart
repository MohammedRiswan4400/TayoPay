import 'package:flutter/material.dart';
import 'package:tayo_pay/screens/home/screen_home/widgets/widgets.dart';

import '../../../../core/colors/colors.dart';

class ProfileScreenListTile extends StatelessWidget {
  const ProfileScreenListTile({
    super.key,
    required this.title,
    required this.text,
  });
  final String title;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 1),
      child: Container(
        // height: 70,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [BoxShadow(offset: Offset(0, 1), color: kLightGrey)],
          color: kWhite,
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidgetWithInterFont(
                title: title,
                color: kDarkGrey,
                size: 12,
                weight: FontWeight.w400,
              ),
              TextWidgetWithInterFont(
                title: text,
                color: kBlack,
                size: 16,
                weight: FontWeight.w500,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
