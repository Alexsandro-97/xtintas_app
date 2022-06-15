import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xtintas_app/repositories/services/sign_in_user_service.dart';
import 'package:xtintas_app/repositories/services/sign_out_service.dart';

import '/models/user_model.dart';
import '../../repositories/client/dio_client.dart';
import '../../repositories/client/i_client_repository.dart';
import '../../repositories/services/get_profile_service.dart';

part 'user_store.g.dart';

class UserStore = _UserStoreBase with _$UserStore;

abstract class _UserStoreBase with Store {
  final IClient client = DioClient();
  late GetProfileService userService = GetProfileService(client);
  late SignInService signInService = SignInService(client);
  late SignOutService signOutService = SignOutService(client);

  @observable
  User? profile;

  @action
  getProfile() async {
    try {
      final responseProfile = await userService.fetchProfile();
      profile = User(
        name: responseProfile['name'],
        email: responseProfile['email'],
        avatar: responseProfile['avatar'],
      );
    } catch (e) {
      debugPrint("Error: $e");
    }
  }

  @action
  signIn() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    try {
      final accessToken = signInService.signInUser();
      await sharedPreferences.setString('access-token', '$accessToken');
      return true;
    } catch (e) {
      return false;
    }
  }

  @action
  signOut() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    try {
      final logout = signOutService.signOutUser();
      sharedPreferences.clear();
      return true;
    } catch (e) {
      return false;
    }
  }
}
