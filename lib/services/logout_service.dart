import 'package:smarthome/helper/api.dart';
import 'package:smarthome/services/shared_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogoutService {
  Future<void> logout() async {
  
    String? token = await SharedHelper().readToken();
    var data = await Api().post(
        url: 'https://nymphaeaeg.com/api/logout', body: "", token: token ?? '');

    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();

    //ERROR

    // Map<String, String> headers = {};
    // if (token != null) {
    //   headers.addAll({
    //     'Authorization': 'Bearer $token',
    //     'Content-Type': 'application/x-www-form-urlencoded'
    //   });
    // }
    // http.Response response = await http.post(Uri.parse(url));

    // if (response.statusCode == 200) {
    //   var data = await jsonDecode(response.body);
    //   print(data);
    //   return data;
    // }
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
