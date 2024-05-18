import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tayo_pay/controller/functions/goto_functions.dart';
import 'package:tayo_pay/core/colors/colors.dart';
import 'package:tayo_pay/core/constant/const.dart';
import 'package:tayo_pay/model/user/user_model.dart';
import 'package:tayo_pay/screens/widgets/snack_bar.dart';

import '../screen_home/widgets/widgets.dart';
import '../screen_profile/bloc/profile_bloc.dart';
import 'widgets/widgets.dart';

final ProfileBloc profileBloc = ProfileBloc();

class ScreenAccount extends StatelessWidget {
  const ScreenAccount({super.key});

  @override
  Widget build(BuildContext context) {
    profileBloc.add(ProfileInitialEvent());
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 10),
                const TextWidgetWithInterFont(
                  title: 'Account',
                  color: kDarkBlue,
                  size: 22,
                  weight: FontWeight.w600,
                ),
                const SizedBox(height: 20),
                BlocConsumer<ProfileBloc, ProfileState>(
                  bloc: profileBloc,
                  listenWhen: (previous, current) =>
                      current is ProfileActionState,
                  buildWhen: (previous, current) =>
                      current is! ProfileActionState,
                  listener: (context, state) {},
                  builder: (context, state) {
                    switch (state.runtimeType) {
                      case const (ProfileSuccessfulStete):
                        final successState = state as ProfileSuccessfulStete;
                        // ignore: unrelated_type_equality_checks
                        if (state.posts == true) {
                          return const Center(
                            child: Text(
                              "Empty",
                            ),
                          );
                        }
                        final UserModle profileData = successState.posts;
                        return Column(
                          children: [
                            MainContainerInAccountScreen(
                                profileData: profileData),
                            const SizedBox(height: 15),
                            GestureDetector(
                                onTap: () {
                                  GotoScreenNavigations.gotoScreenProfile(
                                    context,
                                    profileData,
                                  );
                                },
                                child: AccountsListTile(title: 'Profile')),
                          ],
                        );
                    }

                    return Column(
                      children: [
                        Shimmer.fromColors(
                          baseColor: kLightGrey,
                          highlightColor: kGrey,
                          child: Container(
                            height: 60,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: kBlack,
                            ),
                          ),
                        ),
                        // const SizedBox(height: 10),
                      ],
                    );
                  },
                ),
                AccountsListTile(title: 'Upload Documents'),
                AccountsListTile(title: 'Account Settings'),
                AccountsListTile(title: 'About TayoPay'),
                AccountsListTile(title: 'Terms & Conditions'),
                AccountsListTile(title: 'Privacy Policy'),
                AccountsListTile(title: 'Complaint Policy'),
                AccountsListTile(title: 'Version', isTrail: true),
                const SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: () async {
                    await storage.write(isLogged, false);
                    showLoadingSnackbar(
                        // ignore: use_build_context_synchronously
                        context: context,
                        content: 'Log out...');
                    gotoMainScreenWithoutDelay();
                  },
                  child: Container(
                    height: 55,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: kLightBlue,
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextWidgetWithInterFont(
                          title: 'Log out',
                          color: kDarkBlue,
                          size: 16,
                          weight: FontWeight.w500,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.logout,
                          color: kDarkBlue,
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MainContainerInAccountScreen extends StatelessWidget {
  const MainContainerInAccountScreen({
    super.key,
    required this.profileData,
  });

  final UserModle profileData;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 55,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: kWhite,
      ),
      // ignore: prefer_const_constructors
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.account_circle_outlined,
                  color: kLightGrey,
                  size: 40,
                ),
                const SizedBox(width: 5),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidgetWithInterFont(
                      title: profileData.data!.firstName!,
                      color: Colors.black54,
                      size: 18,
                      weight: FontWeight.w600,
                    ),
                    const Row(
                      children: [
                        TextWidgetWithInterFont(
                          title: 'Costumer Id: ',
                          color: kDarkGrey,
                          size: 12,
                          weight: FontWeight.normal,
                        ),
                        TextWidgetWithInterFont(
                          title: '74792398',
                          color: kBlack,
                          size: 12,
                          weight: FontWeight.normal,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Row(
                  children: [
                    const Column(
                      children: [
                        TextWidgetWithInterFont(
                          title: 'M: ',
                          color: kDarkGrey,
                          size: 12,
                          weight: FontWeight.normal,
                        ),
                        TextWidgetWithInterFont(
                          title: 'E:',
                          color: kDarkGrey,
                          size: 12,
                          weight: FontWeight.normal,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 3.5,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: TextWidgetWithInterFont(
                              title: '+${profileData.data!.mobilePhone}',
                              color: kBlack,
                              size: 12,
                              weight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width / 3.5,
                            child: TextWidgetWithInterFont(
                              title: profileData.data!.email!,
                              color: kBlack,
                              size: 12,
                              weight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
