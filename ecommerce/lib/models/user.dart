class User {
  String? name;
  String? email;
  String? password;

  User({this.name, this.email, this.password});

  factory User.fromJson(dynamic json) {
    return User(
      name: json['name'],
      email: json['email'],
      password: json['password'],
    );
  }
}