import 'dart:convert';

import 'package:http/http.dart' as http;

// class RegisterService {
//   Future<void> register(
//       {required String name,required String email,required String pass,required String phoneNumber}) async {
//     Map<String, dynamic> data = await Api().post(
//       url: 'https://nymphaeaeg.com/api/register',
//       body: {
//         'name': name,
//         'email': email,
//         'mobile': phoneNumber,
//         'password': pass
//       },
//     );
//   }
// }
class RegisterService {
  register({
    required String name,
    required String email,
    required String pass,
    required String phoneNumber,
  }) async {
    String url = 'https://nymphaeaeg.com/api/register';
    http.Response response = await http.post(Uri.parse(url), body: {
      'name': name,
      'email': email,
      'mobile': phoneNumber,
      'password': pass
    });

    if (response.statusCode == 201) {
      var data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception(
        'there is a problem with status code ${response.statusCode} with body ${jsonDecode(response.body)}',
      );
    }
  }
}
