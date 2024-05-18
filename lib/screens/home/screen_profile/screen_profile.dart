import 'package:flutter/material.dart';
import 'package:tayo_pay/model/user/user_model.dart';

import '../../../core/colors/colors.dart';
import '../screen_home/widgets/widgets.dart';
import 'widgets/widgets.dart';

class ScreenProfile extends StatelessWidget {
  const ScreenProfile({super.key, required this.profileModel});
  final UserModle profileModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              SizedBox(height: 10),
              TextWidgetWithInterFont(
                title: 'Profile',
                color: kDarkBlue,
                size: 22,
                weight: FontWeight.w600,
              ),
              SizedBox(height: 30),
              ProfileScreenListTile(
                  title: 'First Name', text: profileModel.data!.firstName!),
              ProfileScreenListTile(
                  title: 'Middle Name', text: profileModel.data!.roleName!),
              ProfileScreenListTile(
                  title: 'Last Name', text: profileModel.data!.lastName!),
              ProfileScreenListTile(
                  title: 'Email', text: profileModel.data!.email!),
              ProfileScreenListTile(
                  title: 'Mobile', text: '+${profileModel.data!.mobilePhone!}'),
              ProfileScreenListTile(title: 'Gender', text: 'Male'),
              ProfileScreenListTile(title: 'Date of Birth', text: '2001/04/17'),
            ],
          ),
        ),
      ),
    );
  }
}
