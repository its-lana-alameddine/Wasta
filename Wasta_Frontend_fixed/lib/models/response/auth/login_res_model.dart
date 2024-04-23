import 'dart:convert';

class LoginResponseModel {
  final String id;
  final String token;
  final String profile;

  LoginResponseModel({
    required this.id,
    required this.token,
    required this.profile,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      id: json["_id"],
      token: json["token"],
      profile: json["profile"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      "token": token,
      "profile": profile,
    };
  }
}

LoginResponseModel loginResponseModelFromJson(String jsonString) {
  final jsonData = json.decode(jsonString);
  return LoginResponseModel.fromJson(jsonData);
}

