// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CartStore on _CartStoreBase, Store {
  late final _$cartsAtom = Atom(name: '_CartStoreBase.carts', context: context);

  @override
  List<Cart> get carts {
    _$cartsAtom.reportRead();
    return super.carts;
  }

  @override
  set carts(List<Cart> value) {
    _$cartsAtom.reportWrite(value, super.carts, () {
      super.carts = value;
    });
  }

  late final _$getCartsAsyncAction =
      AsyncAction('_CartStoreBase.getCarts', context: context);

  @override
  Future getCarts() {
    return _$getCartsAsyncAction.run(() => super.getCarts());
  }

  @override
  String toString() {
    return '''
carts: ${carts}
    ''';
  }
}
