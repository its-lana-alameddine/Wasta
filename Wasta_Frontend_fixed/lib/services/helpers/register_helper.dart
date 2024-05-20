import 'dart:convert';

import 'package:http/http.dart' as https;
import '../../models/request/auth/signup_model.dart'; // Import your SignupModel
// Import your SignupResponseModel if you have one
import '../config.dart';

class RegistrationHelper {
  static var client = https.Client();

  static Future<bool> register(SignupModel model) async {
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};

    var url = Uri.parse(Config.apiUrl + Config.signupUrl); // Use your registration URL
    var response = await client.post(url,
        headers: requestHeaders, body: jsonEncode(model));

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
