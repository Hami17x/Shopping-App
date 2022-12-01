class UserResponseModel {
  final int responseVal;
  final String responseText;
  final String token;

  UserResponseModel(
      {required this.responseVal,
      required this.responseText,
      required this.token});

  factory UserResponseModel.fromJson(json) => UserResponseModel(
      responseVal: json["response_val"],
      responseText: json["response_text"],
      token: json["token"]);

  @override
  String toString() {
    return "Response Value: $responseVal, Response Text: $responseText, Token: $token";
  }
}
