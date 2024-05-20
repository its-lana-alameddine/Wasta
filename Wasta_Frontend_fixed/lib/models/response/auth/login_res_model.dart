import 'dart:convert';

class LoginResponseModel {
  final String id;
  final String token;
  final String profile;
  final String username;
  final bool isAgent;

  LoginResponseModel({
    required this.id,
    required this.token,
    required this.profile,
    required this.username,
    required this.isAgent,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
        id: json["_id"],
        token: json["token"],
        profile: json["profile"],
        username: json["username"],
        isAgent: json["isAgent"]);
  }

  Map<String, dynamic> toJson() {
    return {"_id": id, "token": token, "profile": profile, "username": username, "isAgent": isAgent};
  }
}

LoginResponseModel loginResponseModelFromJson(String jsonString) {
  final jsonData = json.decode(jsonString);
  return LoginResponseModel.fromJson(jsonData);
}
