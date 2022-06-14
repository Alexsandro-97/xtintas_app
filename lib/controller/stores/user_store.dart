import 'package:flutter/material.dart';
import '/models/user_model.dart';
import 'package:mobx/mobx.dart';

import '../../repositories/client/dio_client.dart';
import '../../repositories/client/i_client_repository.dart';
import '../../repositories/services/user_service.dart';

part 'user_store.g.dart';

class UserStore = _UserStoreBase with _$UserStore;

abstract class _UserStoreBase with Store {
  final IClient client = DioClient();
  late UserService userService = UserService(client);

  @observable
  User? profile;

  @action
  getProfile() async {
    try {
      final response = await userService.fetchProfile();
      profile = User(
        name: response['name'],
        email: response['email'],
        avatar: response['avatar'],
      );
    } catch (e) {
      debugPrint("Error: $e");
    }
  }
}
