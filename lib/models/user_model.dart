class User {
  String? id;
  final String name;
  final String email;
  String? password;
  String? avatar;

  User({
    this.id,
    this.password,
    this.avatar,
    required this.name,
    required this.email,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'avatar': avatar,
        'password': password,
        'id': id,
      };

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        password: json['password'],
        avatar: json['avatar'],
      );
}
