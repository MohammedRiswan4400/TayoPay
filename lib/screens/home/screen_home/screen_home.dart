import 'package:flutter/material.dart';
import 'package:tayo_pay/screens/authentication/screen_get_start/widgets/widgets.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constant/const.dart';
import 'widgets/widgets.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidgetWithInterFont(
                      title: 'Recent transfers',
                      color: kDarkBlue,
                      size: 18,
                      weight: FontWeight.w600,
                    ),
                    TextWidgetWithInterFont(
                      title: 'See all',
                      color: kMiddleBlue,
                      size: 17,
                      weight: FontWeight.w400,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      20,
                    ),
                    color: kWhite,
                  ),
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    children: const [
                      SizedBox(height: 10),
                      StarContainer(),
                      Divider(),
                      UaeContainer(),
                      Divider(),
                      StarContainer(),
                      Divider(),
                      UaeContainer(),
                      Divider(),
                      StarContainer(),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
                const SizedBox(height: 70),
                const GetStartButton(title: 'Send to new recipient'),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class UaeContainer extends StatelessWidget {
  const UaeContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: kBlue,
                radius: 20,
                backgroundImage: AssetImage(uaeFlagImage),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidgetWithInterFont(
                    title: '+971-235-40-000',
                    color: kDarkGrey,
                    size: 12,
                    weight: FontWeight.normal,
                  ),
                  TextWidgetWithInterFont(
                    title: 'Mohammed Irfan',
                    color: kBlack,
                    size: 16,
                    weight: FontWeight.w600,
                  ),
                  TextWidgetWithInterFont(
                    title: '18-04-2024 15:30',
                    color: kDarkGrey,
                    size: 12,
                    weight: FontWeight.normal,
                  ),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextWidgetWithInterFont(
                title: 'Cash Collection',
                color: kDarkGrey,
                size: 12,
                weight: FontWeight.normal,
              ),
              TextWidgetWithInterFont(
                title: '500.00 USD',
                color: kBlack,
                size: 16,
                weight: FontWeight.w600,
              ),
              TextWidgetWithInterFont(
                title: 'PENDING',
                color: kMiddleBlue,
                size: 12,
                weight: FontWeight.w600,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class StarContainer extends StatelessWidget {
  const StarContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: kBlue,
                radius: 20,
                child: Icon(
                  Icons.star,
                  color: kWhite,
                ),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidgetWithInterFont(
                    title: '+252-235-48-899',
                    color: kDarkGrey,
                    size: 12,
                    weight: FontWeight.normal,
                  ),
                  TextWidgetWithInterFont(
                    title: 'Abdullahi Ahmed',
                    color: kBlack,
                    size: 16,
                    weight: FontWeight.w600,
                  ),
                  TextWidgetWithInterFont(
                    title: '18-04-2024 09:30',
                    color: kDarkGrey,
                    size: 12,
                    weight: FontWeight.normal,
                  ),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextWidgetWithInterFont(
                title: 'Cash Collection',
                color: kDarkGrey,
                size: 12,
                weight: FontWeight.normal,
              ),
              TextWidgetWithInterFont(
                title: '1001.00 USD',
                color: kBlack,
                size: 16,
                weight: FontWeight.w600,
              ),
              TextWidgetWithInterFont(
                title: 'PAID',
                color: kMiddleBlue,
                size: 12,
                weight: FontWeight.w600,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
