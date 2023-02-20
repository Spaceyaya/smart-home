// class RoomsModel {
//   final String roomName;
//   final int id;

//   RoomsModel({required this.roomName, required this.id});
//   factory RoomsModel.fromjson(jsonData) {
//     return RoomsModel(
//       roomName: jsonData['name'],
//       id: jsonData['id'],
//     );
//   }
// }
class TabModel {
  String? value;

  TabModel({this.value});

  TabModel.fromJson(String valueToCome) {
    value = valueToCome;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['value'] = this.value;

    return data;
  }
}
