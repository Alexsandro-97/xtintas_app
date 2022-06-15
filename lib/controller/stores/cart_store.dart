import 'package:mobx/mobx.dart';
import 'package:xtintas_app/repositories/errors/errors.dart';
import 'package:xtintas_app/repositories/services/get_cart_service.dart';

import '../../models/cart_model.dart';
import '../../repositories/client/dio_client.dart';
import '../../repositories/client/i_client_repository.dart';

part 'cart_store.g.dart';

class CartStore = _CartStoreBase with _$CartStore;

abstract class _CartStoreBase with Store {
  final IClient client = DioClient();
  late GetCartService getCart = GetCartService(client);

  @observable
  List<Cart> carts = [];

  @action
  getCarts() async {
    try {
      List<Cart> response = await getCart.fetchCart();
      carts = response;
    } on ExceptionNotFound {
      print('Error 404 Not Found!');
    } catch (e) {
      print(e);
    }
  }
}
