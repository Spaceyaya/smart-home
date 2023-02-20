import 'package:smarthome/model/rooms.dart';
import 'package:smarthome/services/shared_helper.dart';

import '../helper/api.dart';

class AddRoomService {
  Future<RoomsModel> addRoom({
    required String roomName,
  }) async {
    String? token = await SharedHelper().readToken();
    Map<String, dynamic> data = await Api().post(
        url: 'https://nymphaeaeg.com/api/room',
        body: {
          'name': roomName,
        },
        token: token ?? '');
    return RoomsModel.fromJson(data);
  }
}
