import 'dart:convert';

import 'package:smarthome/model/auth.dart';

import 'package:http/http.dart' as http;
import 'package:smarthome/services/shared_helper.dart';

class LoginService {
  Future<LoginModel> login({
    required String email,
    required String pass,
  }) async {
    String url = 'https://nymphaeaeg.com/api/login';

    // Map<String, String> headers = {};
    // if (token != null) {
    //   headers.addAll({
    //     'Authorization': 'Bearer $token',
    //     'Content-Type': 'application/x-www-form-urlencoded'
    //   });
    // }
    http.Response response = await http.post(Uri.parse(url), body: {
      'email': email,
      'password': pass,
    });

    if (response.statusCode == 200) {
      var data = LoginModel.fromJson(await jsonDecode(response.body));
      await SharedHelper().saveToken(token: data.accessToken.toString());
      
      return data;
    } else {
    
      throw Exception('Failed to load data');
    }
  }
}
// class LoginService {
//   Future<LoginResponse> login(LoginRequest request) async {
//     String url = 'https://nymphaeaeg.com/api/login';
//     final response = await http.post(Uri.parse(url), body: request.tojson());
//     if (response.statusCode == 200 || response.statusCode == 400) {
//       return LoginResponse.fromjson(jsonDecode(response.body));
//     } else {
//       throw Exception('Failed to load data');
//     }
//   }
// }
