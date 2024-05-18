import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../../core/colors/colors.dart';

class RichTextWidget extends StatelessWidget {
  const RichTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      // textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'By clicking on continue, I agree to TayoPay ',
            style: GoogleFonts.inter(
              textStyle: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: kMiddleBlue,
              ),
            ),
          ),
          TextSpan(
            text: 'Terms ',
            style: GoogleFonts.inter(
              textStyle: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: kDarkBlue,
              ),
            ),
          ),
          TextSpan(
            text: '& ',
            style: GoogleFonts.inter(
              textStyle: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: kMiddleBlue,
              ),
            ),
          ),
          TextSpan(
            text: 'Privacy Policy',
            style: GoogleFonts.inter(
              textStyle: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: kDarkBlue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//Text Form Fields on SignUp Screen

class PhoneTextFormField extends StatelessWidget {
  const PhoneTextFormField({
    super.key,
    required TextEditingController phoneController,
  }) : _phoneController = phoneController;

  final TextEditingController _phoneController;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: kWhite,
        border: Border.all(color: kGrey),
      ),
      child: IntlPhoneField(
        showDropdownIcon: false,
        controller: _phoneController,
        dropdownTextStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 15,
        ),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        showCountryFlag: false,
        invalidNumberMessage: 'Please enter the valid mobile number',
        dropdownIconPosition: IconPosition.leading,
        textAlignVertical: TextAlignVertical.center,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 15,
          textBaseline: TextBaseline.alphabetic,
        ),
        flagsButtonPadding: const EdgeInsets.only(top: 10, left: 15, bottom: 5),
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.only(top: 10, left: 15, bottom: 5),
          alignLabelWithHint: true,
          hintText: '0 00 00 00 00',
          border: InputBorder.none,
          hintStyle: TextStyle(
            fontWeight: FontWeight.w500,
            textBaseline: TextBaseline.alphabetic,
          ),
          counter: SizedBox.shrink(),
        ),
        initialCountryCode: 'ZA',
      ),
    );
  }
}

class EmailTextFormField extends StatelessWidget {
  const EmailTextFormField({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorHeight: 20,
      decoration: InputDecoration(
        filled: true,
        fillColor: kWhite,
        hintText: 'Email',
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
          borderSide: const BorderSide(
            color: kGrey,
            width: 1.0,
          ),
        ),
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Email is required*';
        }
        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
          return 'Please enter a valid email';
        }
        return null;
      },
    );
  }
}

class SignUpTextFormField extends StatelessWidget {
  const SignUpTextFormField({
    super.key,
    required this.hintText,
    required this.errorMessage,
    required this.controller,
  });
  final String hintText;
  final String errorMessage;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorHeight: 20,
      decoration: InputDecoration(
        filled: true,
        fillColor: kWhite,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: kGrey,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: kGrey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: kGrey,
            width: 1.0,
          ),
        ),
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (fisrName) {
        if (fisrName == null || fisrName.isEmpty) {
          return errorMessage;
        }
        return null;
      },
    );
  }
}
