// class ButtonsModel {
//   final String name, on, off;
//   final dynamic id;

//   ButtonsModel(
//       {required this.on,
//       required this.off,
//       required this.name,
//       required this.id});
//   factory ButtonsModel.fromjson(jsonData) {
//     return ButtonsModel(
//         name: jsonData['name'],
//         id: jsonData['id'],
//         off: jsonData['off_id'],
//         on: jsonData['on_id']);
//   }
// }



class ButtonsModel {
  int? id;
  String? name;
  String? roomId;
  int? userId;
  String? offId;
  String? onId;
  String? createdAt;
  String? updatedAt;
  bool? currentState;



  ButtonsModel(
      {required this.id,
      this.name,
      this.roomId,
      this.userId,
      this.offId,
      this.onId,
      this.createdAt,
      this.updatedAt,
      this.currentState});

  ButtonsModel.fromJson(Map<String, dynamic> json) {
    print(json);
    id = json['id'];
    name = json['name'];
    roomId = json['room_id'].toString();
    userId = json['user_id'];
    offId = json['off_id'].toString();
    onId = json['on_id'].toString();
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    currentState =  json['current_state']== 0 ? false : true; //TO EDIT
  }
}
