import 'dart:convert';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../data/saved_data.dart';
import '../controllers/home_controller.dart';
import 'package:flutter_desktop_folder_picker/flutter_desktop_folder_picker.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {

  RxBool isTimerCompleted = false.obs;

  @override
  void onInit() async {
    delayedTrue();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? encodedMap = prefs.getString('items');
    print("EncodedMap :-");
    print(encodedMap);
    Map<dynamic,dynamic> decodedMap = json.decode(encodedMap!);
    print("DecodedMap :-");
    print(decodedMap);
    items.value = decodedMap;
    print("Items :-");
    print(items);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void tap() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> paths = [];
    path = await FlutterDesktopFolderPicker.openFolderPickerDialog();
    var directory = Directory(path!);
    await for (var entity in directory.list(recursive: false, followLinks: true)) {
      String name = getLastFolderName(entity.path);
      paths.add(name);
    }
    items[directory.path] = paths;
    String encodedMap = json.encode(items);
    await prefs.setString('items', encodedMap);
    print(encodedMap);
  }

  String getLastFolderName(String path) {
    List<String> parts = path.split('\\');
    if (parts.isNotEmpty) {
      return parts.last;
    }
    return "";
  }

  Future<void> delayedTrue() async {
    await Future.delayed(const Duration(seconds: 2));
    isTimerCompleted.value = true;
  }

  Future<void> deleteItem(int index) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    items.remove(items.keys.elementAt(index));
    String encodedMap = json.encode(items);
    await prefs.setString('items', encodedMap);
    print(encodedMap);
  }

}
