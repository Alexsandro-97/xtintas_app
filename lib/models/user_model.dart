class User {
  String? id;
  String? name;
  String? email;
  String? password;
  String? avatar;

  User({
    this.id,
    this.password,
    this.avatar,
    this.name,
    this.email,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    data['id'] = id;
    return data;
  }

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    password = json['password'];
    id = json['id'];
  }
}
