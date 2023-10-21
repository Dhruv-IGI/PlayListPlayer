import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:sizer/sizer.dart';
//import 'package:shared_preferences/shared_preferences.dart';
import '../../../../routes/app_pages.dart';
import '../../../data/saved_data.dart';
import '../controllers/video_controller.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:toggle_switch/toggle_switch.dart';

class VideoView extends GetView<VideooController> {
  VideoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              controller.player.dispose();
              Get.offAllNamed(Routes.HOME);
            },
          ),
          title:Obx(()=> Text(
            controller.currentAppbarName.value,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),),
          centerTitle: true,
        ),
        body: Obx(
          () => controller.isTimerCompleted.isTrue
              ? Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          SizedBox(
                            // width: MediaQuery.of(context).size.width * 60,
                            height: MediaQuery.of(context).size.width *
                                0.75 *
                                9.0 /
                                16.0,
                            // Use [Video] widget to display video output.
                            child: Video(
                                  controller: controller.controller,
                                ),
                            ),
                          Padding(
                            padding: EdgeInsets.only(top : 2.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ToggleSwitch(
                                  initialLabelIndex: 0,
                                  customWidths: const [90.0, 90.0],
                                  cornerRadius: 20.0,
                                  activeBgColors: const [[Color.fromARGB(255, 162, 122, 231)], [Colors.redAccent]],
                                  activeFgColor: Colors.white,
                                  inactiveBgColor: Colors.grey,
                                  inactiveFgColor: Colors.white,
                                  totalSwitches: 2,
                                  labels: const ['Play', 'Pause'],
                                  icons: const [Icons.play_arrow, Icons.pause],
                                  onToggle: (index) {
                                    if (index == 0) {
                                      controller.player.play();
                                    } else {
                                      controller.player.pause();
                                    }
                                  },
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                ToggleSwitch(
                                  initialLabelIndex: 2,
                                  minWidth: 50,
                                  cornerRadius: 20.0,
                                  activeBgColors: const [[Color.fromARGB(255, 162, 122, 231)],[Color.fromARGB(255, 162, 122, 231)],[Color.fromARGB(255, 162, 122, 231)],[Color.fromARGB(255, 162, 122, 231)],[Color.fromARGB(255, 162, 122, 231)],[Color.fromARGB(255, 162, 122, 231)],[Color.fromARGB(255, 162, 122, 231)],[Color.fromARGB(255, 162, 122, 231)],[Color.fromARGB(255, 162, 122, 231)],[Color.fromARGB(255, 162, 122, 231)]],
                                  activeFgColor: Colors.white,
                                  inactiveBgColor: Colors.grey,
                                  inactiveFgColor: Colors.white,
                                  totalSwitches: 9,
                                  labels: const ['0.5', '0.75', '1', '1.5', '2', '2.5', '3', '3.5', '4'],
                                  //icons: const [null, Icons.close],
                                  onToggle: (index) {
                                    switch(index) {
                                      case 0:
                                        controller.videoSpeed.value = 0.5;
                                        controller.player.setRate(controller.videoSpeed.value);
                                        break;
                                      case 1:
                                        controller.videoSpeed.value = 0.75;
                                        controller.player.setRate(controller.videoSpeed.value);
                                        break;
                                      case 2:
                                        controller.videoSpeed.value = 1.0;
                                        controller.player.setRate(controller.videoSpeed.value);
                                        break;
                                      case 3:
                                        controller.videoSpeed.value = 1.5;
                                        controller.player.setRate(controller.videoSpeed.value);
                                        break;
                                      case 4:
                                        controller.videoSpeed.value = 2.0;
                                        controller.player.setRate(controller.videoSpeed.value);
                                        break;
                                      case 5:
                                        controller.videoSpeed.value = 2.5;
                                        controller.player.setRate(controller.videoSpeed.value);
                                        break;
                                      case 6:
                                        controller.videoSpeed.value = 3.0;
                                        controller.player.setRate(controller.videoSpeed.value);
                                        break;
                                      case 7:
                                        controller.videoSpeed.value = 3.5;
                                        controller.player.setRate(controller.videoSpeed.value);
                                        break;
                                      case 8:
                                        controller.videoSpeed.value = 4.0;
                                        controller.player.setRate(controller.videoSpeed.value);
                                        break;
                                    }
                                  },
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                ToggleSwitch(
                                  initialLabelIndex: 0,
                                  customWidths: const [90.0, 50.0],
                                  cornerRadius: 20.0,
                                  activeBgColors: const [[Color.fromARGB(255, 162, 122, 231)], [Colors.redAccent]],
                                  activeFgColor: Colors.white,
                                  inactiveBgColor: Colors.grey,
                                  inactiveFgColor: Colors.white,
                                  totalSwitches: 2,
                                  labels: const ['Captions', ''],
                                  icons: const [null, Icons.close],
                                  onToggle: (index) {
                                    if (index == 0) {
                                      controller.player.setSubtitleTrack(
                                          SubtitleTrack.uri(
                                              controller.currentSubtitlePath.value));
                                    } else {
                                      controller.player.setSubtitleTrack(
                                          SubtitleTrack.no());
                                    }
                                  },
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                ToggleSwitch(
                                  initialLabelIndex: 0,
                                  customWidths: const [150.0],
                                  cornerRadius: 20.0,
                                  activeBgColors: const [[Color.fromARGB(255, 162, 122, 231)]],
                                  activeFgColor: Colors.white,
                                  inactiveBgColor: Colors.grey,
                                  inactiveFgColor: Colors.white,
                                  totalSwitches: 1,
                                  labels: const ['ScreenShot'],
                                  icons: const [Icons.camera_alt],
                                  onToggle: (index) {
                                        controller.captureScreenShot();
                                      }
                                      ),]
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemCount: controller.sectionName.length,
                        itemBuilder: (BuildContext context, int index) {
                          // final ExpansionTileController controllerr = ExpansionTileController();
                          int sectionIndex = index;
                          return ExpansionTile(
                            // backgroundColor: const Color.fromARGB(255, 40,40,40),
                            collapsedBackgroundColor:
                                const Color.fromARGB(255, 40, 40, 40),
                            textColor: const Color.fromARGB(255, 162, 122, 231),
                            //controller: controllerr,
                            title: Text(controller.sectionName[index]),
                            children: [
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount:
                                    controller.sectionVideosName[index].length,
                                itemBuilder: (BuildContext context, int index) {
                                  print("~~~~~~~~~~~~~~~~~!!!!!!!!!!!!!!!! :-");
                                  print(controller.sectionVideosName[sectionIndex][index]);
                                  print(sectionIndex);
                                  return ListTile(
                                    title: Text(controller.sectionVideosName[sectionIndex]
                                        [index]),
                                    onTap: () {
                                      controller.currentAppbarName.value = controller.sectionVideosName[sectionIndex][index];
                                      controller.videoPath.value =
                                          controller.makeCorrectedString(
                                              controller.sectionVideosPath[
                                                  sectionIndex][index]);
                                      controller.player.open(
                                          Media(controller.videoPath.value));
                                      controller.player.setSubtitleTrack(
                                          SubtitleTrack.data(
                                              controller.videoSubtitlePath[
                                                  sectionIndex][index]));
                                      controller.currentSubtitlePath.value = controller.makeCorrectedString(controller
                                          .videoSubtitlePath[sectionIndex]
                                              [index]);
                                      controller.player.setSubtitleTrack(
                                          SubtitleTrack.uri(
                                              controller.currentSubtitlePath.value));

                                    },
                                  );
                                },
                              ),
                            ],
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const Divider();
                        },
                      ),
                    )
                  ],
                )
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Please Wait",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.sp,
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      const CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
        ));
  }
}
