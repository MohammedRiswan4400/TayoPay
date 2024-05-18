import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

import '../../../../controller/functions/auth_functions.dart';
import '../../../../controller/services/services.dart';
import '../../../../core/constant/const.dart';
import '../../../../model/auth/authentication_token_model.dart';
import '../../../../model/user/user_model.dart';
import 'package:http/http.dart' as http;

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<ProfileInitialEvent>(profileInititalEvent);
  }
  FutureOr<void> profileInititalEvent(
    ProfileInitialEvent event,
    Emitter<ProfileState> emit,
  ) async {
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
        var responseData = json.decode(response.body);
        storage.write(authToken, responseOfAuth.data!.authToken);
        storage.write(refreshToken, responseOfAuth.data!.refreshToken);
        UserModle profile = UserModle.fromJson(responseData);
        log('Instence of Profile');
        emit(ProfileSuccessfulStete(posts: profile));
        if (kDebugMode) {
          print(
            'Response STATUSCODE ====  ${response.statusCode}  ====]',
          );
          print(
            'Response ----  ${response.body}  ----]',
          );
        }
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
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}
