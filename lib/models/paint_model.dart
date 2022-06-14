class Paint {
  String? name;
  String? image;
  int? price;
  List<Benefits>? benefits;

  Paint({
    this.name,
    this.image,
    this.price,
    this.benefits,
  });

  Paint.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    price = json['price'];
    if (json['benefits'] != null) {
      benefits = <Benefits>[];
      json['benefits'].forEach((v) {
        benefits!.add(Benefits.fromJson(v));
      });
    }
  }
}

class Benefits {
  String? name;
  String? icon;

  Benefits({
    this.name,
    this.icon,
  });

  Benefits.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    icon = json['icon'];
  }
}
