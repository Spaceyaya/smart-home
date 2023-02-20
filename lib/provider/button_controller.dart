import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smarthome/model/button.dart';
import 'package:smarthome/model/rooms.dart';
import 'package:smarthome/services/shared_helper.dart';

import '../helper/api.dart';

class ButtonControler extends ChangeNotifier {
  List<bool> buttons = [false];
  updateButton(int index) {
    buttons[index] = !buttons[index];
    notifyListeners();
  }
}

// class TbBtnService {
//   Future<TabModel> tbBtn({
//     required String value,
//   }) async {
//     String? token = await SharedHelper().readToken();
//     var data = await Api().post(
//         url: 'https://nymphaeaeg.com/api/tab',
//         body: {'value': value},
//         token: token ?? '');
//     print(data);
//     return TabModel.fromJson(data);
//   }
// }

class ImagePickerControler extends ChangeNotifier {
  late File imageFile;

  Future imageFromGallery(BuildContext context) async {
    final XFile? image =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    final File? imageFile = File(image!.path);
    Navigator.pop(context);
    notifyListeners();
  }

  Future imageFromCamera(BuildContext context) async {
    final XFile? image =
        await ImagePicker().pickImage(source: ImageSource.camera);
    final File? imageFile = File(image!.path);
    notifyListeners();
  }

  showOptions(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Make a choice'),
        content: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.browse_gallery),
                title: const Text('Gallery'),
                onTap: () {
                  imageFromGallery(context);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera),
                title: const Text('Camera'),
                onTap: () {
                  imageFromCamera(context);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GetData extends ChangeNotifier {
  Future<List<RoomsModel>> getAllRooms() async {
    String? token = await SharedHelper().readToken();

    List<dynamic> data = await Api()
        .get(url: 'https://nymphaeaeg.com/api/room', token: token ?? '');
    List<RoomsModel> roomsList = [];

    for (int i = 0; i < data.length; i++) {
      roomsList.add(RoomsModel.fromJson(data[i]));
    }
    notifyListeners();
    return roomsList;
  }
}

class DeleteRoom extends ChangeNotifier {
  Future<http.Response> deleteRoom({required int id}) async {
    String? token = await SharedHelper().readToken();
    final http.Response response = await http.delete(
      Uri.parse('https://nymphaeaeg.com/api/room/$id'),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/x-www-form-urlencoded'
      },
    );

    return response;
  }
}

class GetButtons extends ChangeNotifier {
  ButtonsModel? buttonsResponse;

  Future<List<ButtonsModel>> getAllButtons(int? roomID) async {
    String? token = await SharedHelper().readToken();

    List<dynamic> data = await Api().get(
        url: 'https://nymphaeaeg.com/api/button/$roomID', token: token ?? '');
    List<ButtonsModel> buttonsList = [];
    for (int i = 0; i < data.length; i++) {
      buttonsList.add(ButtonsModel.fromJson(data[i]));
    }
    notifyListeners();
    return buttonsList;
  }
}
