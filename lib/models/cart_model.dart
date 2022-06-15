import 'package:xtintas_app/models/paint_model.dart';

class Cart {
  int? quantity;
  Paint? paint;
  String? id;

  Cart({this.quantity, this.paint, this.id});

  Cart.fromJson(Map<String, dynamic> json) {
    quantity = json['quantity'];
    paint = json['paint'] != null ? Paint.fromJson(json['paint']) : null;
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['quantity'] = quantity;
    if (paint != null) {
      data['paint'] = paint!.toJson();
    }
    data['id'] = id;
    return data;
  }
}
