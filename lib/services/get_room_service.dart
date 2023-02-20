// import 'package:smarthome/model/auth.dart';
// import 'package:smarthome/model/rooms.dart';
// import 'package:smarthome/services/shared_helper.dart';

// import '../helper/api.dart';

// class GetRoomsService {
//   Stream<List<Rooms>> getAllRooms() async* {
//     String? token = await SharedHelper().readToken();
//     List<dynamic> data = await Api()
//         .get(url: 'https://nymphaeaeg.com/api/room', token: token ?? '');
//     List<Rooms> roomsList = [];
//     for (int i = 0; i < data.length; i++) {
//       roomsList.add(
//         Rooms.fromjson(
//           data[i],
//         ),
//       );
//     }
//     yield roomsList;
//   }
// }

// LoginModel? loginResponse;
