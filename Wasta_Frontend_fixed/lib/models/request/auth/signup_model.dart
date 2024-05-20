import 'dart:convert';

SignupModel signupModelFromJson(String str) =>
    SignupModel.fromJson(json.decode(str));

String signupModelToJson(SignupModel data) => json.encode(data.toJson());

class SignupModel {
  SignupModel({
    required this.username,
    required this.email,
    required this.password, // Add this line
  });

  final String username;
  final String email;
  final String password; // Add this line

  factory SignupModel.fromJson(Map<String, dynamic> json) => SignupModel(
        username: json["username"],
        email: json["email"],
        password: json["password"], // Update this line
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "password": password, // Update this line
      };
}
