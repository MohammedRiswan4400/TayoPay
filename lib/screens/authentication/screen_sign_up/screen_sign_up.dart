// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../../controller/functions/auth_functions.dart';
import '../../../core/colors/colors.dart';
import '../../../core/constant/const.dart';
import '../../widgets/snack_bar.dart';
import '../screen_get_start/widgets/widgets.dart';
import 'widgets/widgets.dart';

class ScreenSignUp extends StatefulWidget {
  const ScreenSignUp({super.key});

  @override
  State<ScreenSignUp> createState() => _ScreenSignUpState();
}

class _ScreenSignUpState extends State<ScreenSignUp> {
  final _formKey = GlobalKey<FormState>();

  final genderItems = ['Male', 'Female', 'Others'];
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _secondNameController = TextEditingController();
  final TextEditingController _thirdNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  // final TextEditingController _genderController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? _selectedValue;
  bool isObscure = true;

  @override
  void dispose() {
    _firstNameController.clear();
    _secondNameController.clear();
    _thirdNameController.clear();
    _emailController.clear();
    _phoneController.clear();
    _dobController.clear();
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
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      Text(
                        'Sign in to TayoPay',
                        style: GoogleFonts.inter(
                          textStyle: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                            color: kDarkBlue,
                          ),
                        ),
                      ),
                      Text(
                        'Enter your details to create an account',
                        style: GoogleFonts.inter(
                          textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: kMiddleBlue,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      SignUpTextFormField(
                        hintText: 'First Name',
                        errorMessage: 'First name is required*',
                        controller: _firstNameController,
                      ),
                      const SizedBox(height: 10),
                      SignUpTextFormField(
                        hintText: 'Middle Name',
                        errorMessage: 'Middle name is required*',
                        controller: _secondNameController,
                      ),
                      const SizedBox(height: 10),
                      SignUpTextFormField(
                        hintText: 'Last Name',
                        errorMessage: 'Last name is required*',
                        controller: _thirdNameController,
                      ),
                      const SizedBox(height: 10),
                      EmailTextFormField(controller: _emailController),
                      const SizedBox(height: 10),
                      PhoneTextFormField(phoneController: _phoneController),
                      const SizedBox(height: 10),
                      DropdownButtonFormField(
                        icon: const Icon(Icons.arrow_forward_ios_rounded,
                            color: kGrey),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: kWhite,
                          hintText: 'Gender',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(color: kGrey),
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
                        ),
                        value: _selectedValue,
                        items: genderItems
                            .map(
                              (label) => DropdownMenuItem(
                                  value: label, child: Text(label)),
                            )
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedValue = value;
                            // print(_selectedValue!.length.toString());
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select an option';
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: _dobController,
                        cursorHeight: 0,
                        keyboardType: TextInputType.none,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: kWhite,
                          hintText: 'Dare of Birth',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide:
                                const BorderSide(color: kGrey, width: 1.0),
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
                          suffixIconColor: kGrey,
                          suffixIcon: GestureDetector(
                            onTap: () {
                              _selectDate(context);
                            },
                            child: const Icon(Icons.calendar_today_outlined),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select an option';
                          }
                          return null;
                        },
                      ),
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
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password is required*';
                          }
                          if (value.length < 6) {
                            return 'Password must be at least 6 characters long';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 30),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            final firstName = _firstNameController.text.trim();
                            final middleName =
                                _secondNameController.text.trim();
                            final lastName = _thirdNameController.text.trim();
                            final email = _emailController.text.trim();
                            final phone = _phoneController.text.trim();
                            final password = _passwordController.text.trim();
                            const gender = '1';
                            final dob = _dobController.text.trim();
                            if (_formKey.currentState?.validate() ?? false) {
                              userSignUp(
                                context,
                                firstName: firstName,
                                secondName: middleName,
                                thirdName: lastName,
                                email: email,
                                phone: phone,
                                password: password,
                                gender: gender,
                                dob: dob,
                              );
                              showLoadingSnackbar(
                                context: context,
                                content: 'Processing...',
                              );
                            } else {
                              showErrorSnackbar(
                                context: context,
                                content:
                                    'Please correct the errors in the form',
                              );
                            }
                          },
                          child: const GetStartButton(
                            title: 'Continue',
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const RichTextWidget(),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900, 1),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != DateTime.now()) {
      setState(() {
        _dobController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }
}
