import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
import '../../../data/saved_data.dart';
import '../controllers/video_controller.dart';
import 'package:flutter_desktop_folder_picker/flutter_desktop_folder_picker.dart';
import 'package:get/get.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

class VideooController extends GetxController {
  // Create a [Player] to control playback.

  late final player = Player();
  late final controller = VideoController(player);
  var arguments = Get.arguments;
  List sectionName = [];
  List sectionVideosPath = [];
  List sectionVideosName = [];
  List videoSubtitlePath = [];
  RxString videoPath = ''.obs;
  RxBool isTimerCompleted = false.obs;
  RxDouble videoSpeed = 1.0.obs;
  RxString currentSubtitlePath = ''.obs;
  RxString currentAppbarName = 'Current Video'.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    print(arguments);
    sectionName = items[arguments];
    await sectionPlaylist();
    print("SectionLast Name :-");
    print(sectionName);
    print("SectionInfo :-");
    print(sectionVideosPath);
    print("SectionVideosName :-");
    print(sectionVideosName);
    print("SectionSubtitlePath :-");
    print(videoSubtitlePath);
    // player.open(Media(
    //     'file:////E:\\[FreeCourseSite.com] Udemy - Docker & Kubernetes The Practical Guide [2022 Edition]\\01 - Getting Started\\001 Welcome to the Course.mp4'));
    await delayedTrue();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  // void tap(int index) async {
  //   List<String> videoContent = [];
  //   path = arguments + '\\' + sectionListPath[index];
  //   var directory = Directory(path!);
  //   await for (var entity in directory.list(
  //       recursive: false, followLinks: true)) {
  //     String name = getLastFolderName(entity.path);
  //     videoContent.add(name);
  //   }
  // }

  String getLastFolderName(String path) {
    List<String> parts = path.split('\\');
    if (parts.isNotEmpty) {
      return parts.last;
    }
    return "";
  }

  Future<void> sectionPlaylist() async {
    for (var i = 0; i < sectionName.length; i++) {
      List<String> sectionVideosPath1 = [];
      List<String> sectionVideosName1 = [];
      List<String> videoSubtitlePath1 = [];
      path = arguments + '\\' + sectionName[i];
      var directory = Directory(path!);
      await for (var entity
          in directory.list(recursive: false, followLinks: true)) {
        String name = getLastFolderName(entity.path);
        if (name.contains('.mp4')) {
          sectionVideosName1.add(name);
          sectionVideosPath1.add(entity.path);
        } else if (name.contains('.srt')) {
          videoSubtitlePath1.add(entity.path);
        }
      }
      sectionVideosPath.add(sectionVideosPath1);
      sectionVideosName.add(sectionVideosName1);
      videoSubtitlePath.add(videoSubtitlePath1);
    }
  }

  String makeCorrectedString(String path) {
    String correctedPath = path.replaceAll('\\', '\\\\');
    return correctedPath;
  }

  String makePath(String path) {
    String newPath = arguments + '\\' + path;
    return newPath;
  }

  Future<void> delayedTrue() async {
    await Future.delayed(const Duration(seconds: 2));
    isTimerCompleted.value = true;
  }

  Future<void> captureScreenShot() async {
    final Uint8List? screenshot = await player.screenshot();
    if (screenshot != null) {
      Directory? directory = await getDownloadsDirectory();
      File file = File(p.join(directory!.path, '${generateRandomName()}.png'));
      await file.writeAsBytes(screenshot);
      Get.snackbar(
        '',
        '',
        snackPosition: SnackPosition.BOTTOM,
        colorText: const Color.fromARGB(255, 162, 122, 231),
        titleText: const Text(
          'Screenshot saved to downloads folder',
          style: TextStyle(
            color: Colors.white,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
      // await File('image.png').writeAsBytes(screenshot);
    }
  }

  String generateRandomName() {
    final Random _random = Random();
    const String _chars = 'abcdefghijklmnopqrstuvwxyz';
    String result = '';
    for (int i = 0; i < 6; i++) {
      result += _chars[_random.nextInt(_chars.length)];
    }
    return result;
  }
}
