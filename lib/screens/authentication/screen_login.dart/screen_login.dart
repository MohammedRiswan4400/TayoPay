import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tayo_pay/controller/functions/goto_functions.dart';
import 'package:tayo_pay/core/colors/colors.dart';
import 'package:tayo_pay/screens/authentication/screen_get_start/widgets/widgets.dart';

import '../../../controller/functions/auth_functions.dart';
import '../../../core/constant/const.dart';
import '../../home/screen_home/widgets/widgets.dart';
import '../../widgets/snack_bar.dart';
import '../screen_sign_up/widgets/widgets.dart';

class ScreenLogin extends StatefulWidget {
  const ScreenLogin({super.key});

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isObscure = true;
  @override
  void dispose() {
    _phoneController.clear();
    _passwordController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              mainBackgroundImage,
              fit: BoxFit.fill,
              alignment: Alignment.center,
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 6,
                    ),
                    Text(
                      'Log in',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        textStyle: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                            color: kDarkBlue),
                      ),
                    ),
                    Text(
                      'Enter your mobile number and password',
                      // textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        textStyle: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: kMiddleBlue),
                      ),
                    ),
                    const SizedBox(height: 20),
                    PhoneTextFormField(phoneController: _phoneController),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _passwordController,
                      cursorHeight: 20,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: kWhite,
                        hintText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                            color: kGrey,
                            width: 1.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(color: kGrey),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide:
                              const BorderSide(color: kGrey, width: 1.0),
                        ),
                        suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                isObscure = !isObscure;
                              });
                            },
                            child: isObscure
                                ? const Icon(
                                    Icons.visibility_off_outlined,
                                    color: kGrey,
                                  )
                                : const Icon(
                                    Icons.visibility_outlined,
                                    color: kGrey,
                                  )),
                      ),
                      obscureText: isObscure ? true : false,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password is required*';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(),
                        TextWidgetWithInterFont(
                          title: 'Forgot password?',
                          color: kBlack,
                          size: 16,
                          weight: FontWeight.normal,
                        ),
                      ],
                    ),
                    const SizedBox(height: 60),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          final phone = _phoneController.text.trim();
                          final password = _passwordController.text.trim();
                          if (_formKey.currentState?.validate() ?? false) {
                            userSignIn(context,
                                phone: phone, password: password);
                            showLoadingSnackbar(
                              context: context,
                              content: 'Login...',
                            );
                          } else {
                            showErrorSnackbar(
                              context: context,
                              content: 'Please correct the errors in the form',
                            );
                          }
                        },
                        child: const GetStartButton(title: 'Login'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 15,
            left: 0,
            right: 0,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const TextWidgetWithInterFont(
                    title: 'Don\'t have an account? ',
                    color: kBlack,
                    size: 15,
                    weight: FontWeight.w400,
                  ),
                  GestureDetector(
                    onTap: () =>
                        GotoScreenNavigations.gotoScreenSignUpReplacement(
                            context),
                    child: const TextWidgetWithInterFont(
                      title: 'Sign up',
                      color: kBlack,
                      size: 17,
                      weight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
