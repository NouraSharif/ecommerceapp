import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

alertExitApp() {
  return Get.defaultDialog(
    title: "Alert",
    middleText: "Do you want to exit the app?",
    actions: [
      ElevatedButton(
        onPressed: () {
          exit(0);
        },
        child: Text("confirm"),
      ),
      ElevatedButton(
        onPressed: () {
          Get.back();
        },
        child: Text("cancel"),
      ),
    ],
  );
}
