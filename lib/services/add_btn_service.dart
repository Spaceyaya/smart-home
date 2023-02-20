import 'package:smarthome/model/button.dart';
import 'package:smarthome/services/shared_helper.dart';

import '../helper/api.dart';

class AddButtonService {
  Future<ButtonsModel> postBtn(
      {required String name,
      required String id,
      required String off,
      required String on}) async {
    String? token = await SharedHelper().readToken();
    Map<String, dynamic> data = await Api().post(
        url: 'https://nymphaeaeg.com/api/button',
        body: {
          'name': name,
          'room_id': id,
          'off_id': off,
          'on_id': on,
        },
        token: token ?? '');
    return ButtonsModel.fromJson(data);
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
