import 'package:shared_preferences/shared_preferences.dart';

class SharedHelper {
  late SharedPreferences _shared;

  saveToken({required String token}) async {
     _shared = await SharedPreferences.getInstance();
    //print('save >>>>>> $token in local');
    _shared.setString('token', token);
  }

  Future<dynamic> readToken() async {
    _shared = await SharedPreferences.getInstance();

    return Future.value(_shared.getString('token'));
  }

  Future<dynamic> removeToken() async {
    _shared = await SharedPreferences.getInstance();

    return Future.value(_shared.remove('token'));
  }
}
