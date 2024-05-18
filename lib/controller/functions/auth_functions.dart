import 'package:flutter/foundation.dart';

import '../../core/constant/const.dart';
import '../../model/auth/authentication_token_model.dart';
import '../../screens/widgets/snack_bar.dart';
import 'goto_functions.dart';
import '../services/services.dart';
import 'package:http/http.dart' as http;

// Screen SignUp [USER REGISTER FUNCTION]
Future<void> userSignUp(
  context, {
  required String firstName,
  required String secondName,
  required String thirdName,
  required String email,
  required String phone,
  required String password,
  required String gender,
  required String dob,
}) async {
  var apiUrl = Uri.parse(baseUrl + registerURL);
  try {
    var payload = {
      'firstName': firstName,
      'middleName': secondName,
      'lastName': thirdName,
      'email': email,
      'mobilePhone': countryCode + phone,
      'password': password,
      'genderId': gender,
      'dateOfBirth': dob,
    };

    var response = await http.post(
      apiUrl,
      body: payload,
    );
    if (response.statusCode == 201) {
      storage.write(isLogged, true);

      if (kDebugMode) {
        print(
          'Response STATUSCODE ====  ${response.statusCode}  ====]',
        );
        print(
          'Response ----  ${response.body}  ----]',
        );
      }
      GotoScreenNavigations.gotoScreenSignUpSuccess(context);
    } else {
      if (kDebugMode) {
        print(
          'Login Profile ERROR ---- [error(${response.statusCode})]',
        );
        print(
          'Login Profile ERROR ---- [error(${response.body})]',
        );
      }
    }
  } catch (e) {
    showErrorSnackbar(
      context: context,
      content: "Something Wrong",
    );

    if (kDebugMode) {
      print(e.toString());
    }
  }
}

// Screen SignIn [USER Login FUNCTION]

Future<void> userSignIn(
  context, {
  required String phone,
  required String password,
}) async {
  var apiUrl = Uri.parse(baseUrl + authURL);
  try {
    var payload = {
      'username': countryCode + phone,
      'password': password,
    };

    var response = await http.post(
      apiUrl,
      body: payload,
    );
    if (response.statusCode == 201) {
      final responseOfAuth = userTokenModelFromJson(response.body);
      storage.write(isLogged, true);
      storage.write(userPhoneNumber, countryCode + phone);
      storage.write(userPassword, password);
      storage.write(authToken, responseOfAuth.data!.authToken);
      storage.write(refreshToken, responseOfAuth.data!.refreshToken);
      if (kDebugMode) {
        print(
          'Response STATUSCODE ====  ${response.statusCode}  ====]',
        );
        print('Response ----  ${response.body}  ----]');
      }
      GotoScreenNavigations.gotoBottomNavigation(context);
    } else {
      showErrorSnackbar(context: context, content: 'Invalid user');
      if (kDebugMode) {
        print(
          'Login Profile ERROR ---- [error(${response.statusCode})]',
        );
        print(
          'Login Profile ERROR ---- [error(${response.body})]',
        );
      }
    }
  } catch (e) {
    showErrorSnackbar(
      context: context,
      content: "Something Wrong",
    );

    if (kDebugMode) {
      print(e.toString());
    }
  }
}

//Refresh TOKENS

Future<String> refreshTokens() async {
  var apiUrl = Uri.parse(baseUrl + authURL);
  final phone = storage.read(userPhoneNumber);
  final password = storage.read(userPassword);
  try {
    var payload = {
      'username': phone,
      'password': password,
    };

    var response = await http.post(
      apiUrl,
      body: payload,
    );
    if (response.statusCode == 201) {
      final responseOfAuth = userTokenModelFromJson(response.body);
      storage.write(authToken, responseOfAuth.data!.authToken);
      storage.write(refreshToken, responseOfAuth.data!.refreshToken);
      if (kDebugMode) {
        print(
          'Response STATUSCODE ====  ${response.statusCode}  ====]',
        );
        print(
          'Response ----  ${response.body}  ----]',
        );
      }
      return responseOfAuth.data!.authToken!;
    } else {
      if (kDebugMode) {
        print(
          'Login Profile ERROR ---- [error(${response.statusCode})]',
        );
        print(
          'Login Profile ERROR ---- [error(${response.body})]',
        );
      }
    }
  } catch (e, s) {
    if (kDebugMode) {
      print(e.toString());
      print(s.toString());
    }
  }
  return '';
}

//Fetch User Data

Future<void> fetchUserData() async {
  var apiUrl = Uri.parse(baseUrl + userDataURL);
  final String newAuthToken = await refreshTokens();
  try {
    var response = await http.get(
      apiUrl,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $newAuthToken',
      },
    );
    if (response.statusCode == 200) {
      final responseOfAuth = userTokenModelFromJson(response.body);
      storage.write(authToken, responseOfAuth.data!.authToken);
      storage.write(refreshToken, responseOfAuth.data!.refreshToken);

      if (kDebugMode) {
        print(
          'Response STATUSCODE ====  ${response.statusCode}  ====]',
        );
        print(
          'Response ----  ${response.body}  ----]',
        );
      }
      // return responseOfAuth;
    } else {
      if (kDebugMode) {
        print(
          'Login Profile ERROR ----> [error(${response.statusCode})]',
        );
        print(
          'Login Profile ERROR ----> [error(${response.body})]',
        );
      }
    }
  } catch (e, s) {
    if (kDebugMode) {
      print(
        e.toString(),
      );
      print(
        s.toString(),
      );
    }
  }
}
