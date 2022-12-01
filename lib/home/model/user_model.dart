class UserModel {
  String? name;
  final String token;

  UserModel({this.name, required this.token});

  factory UserModel.fromJson(json) =>
      UserModel(token: json["data"]["token"], name: json["data"]["name"]);
}
