// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paint_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PaintStore on _PaintStoreBase, Store {
  late final _$paintsAtom =
      Atom(name: '_PaintStoreBase.paints', context: context);

  @override
  List<Paint> get paints {
    _$paintsAtom.reportRead();
    return super.paints;
  }

  @override
  set paints(List<Paint> value) {
    _$paintsAtom.reportWrite(value, super.paints, () {
      super.paints = value;
    });
  }

  late final _$getPaintsAsyncAction =
      AsyncAction('_PaintStoreBase.getPaints', context: context);

  @override
  Future getPaints() {
    return _$getPaintsAsyncAction.run(() => super.getPaints());
  }

  @override
  String toString() {
    return '''
paints: ${paints}
    ''';
  }
}
