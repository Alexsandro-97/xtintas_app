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

  late final _$getProfileAsyncAction =
      AsyncAction('_UserStoreBase.getProfile', context: context);

  @override
  Future getProfile() {
    return _$getProfileAsyncAction.run(() => super.getProfile());
  }

  @override
  String toString() {
    return '''
profile: ${profile}
    ''';
  }
}
