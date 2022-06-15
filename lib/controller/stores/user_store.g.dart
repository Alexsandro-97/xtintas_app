// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserStore on _UserStoreBase, Store {
  late final _$profileAtom =
      Atom(name: '_UserStoreBase.profile', context: context);

  @override
  User? get profile {
    _$profileAtom.reportRead();
    return super.profile;
  }

  @override
  set profile(User? value) {
    _$profileAtom.reportWrite(value, super.profile, () {
      super.profile = value;
    });
  }

  late final _$newNameAtom =
      Atom(name: '_UserStoreBase.newName', context: context);

  @override
  String get newName {
    _$newNameAtom.reportRead();
    return super.newName;
  }

  @override
  set newName(String value) {
    _$newNameAtom.reportWrite(value, super.newName, () {
      super.newName = value;
    });
  }

  late final _$newEmailAtom =
      Atom(name: '_UserStoreBase.newEmail', context: context);

  @override
  String get newEmail {
    _$newEmailAtom.reportRead();
    return super.newEmail;
  }

  @override
  set newEmail(String value) {
    _$newEmailAtom.reportWrite(value, super.newEmail, () {
      super.newEmail = value;
    });
  }

  late final _$newPasswordAtom =
      Atom(name: '_UserStoreBase.newPassword', context: context);

  @override
  String get newPassword {
    _$newPasswordAtom.reportRead();
    return super.newPassword;
  }

  @override
  set newPassword(String value) {
    _$newPasswordAtom.reportWrite(value, super.newPassword, () {
      super.newPassword = value;
    });
  }

  late final _$getProfileAsyncAction =
      AsyncAction('_UserStoreBase.getProfile', context: context);

  @override
  Future getProfile() {
    return _$getProfileAsyncAction.run(() => super.getProfile());
  }

  late final _$signUpAsyncAction =
      AsyncAction('_UserStoreBase.signUp', context: context);

  @override
  Future signUp() {
    return _$signUpAsyncAction.run(() => super.signUp());
  }

  late final _$signInAsyncAction =
      AsyncAction('_UserStoreBase.signIn', context: context);

  @override
  Future signIn() {
    return _$signInAsyncAction.run(() => super.signIn());
  }

  late final _$signOutAsyncAction =
      AsyncAction('_UserStoreBase.signOut', context: context);

  @override
  Future signOut() {
    return _$signOutAsyncAction.run(() => super.signOut());
  }

  late final _$_UserStoreBaseActionController =
      ActionController(name: '_UserStoreBase', context: context);

  @override
  dynamic setName(String name) {
    final _$actionInfo = _$_UserStoreBaseActionController.startAction(
        name: '_UserStoreBase.setName');
    try {
      return super.setName(name);
    } finally {
      _$_UserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setEmail(String email) {
    final _$actionInfo = _$_UserStoreBaseActionController.startAction(
        name: '_UserStoreBase.setEmail');
    try {
      return super.setEmail(email);
    } finally {
      _$_UserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPassword(String password) {
    final _$actionInfo = _$_UserStoreBaseActionController.startAction(
        name: '_UserStoreBase.setPassword');
    try {
      return super.setPassword(password);
    } finally {
      _$_UserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
profile: ${profile},
newName: ${newName},
newEmail: ${newEmail},
newPassword: ${newPassword}
    ''';
  }
}
