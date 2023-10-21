import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
//import 'package:shared_preferences/shared_preferences.dart';
import '../../../../routes/app_pages.dart';
import '../../../data/saved_data.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Video Player',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Obx(
        () => controller.isTimerCompleted.isTrue
            ? ListView.separated(
                itemCount: items.length + 1,
                itemBuilder: (BuildContext context, int index) {
                  if (index == items.length) {
                    return Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.w),
                      child: InkWell(
                        onTap: () async {
                          controller.tap();
                        },
                        child: Container(
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 40, 40, 40),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.add,
                                      size: 5.w,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Text(
                                      'Add Folder',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10.sp,
                                      ),
                                    ),
                                  ]),
                            )),
                      ),
                    );
                  } else {
                    return Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.w),
                      child: InkWell(
                        onTap: () async {
                          Get.toNamed(Routes.VIDEO,
                              arguments: items.keys.elementAt(index));
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 40, 40, 40),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 5.w, vertical: 3.h),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.folder,
                                    size: 5.w,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Text(
                                    controller.getLastFolderName(
                                        items.keys.elementAt(index)),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10.sp,
                                    ),
                                  ),
                                  Spacer(),
                                  InkWell(
                                    onTap: () {
                                      controller.deleteItem(index);
                                      // items.remove(items.keys.elementAt(index));
                                    },
                                    child: Icon(
                                      Icons.delete,
                                      size: 5.w,
                                      color: Colors.white,
                                    ),
                                  ),
                                ]),
                          ),
                        ),
                      ),
                    );
                  }
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 1.h,
                  );
                },
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Retrieving Data",
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
      ),
    );
  }
}
