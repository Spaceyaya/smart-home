import 'package:smarthome/helper/api.dart';
import 'package:smarthome/model/tab_model.dart';
import 'package:smarthome/services/shared_helper.dart';

class TbBtnService {
  Future<TabModel> tbBtn({
    required String value,
  }) async {
    String? token = await SharedHelper().readToken();
    var data = await Api().post(
        url: 'https://nymphaeaeg.com/api/tab',
        body: {'value': value},
        token: token ?? '');
    print(data);
    return TabModel.fromJson(data);
  }
}
